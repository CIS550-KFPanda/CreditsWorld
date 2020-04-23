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

const getSong = function(id) {
  return db.query(`SELECT * FROM Songs WHERE id = '${id}'`)
           .then(rows => rows[0])
}

const getCrew = function(id) {
  return db.query(`
  SELECT p.id, p.name, p.image_url, p.url
  FROM (
    SELECT crew_id as id
    FROM Crew_in
    WHERE song_id='${id}'
    UNION
    SELECT artist_id as id
    FROM Sings
    WHERE song_id='${id}'
  ) t1
  JOIN Person p ON p.id = t1.id
  `)
}

const getSongAndCrew = function(id) {
  const q1 = getSong(id)
  const q2 = getCrew(id)
  return Promise
          .all([q1, q2])
          .then(results => {
            return {
              song: results[0][0],
              crew: results[1]
            }
          })
}

const getPerson = function(id) {
  return db.query(`
    SELECT *
    FROM Person
    WHERE id=${id}
  `)
}

const getCollaborators = function(id) {
  const collaborators =  db.query(`
  SELECT p.id, p.name, p.image_url, p.url
  FROM (
  (SELECT crew_id as id
  FROM Crew_in
  WHERE song_id
  IN(
	  SELECT song_id
	  FROM sings
	  WHERE artist_id = ${id}
	)
  AND crew_id <> ${id})
  UNION
  (SELECT artist_id as id
  FROM sings
  WHERE song_id
  IN(
	  SELECT song_id
	  FROM Crew_in
	  WHERE crew_id = ${id}
  )
  AND artist_id<>${id})) t1
  JOIN Person p ON p.id=t1.id
  `);
  const person_info = getPerson(id);
  return Promise
            .all([collaborators, person_info])
            .then(results => {
              return {
                collaborators: results[0],
                person: results[1]
              }
            });

}

const dayCount = function(id) {
  return db.query(`
  SELECT SUM(SongCounter.num_days_on_charts) as cumulative_days_on_chart,
  artist_id, Person.name
  FROM (
    SELECT count(DISTINCT date) as num_days_on_charts, song_id
    FROM Entries
    GROUP BY song_id) SongCounter
  LEFT JOIN Sings ON SongCounter.song_id = Sings.song_id
  LEFT JOIN Person ON Sings.artist_id = Person.id
  WHERE artist_id=${id}
  GROUP BY artist_id, Person.name
  ORDER BY cumulative_days_on_chart DESC;
  `).then(rows => rows[0])
}

/* 
SELECT s.title, s.song_art_image_thumbnail_url, a.name, s.id as song_id, a.id as artist_id,
       s.album, s.label, s.release_date_for_display as release_date
  FROM Popularity p
  JOIN Songs s on s.id = p.id
  JOIN Sings s2 on s2.song_id = s.id
  JOIN Person a on s2.artist_id = a.id
*/

const dayRange = function() {
  return db.query(`
  SELECT s.title, s.song_art_image_thumbnail_url, a.name, s.id as song_id, a.id as artist_id,
       s.album, s.label, s.release_date_for_display as release_date
  FROM (
    SELECT ((max_date - min_date) / 86400 + 1) as days_on_chart, song_id
    FROM (SELECT MIN(date) as min_date, MAX(date) max_date,song_id
    FROM Entries e
    
    GROUP BY song_id
    ) x
    ORDER BY days_on_chart DESC
    LIMIT 15) t
  JOIN Songs s on s.id = t.song_id
  JOIN Sings s2 on s2.song_id = s.id
  JOIN Person a on s2.artist_id = a.id
  `);
}


module.exports = {
  searchSong,
  searchGroup,
  searchPerson,
  leaderboardSongs,
  leaderboardArtists,
  leaderboardWriters,
  leaderboardProducers,
  getSong,
  getCrew,
  getSongAndCrew,
  getCollaborators,
  dayCount,
  dayRange
}

