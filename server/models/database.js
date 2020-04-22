const moment = require('moment');
const SHA256 = require('crypto-js/sha256');
const credentials = require('../credentials.js')
var db = require('./schemas')

const searchSong = function(string) {
  return db.query(`SELECT * 
  FROM Songs 
  WHERE title LIKE '%${string}%'
  LIMIT 15;`)
}

const searchPerson = function(string) {
    return db.query(
        `
        SELECT *
        FROM Person
        WHERE name LIKE '%${string}%'
        LIMIT 15;
        `
    )
}

const searchGroup = function(artist1, artist2) {
  return db.query(``)
}

const leaderboardSongs = function() {
  return db.query(`
  SELECT s.title, s.song_art_image_thumbnail_url, a.name, s.id as song_id, a.id as artist_id,
       s.album, s.label, s.release_date_for_display as release_date
  FROM Popularity p
  JOIN Songs s on s.id = p.id
  JOIN Sings s2 on s2.song_id = s.id
  JOIN Person a on s2.artist_id = a.id
  LIMIT 15;
  `)
}

const leaderboardArtists = function() {
  return db.query(`
  SELECT per.name, SUM(p.cumulative_score) as score
  FROM Sings s
  JOIN Popularity p ON p.id = s.song_id
  JOIN Person per ON per.id = s.artist_id
  GROUP BY s.artist_id
  ORDER BY score DESC
  LIMIT 15;

  `)
}


const leaderboardWriters = function() {
  return db.query(`
  SELECT per.name, SUM(p.cumulative_score) as score
  FROM Crew_in c
  JOIN Popularity p ON p.id = c.song_id
  JOIN Person per ON per.id = c.crew_id
  WHERE c.type = "writer" AND NOT EXISTS (
    SELECT * FROM Sings s2 
    WHERE s2.artist_id = per.id)
  GROUP BY c.crew_id
  ORDER BY score DESC
  LIMIT 15;

  `)
}


const leaderboardProducers = function() {
  return db.query(`
  SELECT per.name, SUM(p.cumulative_score) as score
  FROM Crew_in c
  JOIN Popularity p ON p.id = c.song_id
  JOIN Person per ON per.id = c.crew_id
  WHERE c.type = "producer" AND NOT EXISTS (
    SELECT * FROM Sings s2 
    WHERE s2.artist_id = per.id)
  GROUP BY c.crew_id
  ORDER BY score DESC
  LIMIT 15;
  `)
}




module.exports = {
  searchSong,
  searchGroup,
  searchPerson,
  leaderboardSongs,
  leaderboardArtists,
  leaderboardWriters,
  leaderboardProducers
}

