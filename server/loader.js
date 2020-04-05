const moment = require('moment');
const mysql = require('mysql');
const db = require('./models/schemas')
const csv = require('csv-parse')
const fs = require('fs')
const fetch = require('node-fetch')
const api = require('./util/api')
const api_creds = require('./api_creds')

const tables = ['Songs', 'Person', 'Artists', 'Sings', 'Crew_in', 'Entries'];
const tableDDLs = {
  'Songs' : `
    CREATE TABLE Songs (
      id varchar(255),
      title varchar(255),
      album varchar(255),
      label varchar(255),
      youtube_url varchar(255),
      song_art_image_thumbnail_url varchar(255),
      release_date_for_display varchar(255),
      PRIMARY KEY (id)
    ); `,
  'Person' : `
    CREATE TABLE Person (
      id varchar(255),
      name varchar(255),
      image_url varchar(255),
      instagram_name varchar(255),
      PRIMARY KEY (id)
    );
  `,
  'Artists' : `
    CREATE TABLE Artists(
      artist_id varchar(255),
      instagram_follower_count int,
      facebook_follower_count int,
      PRIMARY KEY (artist_id),
      FOREIGN KEY (artist_id) REFERENCES Person(id)
    );
  `,
  'Sings' : `
    CREATE TABLE Sings(
      artist_id varchar(255),
      song_id varchar(255),
      PRIMARY KEY (artist_id,song_id),
      FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
      FOREIGN KEY (song_id) REFERENCES Songs(id)
    );
  `,
  'Crew_in' : `
    CREATE TABLE Crew_in (
      crew_id varchar(255),
      song_id varchar(255),
      type varchar(255),
      PRIMARY KEY (crew_id, song_id),
      FOREIGN KEY (crew_id) REFERENCES Person(id),
      FOREIGN KEY (song_id) REFERENCES Songs(id)
    )
  `,
  'Entries' : `
    CREATE TABLE Entries (
      song_id varchar(255),
      position int,
      date int,
      streams int,
      PRIMARY KEY (song_id, date),
      FOREIGN KEY (song_id) REFERENCES Songs(id)
    )
  `
}
const songSql = []
const artistSql = []
const personSql = []
const singsSql = []
const entriesSql = []
const crewinSql = []


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

/*
  Description: Make a call to the Genius search api to find the song id, artist id
  Param: songName = 'Closer', author = 'The Chainsmokers';
  Return:  the first entry that comes back from Genius api for '/search' 
*/ 
const searchSong = function(songName, author) {
  return api.searchGenuisSong(songName, author)
            .then(data => data.response.hits[0].result)
  
}


// Make an entry in the entries table for the song id, position, date, etc.
const addEntryEntry = function(data, song_id) {
  const date = data[5]; 
  const num_streams = data[3]; 
  db.query(`INSERT INTO Entries (song_id, position, date, streams)
            VALUES (${song_id}, ${data[0]}, ${moment(date).unix()}, ${num_streams})`)
    .then(data => { console.log('successfully added entry'); return data })
    .catch(err => err.errno === 1062 ? console.log("duplicate entry") : Promise.reject(err))
}

const addAuthorEntry = function (data) {
  //TODO
}

const addSongToDB = function (song) {
  const label = song.custom_performances.find(el => el.label === 'Label')
  const label_name = label === undefined ? "NULL" : label.artists[0].name;
  var label_names = []; 
  // console.log(song)
  // console.log(label)
  if (!!label && !!label.artists) 
    label.artists.forEach(el => label_names.push(el.name))
  
  const youtube_obj = song.media.find(media => media.provider === 'youtube')
  const youtube_url = youtube_obj ? youtube_obj.url : "NULL"
  return db.query(`INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
                   VALUES ("${song.id}", "${song.title}", "${song.album.name}", "${label_names.join() || 'NULL'}", "${youtube_url}", "${ song.song_art_image_thumbnail_url }", "${song.release_date_for_display}")`)
           .then(data => { console.log('successfully added song'); return data })
           .catch(err => err.errno === 1062 ? console.log("duplicate song") : Promise.reject(err))
}

const addSongEntry = async function (song_id) {
  //Make API request to get song data 
  return api.getSong(song_id)
            .then(data => data.response.song)
            .then(addSongToDB)
            // .catch(err => console.log("HERE",err))
      
}


const readCsv = function() {
  const authors = new Set()
  const songs = new Set()
  fs.createReadStream('data_part.csv') //Reads csv file line by line
  .pipe(csv({ separator: ',' }))
  .on('data', async data => { //'data' is an event enum
    const songName = data[1];  
    const author = data[2];
    searchSong(author, songName)
      .then(song => {
        const artist_id = song.primary_artist.id
        const song_id = song.id
        const promises = []
        // if (!authors.has[artist_id]) {
        //   authors.add(artist_id);
        //   addAuthorEntry(artist_id)
        // }
        if (!songs.has(song_id)) {
          songs.add(song_id);
          promises.push(addSongEntry(song_id))
        }
        promises.push(addEntryEntry(data, song_id))
        return Promise.all(promises)
      })
      .catch(err => console.log("ERROR",err))
    
  })
  .on('end', () => {
    console.log("finished parsing");
    
  });
}

const loadData = async function() {
  await dropTables();
  await createTables();
  await readCsv()
  // await db.connection.end();
}

loadData();



// api.searchGenuisSong('24K Magic', 'Bruno Mars')
//             .then(data => data.response.hits[0])
//             .then(console.log)

// api.getSong('2872960')
//   .then(data => data.response.song)
//   .then(song => song.media.find(media => media.provider === 'youtube') || "NULL")
//   .then(console.log)
//   .catch(console.log)

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