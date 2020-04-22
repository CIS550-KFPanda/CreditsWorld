const db = require('../models/database.js');
const moment = require('moment')

const errorMessageForError = err => {
  if (err instanceof Error) {
    if (!!err.code) {
      const codes = {
      }
      return codes[`${err.code}`] || err
    } else return err.message 
  } else return err
}

const search_song = (req, res) => {
  if (!req.query.song) return res.status(400).send('Empty search query: should include query paramters song');

  db.searchSong(req.query.song)
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const search_group = (req, res) => {
  if (!req.body.artists || req.body.artists === 0) res.status(400).send('Must include params artist1, artist2');

  db.searchGroup(req.body.artists)
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const leaderboard_songs = (req, res) => {
  db.leadeboardSongs()
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const leaderboard_artists = (req, res) => {
  db.leaderboardArtists()
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}
const leaderboard_writers = (req, res) => {
  db.leaderboardWriters()
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}
const leaderboard_producers = (req, res) => {
  db.leaderboardProducers()
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const search_person = (req, res) => {
  if(!req.query.person) return res.status(400).send('Empty search query: should include query parameter person');

  db.searchPerson(req.query.person)
    .then((rows, fields) => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

module.exports = {
  search_song,
  search_group,
  search_person,
  leaderboard_songs,
  leaderboard_artists,
  leaderboard_writers,
  leaderboard_producers,
}

