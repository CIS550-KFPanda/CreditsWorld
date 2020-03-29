const moment = require('moment');
const credentials = require('./credentials.js')
const mysql = require('mysql');
const db = require('./models/schemas')
const csv = require('csv-parse')
const fs = require('fs')

const connection = mysql.createConnection(credentials);
connection.connect();
const tables = ['Songs', 'Person', 'Artists', 'Sings', 'Crew_in'];
const tableDDLs = {
  'Songs' : `
    CREATE TABLE Songs (
      id varchar(255),
      title varchar(255),
      album varchar(255),
      label varchar(255),
      youtube_url varchar(255),
      song_art_image_thumbnail_url varchar(255),
      release_data_for_display varchar(255),
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
  `
}


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

const addAuthorEntry = function (data) {
  //TODO
}
const addSongEntry = function (data) {
  //TODO
}
const addEntryEntry = function(data) {
  //TODO
}

const readCsv = function() {
  const authors = new Set()
  const songs = new Set()
  fs.createReadStream('data_part.csv')
  .pipe(csv({ separator: ',' }))
  .on('data', data => {
    addEntryEntry(data) 
    const author = data[2];
    const song = data[1];
    const songAuthor = song + " " + author
    if (!authors.has[author]) {
      authors.add(author);
      addAuthorEntry(data)
    }
    if (!songs.has(songAuthor)) {
      songs.add(songAuthor);
      addSongEntry(data)
    }
    
  })
  .on('end', () => {
    console.log("finished parsing");
    
  });
}

const loadData = async function() {
  // await dropTables();
  // await createTables();
  await readCsv()
  await connection.end();
}

loadData();



