const moment = require('moment');
const csv = require('csv-parse')
const fs = require('fs')
const api = require('./util/api')

const NULL = 'NULL'
const NULLABLE = item => item ? `'${item}'` : NULL 
const tables = ['Songs', 'Person', 'Artists', 'Sings', 'Crew_in', 'Entries'];
const tableDDLs = {
  'Songs' : 
`CREATE TABLE Songs (
  id varchar(255),
  title varchar(255),
  album varchar(255),
  label varchar(255),
  youtube_url varchar(255),
  song_art_image_thumbnail_url varchar(255),
  release_date_for_display varchar(255),
  PRIMARY KEY (id)
);`,
  'Person' : 
`CREATE TABLE Person (
  id varchar(255),
  name varchar(255),
  image_url varchar(255),
  url varchar(255),
  PRIMARY KEY (id)
);`,
  'Artists' : 
`CREATE TABLE Artists(
  artist_id varchar(255),
  genius_followers int,
  genius_iq int,
  PRIMARY KEY (artist_id),
  FOREIGN KEY (artist_id) REFERENCES Person(id)
);`,
  'Sings' : 
`CREATE TABLE Sings(
  artist_id varchar(255),
  song_id varchar(255),
  PRIMARY KEY (artist_id,song_id),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);`,
  'Crew_in' : 
`CREATE TABLE Crew_in (
  crew_id varchar(255),
  song_id varchar(255),
  type varchar(255),
  PRIMARY KEY (crew_id, song_id, type),
  FOREIGN KEY (crew_id) REFERENCES Person(id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);`,
  'Entries' : 
`CREATE TABLE Entries (
  song_id varchar(255),
  position int,
  date int,
  streams int,
  PRIMARY KEY (song_id, date, position),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);`
}
const songSql = new Set()
const artistSql = new Set()
const personSql = new Set()
const singsSql = new Set()
const entriesSql = new Set()
const crewinSql = new Set()
const artists = new Set()
const songs = new Set()
const songAuthors = {}
const sas = new Set()
const rows_later = []
const db = require('./models/schemas')
db.connection.end()
const dropTables = function() {
  return Promise.all(tables.slice(0).reverse().map(table => 
    db.query('DROP TABLE ' + table)
      .then(() => console.log('dropped ' + table))
      .catch(err => err.errno === 1051 ? console.log(table + ' table doesn\'t exist') : console.log(err))
  ))
  
}
const createTables = function() {
  return Promise.all(tables.map(table => 
    db.query(tableDDLs[table])
      .then(() => console.log('created ' + table))
      .catch(console.log)
  ))
  
}

// 1. Make a call to the Genius search api to find the song id, artist id
// 2. Add song object to Song table 
// 3. Make an entry in the entries table for the song id, position, date, etc.
// 4. If we have not made a query to this song id: Use the song id to query the genius api and get the song data. Create an entry in the songs table for that song, and entries in the database for each producer/songwriter
// 5. If we have not made a query to this artist: Use the artist id to create 

// returns true if added successfully
const addBool = function (set, item) {
  const b = !set.has(item); 
  if (b) set.add(item); 
  return b
}
/*
  Description: Make a call to the Genius search api to find the song id, artist id
  Param: songName = 'Closer', author = 'The Chainsmokers';
  Return:  the first entry that comes back from Genius api for '/search' 
*/ 

let dropped = 0
const searchSong = function(songName, author, data) {
  const sa = songName + "," + author
  if (!addBool(sas, sa)) {
    rows_later.push(data)
    return Promise.reject(new Error("accessed"))
  }
  return api.searchGenuisSong(songName, author)
            .then(data => data.response.hits[0].result)
            .then(song => { songAuthors[sa] = song.id; return song })

  
}


// Make an entry in the entries table for the song id, position, date, etc.
const addEntryEntry = function(data, song_id) {
  const date = data[5]; 
  const num_streams = data[3]; 
  entriesSql.add(`INSERT INTO Entries (song_id, position, date, streams)\nVALUES ('${song_id}', ${data[0]}, ${moment(date).unix()}, ${num_streams});`)
}

const addArtistToDB = function (artist) {
  if (!artist) return console.log("artist is undefined")
  personSql.add(`INSERT INTO Person (id, name, image_url, url)\nVALUES ('${artist.id}', ${NULLABLE(artist.name)}, ${NULLABLE(artist.image_url)}, ${NULLABLE(artist.url)});`)
  artistSql.add(`INSERT INTO Artists (artist_id, genius_followers, genius_iq)\nVALUES ('${artist.id}', ${NULLABLE(artist.followers_count)}, ${NULLABLE(artist.iq)});`)
}

const addArtistEntry = function (artist_id) {
  return api.getArtist(artist_id)
            .then(data => data.response.artist)
            .then(addArtistToDB)
}

