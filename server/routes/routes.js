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

const missing_params = params => singletonify(params).reduce((acc, cur) => acc + cur + ", ", "missing params: ").slice(0,-2)
const singletonify = item => Array.isArray(item) ? item : [item]
const checkMissingParams = arr => !singletonify(arr).reduce((acc, cur) => acc && (cur !== undefined && cur !== null), true)

const search_song = (req, res) => {
  if (checkMissingParams(req.query.song)) 
    return res.status(400).send(missing_params('song'));

  db.searchSong(req.query.song)
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const search_group = (req, res) => {
  if (!req.body.artists || req.body.artists === 0) res.status(400).send('Must include params artist1, artist2');

  db.searchGroup(req.body.artists)
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const leaderboard_songs = (req, res) => {
  db.leaderboardSongs()
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const leaderboard_artists = (req, res) => {
  db.leaderboardArtists()
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}
const leaderboard_writers = (req, res) => {
  db.leaderboardWriters()
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}
const leaderboard_producers = (req, res) => {
  db.leaderboardProducers()
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const search_person = (req, res) => {
  if(!req.query.person) return res.status(400).send('Empty search query: should include query parameter person');
  db.searchPerson(req.query.person)
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_song = (req, res) => {
  if (!req.params.id) return res.status(400).send('missing parameter id');
  db.getSong(req.params.id)
    .then(data => res.status(200).send(data))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_collaborators = (req, res) => {
  if(!req.params.id) return res.status(400).send('missing parameter id');
  db.getCollaborators(req.params.id)
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_random_collaborators = (req, res) => {
  db.getRandomCollaborators(req.params.id)
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_crew = (req, res) => {
  if(!req.params.id) return res.status(400).send('missing parameter id');
  db.getCrew(req.params.id)
    .then(data => res.status(200).send(data))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_song_crew = (req, res) => {
  if(!req.params.id) return res.status(400).send('missing parameter id');
  db.getSongAndCrew(req.params.id)
    .then(data => res.status(200).send(data))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_random_song_crew = (req, res) => {
  db.getRandomSongAndCrew(req.params.id)
    .then(data => res.status(200).send(data))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}


const day_count = (req, res) => {
  if (checkMissingParams(req.params.id)) return res.status(400).send(missing_params('id'))
  db.dayCount(req.params.id)
    .then(data => res.status(200).send(data))
    .catch(err => res.status(500).send(errorMessageForError(err)))

}

const day_range = (req, res) => {
  db.dayRange()
    .then(rows => res.status(200).send(rows))
    .catch(err => res.status(500).send(errorMessageForError(err)))
}

const get_recommendations = (req, res) => {
  if (checkMissingParams(req.params.id)) return res.status(400).send(missing_params('id'))
  db.getRecommendations(req.params.id)
    .then(rows => res.status(200).send(rows))
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
  get_song,
  get_collaborators,
  get_crew,
  get_song_crew,
  day_count,
  day_range,
  get_random_song_crew,
  get_random_collaborators,
  get_recommendations
}

