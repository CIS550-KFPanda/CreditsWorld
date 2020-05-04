var mysql = require('mysql');
const db = require('./schemas');
const database = require('./database');


beforeAll(async done => db.connection.changeUser({ database: 'creditsworld_test' }, done))

describe('data loaded tests', () => {
  test('count Artists', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Artists;'))[0].c).toBe(111)
  })
  test('count Crew_in', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Crew_in;'))[0].c).toBe(629)
  })
  test('count entries', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Entries;'))[0].c).toBe(199)
  })
  test('count Person', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Person;'))[0].c).toBe(369)
  })
  test('count Popularity', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Popularity;'))[0].c).toBe(166)
  })
  test('count Sings', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Sings;'))[0].c).toBe(166)
  })
  test('count Songs', async () => {
    expect((await db.query('SELECT COUNT(*) as c FROM Songs;'))[0].c).toBe(112)
  })
})

describe('search tests', () => {
  test('search song none', async () => { 
    expect((await database.searchSong('despacito')).length).toBe(0)
  })
  test('search song one', async () => { 
    let songs = await database.searchSong('jumpman')
    expect(songs.length).toBe(1)
    expect(songs[0].title).toBe('Jumpman')
    expect(songs[0].id).toBe('2311373')
  })

  test('search song multiple', async () => { 
    let songs = await database.searchSong('know')
    expect(songs.length).toBe(2)
    let bool = songs.reduce((acc, song) => acc && song.title.toLowerCase().includes('know') , true)
    expect(bool).toBe(true)
  })

  test('search person none', async () => { 
    expect((await database.searchPerson('onerepublic')).length).toBe(0)
  })
  test('search person one', async () => { 
    let artists = await database.searchPerson('& future')
    expect(artists.length).toBe(1)
    expect(artists[0].name).toBe('Drake & Future')
    expect(artists[0].id).toBe('568186')
  })

  test('search person multiple', async () => { 
    let artists = await database.searchPerson('one')
    expect(artists.length).toBe(7)
    let bool = artists.reduce((acc, artist) => acc && artist.name.toLowerCase().includes('one') , true)
    expect(bool).toBe(true)
  })

})

describe('leaderboard tests', () => {
  test('leaderboard artists', async () => {
    let leaderboard = await database.leaderboardArtists()
    expect(leaderboard.length).toBe(15)
    expect(leaderboard[0].artist_id).toBe('217208')
    expect(leaderboard[14].artist_id).toBe('41287')
  })

  test('leaderboard songs', async () => {
    let leaderboard = await database.leaderboardSongs()
    expect(leaderboard.length).toBe(15)
  })

  test('leaderboard writers', async () => {
    let leaderboard = await database.leaderboardWriters()
    expect(leaderboard.length).toBe(15)
  })

  test('leaderboard producers', async () => {
    let leaderboard = await database.leaderboardProducers()
    expect(leaderboard.length).toBe(15)
  })
})

describe('get tests', () => {
    test('get song', async () => {
      let song = await database.getSong('2450584')
      expect(song.id).toBe('2450584')
      expect(song.title).toBe('One Dance')
    })

    test('get person', async () => {
      let person = await database.getPerson('130')
      expect(person.id).toBe('130')
      expect(person.name).toBe('Drake')
    })

    test('get crew', async () => {
      let crew = await database.getCrew('2450584')
      let crew_ids = ['1054259', '130', '155256', '20148', '27612', '459835', '64581', '64581', '816604', '84565', '130', '155256', '20148'] 
      let bool = crew.reduce((acc, crew) => acc && crew_ids.includes(crew.id), true)
      expect(crew.length).toBe(13)
      expect(bool).toBe(true)
    })

    test('get song and crew', async () => {
      let { song, crew } = await database.getSongAndCrew('2450584')
      expect(song.id).toBe('2450584')
      expect(song.title).toBe('One Dance')
      let crew_ids = ['1054259', '130', '155256', '20148', '27612', '459835', '64581', '64581', '816604', '84565', '130', '155256', '20148'] 
      let bool = crew.reduce((acc, crew) => acc && crew_ids.includes(crew.id), true)
      expect(crew.length).toBe(13)
      expect(bool).toBe(true)
    })

    test('get random song crew', async () => {
      let { song, crew } = await database.getRandomSongAndCrew()
      expect(song.id).toBeTruthy()
      expect(song.title).toBeTruthy()
      expect(crew).toBeTruthy()
    })

    test('get collaborators', async () => {
      let { collaborators, person } = await database.getCollaborators('2069')
      expect(person.id).toBe('2069')
      expect(person.name).toBe('Calvin Harris')

      let crew_ids = ['1177', '39585', '89'] 
      let bool = collaborators.reduce((acc, crew) => acc && crew_ids.includes(crew.id), true)
      expect(collaborators.length).toBe(3)
      expect(bool).toBe(true)
    })

    test('get collaborators none', async () => {
      let { collaborators } = await database.getCollaborators('1')
      expect(collaborators).toEqual([])
    })

    test('get random collaborators', async () => {
      let { person, collaborators } = await database.getRandomCollaborators()
      expect(person.id).toBeTruthy()
      expect(person.name).toBeTruthy()
      expect(collaborators).toBeTruthy()
    })

    test('get day count', async () => {
      let dic = await database.dayCount('130')
      expect(dic.artist_id).toBe('130')
      expect(dic.name).toBe('Drake')
      expect(dic.cumulative_days_on_chart).toBe(17)
    })

    test('get day range', async () => {
      let songs = await database.dayRange()
      expect(songs.length).toBe(15)
    })
})

afterAll(async (done) => {
  db.connection.end(function() { done(); });
});
