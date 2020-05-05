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


    test('get recommendations', async () => {
      let recs = await database.getRecommendations('130')
      let rec_ids = ['33010', '217208', '61600', '44080', '59421', '88813', '2358', '27655', '30425', '574528', '27616', '28169', '162702', '64581', '27612', '1054259', '155256', '20148', '84565', '459835', '816604', '986640', '143754', '430404', '2197', '28906', '980465', '492', '11305', '72', '27486', '278', '330059', '336528', '89', '662', '69', '34533', '39585', '34522', '1362', '182877', '32429', '669794', '669795', '55684', '23315', '663034', '17195', '29497', '541009', '27822', '47131', '1177', '2069', '139040', '329739', '634300', '45372', '8550', '663011', '663012', '663013', '663014', '663015', '69949', '49698', '1632', '49470', '642979', '671661', '1306886', '19132', '29780', '325049', '499861', '55089', '1028671', '54077', '668957', '1745', '27935', '351', '6471', '27597', '326362', '568186', '111393', '634311']
      expect(recs.length).toBe(89)
      let bool = recs.reduce((acc, rec) => acc && rec_ids.includes(rec.rec_id), true)
      expect(bool).toBe(true)
    })


})

afterAll(async (done) => {
  db.connection.end(function() { done(); });
});