const addSongToDB = function (song) {
  const label = song.custom_performances.find(el => el.label === 'Label')
  var label_names = []; 

  if (!!label && !!label.artists) 
    label.artists.forEach(el => label_names.push(el.name))
  
  const youtube_obj = song.media.find(media => media.provider === 'youtube')
  const youtube_url = youtube_obj ? youtube_obj.url : 'NULL'
  const album = song.album ? song.album.name : 'NULL'
  songSql.add(`INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)\nVALUES ('${song.id}', '${song.title}', ${NULLABLE(album)}, ${NULLABLE(label_names.join())}, ${NULLABLE(youtube_url)}, ${NULLABLE( song.song_art_image_thumbnail_url )}, ${NULLABLE(song.release_date_for_display)});`)
  addProducerEntries(song)

}



const addProducerEntries = function (song) {

  if (!!song.producer_artists && !!song.writer_artists) {
    const producers = [...song.producer_artists, ...song.writer_artists]
    producers
        .map(producer => 
              `INSERT INTO Person (id, name, image_url, url)\nVALUES ('${producer.id}', ${NULLABLE(producer.name)}, ${NULLABLE(producer.image_url)}, ${NULLABLE(producer.url)});`)
        .reduce((set, elt) => set.add(elt), personSql)
    song.producer_artists
        .map(producer => 
              `INSERT INTO Crew_in (crew_id, song_id, type)\nVALUES ('${producer.id}', '${song.id}', 'producer');`)
        .reduce((set, elt) => set.add(elt), crewinSql)
    song.writer_artists
        .map(producer => 
              `INSERT INTO Crew_in (crew_id, song_id, type)\nVALUES ('${producer.id}', '${song.id}', 'writer');`)
        .reduce((set, elt) => set.add(elt), crewinSql)
  }
}

const addSongEntry = async function (song_id) {
  //Make API request to get song data 
  return api.getSong(song_id)
            .then(data => data.response.song)
            .then(addSongToDB)
            // .catch(err => console.log('HERE',err))
      
}

const addSingsEntry = function(artist_id, song_id) {
  singsSql.add(`INSERT INTO Sings (artist_id, song_id)\nVALUES ('${artist_id}', '${song_id}');`)
}

const entriesForRow = function(data) {
  const songName = data[1];  
  const author = data[2];
  return searchSong(author, songName, data)
    .then(song => {
      const artist_id = song.primary_artist.id
      const song_id = song.id
      addSingsEntry(artist_id, song_id)
      const promises = []
      if (!artists.has(artist_id)) {
        artists.add(artist_id);
        promises.push(addArtistEntry(artist_id))
      }
      if (!songs.has(song_id)) {
        songs.add(song_id);
        promises.push(addSongEntry(song_id))
      }
      addEntryEntry(data, song_id)
      return Promise.all(promises)
    })
} 

const readCsv = function() {
  const promises = []
  fs.createReadStream('data.csv') //Reads csv file line by line
  .pipe(csv({ separator: ',' }))
  .on('data', async data => { //'data' is an event enum
    promises.push(entriesForRow(data)
                   .catch(err => err.message !== "accessed" ? 
                   console.log('ERROR',err.message, data[1], data[2]) : ""))
  })
  .on('end', async () => {
    console.log('finished parsing');
    await Promise.all(promises)
    rows_later.forEach(row => { 
      let sa = row[2] + "," + row[1]
      if (sa in songAuthors) addEntryEntry(row, songAuthors[sa]) 
    })
    writeToFile()
  });
}

const writeToFile = function() {
  const drops = tables.slice(0).reverse().map(table => 'DROP TABLE IF EXISTS ' + table + ';')
  const adds = tables.map(table => tableDDLs[table])
  const total = [...drops, ...adds, ...songSql, ...personSql, ...artistSql, ...singsSql, ...crewinSql, ...entriesSql]

  const str = total.reduce((acc, query) => acc += query + '\n', "")

  const fs1 = require('fs').promises
  return fs1.writeFile('loader.sql', str).catch(console.log)
}


readCsv();



// api.searchGenuisSong('24K Magic', 'Bruno Mars')
//             .then(data => data.response.hits[0])
//             .then(console.log)
 
// api.getSong('2890553')
//    .then(data => data.response.song)
//   //  .then(song => song.media.find(media => media.provider ==NULLABLE( 'youtube'))//)    .then(data => JSON.stringify(data, null, 2))
//    .then(console.log)
//    .catch(console.log)

// fetch(new URL('search?q=24K Magic Bruno Mars', 'https://api.genius.com/'), 
//   {
//     method: 'GET',
//     withCredentials: true,
//     credentials: 'include',
//     headers: {
//         'Authorization': 'Bearer ' + api_creds.token,
//         'Content-Type': 'application/json'
//     }
//   })
//   .then(res => res.json())
//   .then(data => data.response.hits[0].result)
//   .then(data => JSON.stringify(data, null, 4))
//   .then(console.log)
//   .catch(console.log)

// function fail () {
//   return Promise.reject('err')
// }


// async function test () {
//   return await fail()
// }

// function test2 () {
//   test().then(() => console.log('success'))
//     .catch(() => console.log('err'))
// }

// test2()