/*

+-------------+-----------+--------------------------+---------+-----------------------------------------------------------------------------------------------------------------+-------------------------------------------------------+--------------+
| origin_name | origin_id | rec_name                 | rec_id  | rec_image                                                                                                       | rec_url                                               | score        |
+-------------+-----------+--------------------------+---------+-----------------------------------------------------------------------------------------------------------------+-------------------------------------------------------+--------------+
| Drake       | 130       | Metro Boomin             | 33010   | https://images.genius.com/94086fe06834a3f3147dfbd52f729cad.940x940x1.jpg                                        | https://genius.com/artists/Metro-boomin               | 5464803.7283 |
| Drake       | 130       | Lil Uzi Vert             | 217208  | https://images.genius.com/05f2ee7ef53d1a68352ec67cda793d0c.469x469x1.jpg                                        | https://genius.com/artists/Lil-uzi-vert               | 5118182.9835 |
| Drake       | 130       | Quavo                    | 61600   | https://images.genius.com/f1ff6c1619a1b9e7adaa8b8789f23c68.563x563x1.jpg                                        | https://genius.com/artists/Quavo                      | 5070508.2654 |
| Drake       | 130       | Migos                    | 44080   | https://images.genius.com/f9c991a8f021b26424a0ce9efa8ccee3.1000x1000x1.jpg                                      | https://genius.com/artists/Migos                      | 5066478.0000 |
| Drake       | 130       | G Koop                   | 59421   | https://images.genius.com/ae27979a9a5c251125d89ae28f83064a.315x315x1.jpg                                        | https://genius.com/artists/G-koop                     | 5066478.0000 |
| Drake       | 130       | Offset                   | 88813   | https://images.genius.com/c7998ea0216f8ddeaaadb5ca063b4ae3.1000x1000x1.jpg                                      | https://genius.com/artists/Offset                     | 5066478.0000 |
| Drake       | 130       | The Weeknd               | 2358    | https://images.genius.com/6dddd0ef3b7f04df34e6bf95ca70975e.683x683x1.jpg                                        | https://genius.com/artists/The-weeknd                 | 1686391.2635 |
| Drake       | 130       | Doc McKinney             | 27655   | https://images.genius.com/3d76bf45c9a8ac094098e8630665e9d6.999x999x1.jpg                                        | https://genius.com/artists/Doc-mckinney               | 1686391.2635 |
| Drake       | 130       | Cirkut                   | 30425   | https://s3.amazonaws.com/rapgenius/cirkut.jpg                                                                   | https://genius.com/artists/Cirkut                     | 1605350.7861 |
| Drake       | 130       | DaHeala                  | 574528  | https://images.genius.com/9c08e6de716f1f6838672ca295a32747.1000x1000x1.jpg                                      | https://genius.com/artists/Daheala                    | 1381531.3421 |
| Drake       | 130       | Vinylz                   | 27616   | https://s3.amazonaws.com/rapgenius/1372924433_Vinylz-e1366826599913.jpg                                         | https://genius.com/artists/Vinylz                     | 1192444.4439 |
| Drake       | 130       | Frank Dukes              | 28169   | https://images.genius.com/cdc1e3192af06b780209ec9e4959d1b1.1000x1000x1.jpg                                      | https://genius.com/artists/Frank-dukes                | 1171061.1103 |
| Drake       | 130       | Starrah                  | 162702  | https://images.genius.com/1ea6c29578bc6e73588d14f269246ffb.770x770x1.png                                        | https://genius.com/artists/Starrah                    | 1157822.2634 |
| Drake       | 130       | Nineteen85               | 64581   | https://images.genius.com/552cc3e0e81342a8f8fe386f00592a3e.1000x1000x1.jpg                                      | https://genius.com/artists/Nineteen85                 |  472383.0019 |
| Drake       | 130       | 40                       | 27612   | https://images.genius.com/c999dd154986a45b8981323a2ea53f98.620x380x1.jpg                                        | https://genius.com/artists/40                         |  461978.1995 |
| Drake       | 130       | Logan Sama               | 1054259 | https://images.genius.com/228474d77351209ba2d5c326786aa6d6.799x799x1.jpg                                        | https://genius.com/artists/Logan-sama                 |  435219.2637 |
| Drake       | 130       | Kyla                     | 155256  | https://images.genius.com/60e4f8e11ced51f98a82a47c34c48880.300x300x1.png                                        | https://genius.com/artists/Kyla                       |  435219.2637 |
| Drake       | 130       | Wizkid                   | 20148   | https://images.genius.com/e529d883159b0d872b49e9e67b61aa07.607x607x1.jpg                                        | https://genius.com/artists/Wizkid                     |  435219.2637 |
| Drake       | 130       | China Black              | 84565   | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/China-black                |  435219.2637 |
| Drake       | 130       | Crazy Cousinz            | 459835  | https://images.genius.com/69fd4e951e80266757d13bdd2f1c5cb3.400x400x1.jpg                                        | https://genius.com/artists/Crazy-cousinz              |  435219.2637 |
| Drake       | 130       | DJ Maphorisa             | 816604  | https://images.genius.com/04cbe72a1d134c280a8b3fe587b23536.549x549x1.jpg                                        | https://genius.com/artists/Dj-maphorisa               |  435219.2637 |
| Drake       | 130       | Austin Rosen             | 986640  | https://images.genius.com/3ec6fe9a0ee0dc90c755de7ddf95138a.296x296x1.png                                        | https://genius.com/artists/Austin-rosen               |  241251.0988 |
| Drake       | 130       | Louis Bell               | 143754  | https://images.genius.com/e5e5ab07410bcde1d4bc916ee86f6ec1.727x727x1.jpg                                        | https://genius.com/artists/Louis-bell                 |  241251.0988 |
| Drake       | 130       | 21 Savage                | 430404  | https://images.genius.com/38af6f15c4c3af0551bde5b9ee778d6e.889x889x1.jpg                                        | https://genius.com/artists/21-savage                  |  234671.5422 |
| Drake       | 130       | Future                   | 2197    | https://images.genius.com/833e2b1d817f1320be26668c01b3be33.780x780x1.png                                        | https://genius.com/artists/Future                     |  203862.2333 |
| Drake       | 130       | ​benny blanco             | 28906   | https://images.genius.com/07647177780837286bcd0fa950819462.1000x1000x1.jpg                                      | https://genius.com/artists/Benny-blanco               |  198755.9730 |
| Drake       | 130       | 21 Savage & Metro Boomin | 980465  | https://images.genius.com/d80415ba54e748cced97ffd872f1a482.630x630x1.jpg                                        | https://genius.com/artists/21-savage-and-metro-boomin |  175525.2016 |
| Drake       | 130       | Big Sean                 | 492     | https://images.genius.com/fe9d52d64ed689e2e66252f43efab598.1000x1000x1.jpg                                      | https://genius.com/artists/Big-sean                   |  155593.9429 |
| Drake       | 130       | Hitmaka                  | 11305   | https://images.genius.com/41879576f4a18b2015200b6f7b27b635.304x304x1.jpg                                        | https://genius.com/artists/Hitmaka                    |  155593.9429 |
| Drake       | 130       | Kanye West               | 72      | https://images.genius.com/0a1795a288ff88f7bb6026880dcaf9a9.1000x1000x1.jpg                                      | https://genius.com/artists/Kanye-west                 |  155593.9429 |
| Drake       | 130       | TM88                     | 27486   | https://images.genius.com/8bdb068c7401b48e7d04f2d6316de50f.526x526x1.png                                        | https://genius.com/artists/Tm88                       |  155593.9429 |
| Drake       | 130       | Jeremih                  | 278     | https://images.genius.com/59567e4918671304d37eb021331d239d.550x550x1.jpg                                        | https://genius.com/artists/Jeremih                    |  155593.9429 |
| Drake       | 130       | Amaire Johnson           | 330059  | https://images.genius.com/522ae0fe61ca0000abd18f8011a9fc80.525x525x1.jpg                                        | https://genius.com/artists/Amaire-johnson             |  155593.9429 |
| Drake       | 130       | Smash David              | 336528  | https://images.genius.com/efb300f752bca48079bc4d94587fb7f3.382x382x1.png                                        | https://genius.com/artists/Smash-david                |  155593.9429 |
| Drake       | 130       | Rihanna                  | 89      | https://images.genius.com/8856725837a6157e574488f78d2804a2.960x960x1.jpg                                        | https://genius.com/artists/Rihanna                    |  104729.3482 |
| Drake       | 130       | Boi-1da                  | 662     | https://images.genius.com/f1b95b403a63c49b2248d0e5c153092a.858x858x1.jpg                                        | https://genius.com/artists/Boi-1da                    |   95149.3875 |
| Drake       | 130       | J. Cole                  | 69      | https://images.genius.com/034c70a439a2b0c4c13b8b346b560111.999x999x1.jpg                                        | https://genius.com/artists/J-cole                     |   91586.8498 |
| Drake       | 130       | Ben Billions             | 34533   | https://images.genius.com/09f61531af507bb45d353f1d3e6545ae.522x522x1.jpg                                        | https://genius.com/artists/Ben-billions               |   71344.8619 |
| Drake       | 130       | Kuk Harrell              | 39585   | https://images.genius.com/a16a2b3bcebd44e926a780725d37e9c7.400x400x1.jpg                                        | https://genius.com/artists/Kuk-harrell                |   62105.7536 |
| Drake       | 130       | Supa Dups                | 34522   | https://images.genius.com/927589eb674709d92438f81ae2cf2c23.630x420x1.jpg                                        | https://genius.com/artists/Supa-dups                  |   55835.4412 |
| Drake       | 130       | Belly                    | 1362    | https://s3.amazonaws.com/filepicker-images-rapgenius/HorpSGA7Qqar8HM5ScIx_Belly1.jpg                            | https://genius.com/artists/Belly                      |   54570.2907 |
| Drake       | 130       | Velous                   | 182877  | https://images.genius.com/0d601c26fcba5b61abcb4b6bad3b78b5.964x964x1.jpg                                        | https://genius.com/artists/Velous                     |   54420.7941 |
| Drake       | 130       | CuBeatz                  | 32429   | https://images.genius.com/100abac48eecf513dad29bf17db16013.700x700x1.jpg                                        | https://genius.com/artists/Cubeatz                    |   53408.0834 |
| Drake       | 130       | Tim Gomringer            | 669794  | https://images.genius.com/cb7ce8780ac63d3fd5d53e34f4e4f758.205x205x1.png                                        | https://genius.com/artists/Tim-gomringer              |   53408.0834 |
| Drake       | 130       | Kevin Gomringer          | 669795  | https://images.genius.com/3b2945045a96fcdb6567cb5647f22712.212x212x1.png                                        | https://genius.com/artists/Kevin-gomringer            |   53408.0834 |
| Drake       | 130       | Allen Ritter             | 55684   | https://images.genius.com/527f5a08bbacac18e6873e1d3817f386.400x400x1.jpg                                        | https://genius.com/artists/Allen-ritter               |   40728.5934 |
| Drake       | 130       | Southside                | 23315   | https://images.genius.com/4aafba6bdefe067064ef8448e66fd8a8.429x429x1.png                                        | https://genius.com/artists/Southside                  |   38384.2194 |
| Drake       | 130       | A. Martin                | 663034  | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/A-martin                   |   37163.7382 |
| Drake       | 130       | Popcaan                  | 17195   | https://images.genius.com/22ad26a6ad5981df00cee1a55f31fcbc.741x741x1.jpg                                        | https://genius.com/artists/Popcaan                    |   37163.7382 |
| Drake       | 130       | Dre Skull                | 29497   | https://images.genius.com/3a01965b067fead843b0a00a1f86a0d7.1000x668x1.jpg                                       | https://genius.com/artists/Dre-skull                  |   37163.7382 |
| Drake       | 130       | Maneesh                  | 541009  | https://images.genius.com/9f5500f8c96ae5235a7572eaac467bce.512x512x1.jpg                                        | https://genius.com/artists/Maneesh                    |   37163.7382 |
| Drake       | 130       | Zaytoven                 | 27822   | https://images.genius.com/eec0806a75c053ed0882a1fe3198668e.1000x1000x1.jpg                                      | https://genius.com/artists/Zaytoven                   |   28719.6935 |
| Drake       | 130       | PARTYNEXTDOOR            | 47131   | https://images.genius.com/2c94d878675cd182a5b52c28073f67eb.683x683x1.jpg                                        | https://genius.com/artists/Partynextdoor              |   26758.9358 |
| Drake       | 130       | Taylor Swift             | 1177    | https://images.genius.com/7b60eaf2dfa28ce4267bf59f30f352d1.400x400x1.jpg                                        | https://genius.com/artists/Taylor-swift               |   25888.2590 |
| Drake       | 130       | Calvin Harris            | 2069    | https://images.genius.com/5a4c19533211eca706c6abdef9f14586.960x960x1.jpg                                        | https://genius.com/artists/Calvin-harris              |   25888.2590 |
| Drake       | 130       | Sevn Thomas              | 139040  | https://images.genius.com/988261766b0700b37e539389f8b39808.428x428x1.jpg                                        | https://genius.com/artists/Sevn-thomas                |   22056.8904 |
| Drake       | 130       | Monte Moir               | 329739  | https://images.genius.com/94731fb20c81097bb6987dabe6eac4f8.240x239x1.jpg                                        | https://genius.com/artists/Monte-moir                 |   22056.8904 |
| Drake       | 130       | Rich Stephenson          | 634300  | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/Rich-stephenson            |   22056.8904 |
| Drake       | 130       | Selena Gomez             | 45372   | https://images.genius.com/902d3ed593ed6f5e70efd5f694444c5b.960x960x1.jpg                                        | https://genius.com/artists/Selena-gomez               |   19544.1276 |
| Drake       | 130       | Beenie Man               | 8550    | https://images.genius.com/b32c23227d1261eac85227d5867eab2e.788x788x1.jpg                                        | https://genius.com/artists/Beenie-man                 |   18671.7030 |
| Drake       | 130       | Aquaman                  | 663011  | https://images.genius.com/f1681f41c7b8022ab48828671a79f550.479x479x1.jpg                                        | https://genius.com/artists/Aquaman                    |   18671.7030 |
| Drake       | 130       | Donald Dennis            | 663012  | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/Donald-dennis              |   18671.7030 |
| Drake       | 130       | Garu Jackson             | 663013  | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/Garu-jackson               |   18671.7030 |
| Drake       | 130       | Patrick Roberts          | 663014  | https://images.genius.com/1c959687f9363e36de8ac55e4373e1bc.345x345x1.jpg                                        | https://genius.com/artists/Patrick-roberts            |   18671.7030 |
| Drake       | 130       | Andrew Thomas            | 663015  | https://images.genius.com/fbdc3e1bcfe871617b7dd098a24419e3.300x300x1.jpg                                        | https://genius.com/artists/Andrew-thomas              |   18671.7030 |
| Drake       | 130       | Di Genius                | 69949   | https://images.genius.com/a5df7a4dc09ea8129e75470118c5d779.459x344x1.jpg                                        | https://genius.com/artists/Di-genius                  |   18671.7030 |
| Drake       | 130       | Cashmere Cat             | 49698   | https://images.genius.com/198d834497b4fa39667f137f98ea22ae.552x552x1.jpg                                        | https://genius.com/artists/Cashmere-cat               |   18093.3870 |
| Drake       | 130       | Tory Lanez               | 1632    | https://images.genius.com/bdbe07b5106b7d2bd8fe6ed477ef3e2c.1000x1000x1.jpg                                      | https://genius.com/artists/Tory-lanez                 |   15337.1592 |
| Drake       | 130       | DJ ESCO                  | 49470   | https://images.genius.com/7130fa2421767d64a74aacaee4592d4b.841x841x1.jpg                                        | https://genius.com/artists/Dj-esco                    |   15311.9421 |
| Drake       | 130       | Sickdrumz                | 642979  | https://images.genius.com/1aa98ae799be2f0a74a2ca6734adc385.573x573x1.jpg                                        | https://genius.com/artists/Sickdrumz                  |   14160.6042 |
| Drake       | 130       | Nicholas Audino          | 671661  | https://images.genius.com/9c061e33bcb99d8777d86a96f7aa66a5.361x361x1.png                                        | https://genius.com/artists/Nicholas-audino            |   14160.6042 |
| Drake       | 130       | Derrus Rachel            | 1306886 | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/Derrus-rachel              |   14160.6042 |
| Drake       | 130       | Prince Charlez           | 19132   | https://images.genius.com/7b8078f770bc6602fb81b64b25632fad.1000x1000x1.jpg                                      | https://genius.com/artists/Prince-charlez             |   14160.6042 |
| Drake       | 130       | Mustard                  | 29780   | https://s3.amazonaws.com/filepicker-images-rapgenius/a5Gy2GnyR0ijw96H739w_dj-mustard-bw-2016-billboard-1548.jpg | https://genius.com/artists/Mustard                    |   14160.6042 |
| Drake       | 130       | Khaled Rohaim            | 325049  | https://images.genius.com/49caf45c9dfa0d332c9b3ad3e68522a7.376x376x1.jpg                                        | https://genius.com/artists/Khaled-rohaim              |   14160.6042 |
| Drake       | 130       | Lewis Hughes             | 499861  | https://images.genius.com/b17a4a1ed8a7e5ce08daa1abeb57f837.394x394x1.png                                        | https://genius.com/artists/Lewis-hughes               |   14160.6042 |
| Drake       | 130       | Twice as Nice            | 55089   | https://images.genius.com/722bcad19536a240e5608d83933a1ba7.200x200x1.jpg                                        | https://genius.com/artists/Twice-as-nice              |   14160.6042 |
| Drake       | 130       | StepBfly                 | 1028671 | https://assets.genius.com/images/default_avatar_300.png?1588262610                                              | https://genius.com/artists/Stepbfly                   |   13407.7514 |
| Drake       | 130       | Cassius Jay              | 54077   | https://images.genius.com/836b476920a62732094994af5e308533.834x834x1.jpg                                        | https://genius.com/artists/Cassius-jay                |   13407.7514 |
| Drake       | 130       | Gary Mudbone Cooper      | 668957  | https://images.genius.com/24bb9be47d95794435f471de700ea3c1.175x175x1.jpg                                        | https://genius.com/artists/Gary-mudbone-cooper        |    9699.1498 |
| Drake       | 130       | Childish Gambino         | 1745    | https://images.genius.com/90d733d87dcdbe5bb5f89062e6fb381f.500x500x1.jpg                                        | https://genius.com/artists/Childish-gambino           |    9699.1498 |
| Drake       | 130       | Ludwig Göransson         | 27935   | https://images.genius.com/f91489201992d781cc5d5fb70b7ae268.395x395x1.jpg                                        | https://genius.com/artists/Ludwig-goransson           |    9699.1498 |
| Drake       | 130       | George Clinton           | 351     | https://images.genius.com/3acf457834e812fe27f0309541e53e35.933x933x1.jpg                                        | https://genius.com/artists/George-clinton             |    9699.1498 |
| Drake       | 130       | Bootsy Collins           | 6471    | https://images.genius.com/ce3cef6abc250a60a8efdcf6e679dfed.400x400x1.jpg                                        | https://genius.com/artists/Bootsy-collins             |    9699.1498 |
| Drake       | 130       | Cardiak                  | 27597   | https://images.genius.com/1ad3a6aae54a390fcae2a1dea7147f80.311x311x1.jpg                                        | https://genius.com/artists/Cardiak                    |    9208.5815 |
| Drake       | 130       | Post Malone              | 326362  | https://images.genius.com/aec6f3d454b88621ec9863f05b4e89a7.937x937x1.jpg                                        | https://genius.com/artists/Post-malone                |    9137.9412 |
| Drake       | 130       | Drake & Future           | 568186  | https://images.genius.com/b033687222fde407fb97ca135c4192e1.452x452x1.jpg                                        | https://genius.com/artists/Drake-and-future           |    8438.8821 |
| Drake       | 130       | Fred Ball                | 111393  | https://images.rapgenius.com/avatars/medium/99dee8c45bb8fa861f381ed1bc5e1ea6                                    | https://genius.com/artists/Fred-ball                  |    5459.8564 |
| Drake       | 130       | Joseph Angel             | 634311  | https://images.genius.com/be17ad51b04726071768dee5132c75c6.651x651x1.jpg                                        | https://genius.com/artists/Joseph-angel               |    5459.8564 |
+-------------+-----------+--------------------------+---------+-----------------------------------------------------------------------------------------------------------------+-------------------------------------------------------+--------------+

*/