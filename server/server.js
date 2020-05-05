const express = require('express');
const routes = require('./routes/routes.js');
const app = express();
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser')
const session = require('express-session');
const morgan = require('morgan')
var cors = require('cors');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(cookieParser());
app.use(session({
    secret: "my_secretkey_345##$123",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }, //For now, we must set this to false because cookie will only work over https
}))

app.use(morgan('tiny'))

app.get('/', (req, res) => res.send('Hello, World'))
app.get('/searchsong', routes.search_song)
app.post('/searchgroup', routes.search_group)
app.get('/searchperson', routes.search_person)
app.get('/leaderboardsongs', routes.leaderboard_songs)
app.get('/leaderboardartists', routes.leaderboard_artists)
app.get('/leaderboardwriters', routes.leaderboard_writers)
app.get('/leaderboardproducers', routes.leaderboard_producers)
app.get('/getsong/:id', routes.get_song);
app.get('/getcrew/:id', routes.get_crew);
app.get('/getsongcrew/:id', routes.get_song_crew);
app.get('/getrandomsongcrew/', routes.get_random_song_crew);
app.get('/daycount/:id', routes.day_count);
app.get('/dayrange', routes.day_range);
app.get('/getcollaborators/:id', routes.get_collaborators)
app.get('/getrandomcollaborators/', routes.get_random_collaborators)
app.get('/getrecommendations/:id', routes.get_recommendations)


app.get('/graphviz', (req, res) => {
  var html = ` 
  <div id="viz"></div>    
  <script src="https://rawgit.com/neo4j-contrib/neovis.js/master/dist/neovis.js"></script>
  <script type="text/javascript">

      var viz;

      function draw() {
          var config = {
              container_id: "viz",
              server_url: "***REMOVED***",
              server_user: "neo4j",
              server_password: "***REMOVED***",
              labels: {
                  "Person": {
                      "caption": "name",
                      "size": 2,
                      "community": "community"
                  },
                  "Song": {
                    "caption": "title",
                    "size": 2,
                    "community": "community"
                  }
              },
              relationships: {
                  "CREW_IN": {
                      "thickness": 1,
                      "caption": false
                  },
                  "HAS_CREW": {
                    "thickness": 1,
                    "caption": false
                  },
                  "SINGS": {
                    "thickness": 1,
                    "caption": false
                  }
              },
              initial_cypher: "MATCH (artist1:Person)-[:SINGS]->(song1:Song)-[:HAS_CREW]->(crew1:Person)-[:CREW_IN]-(song2:Song)-[:HAS_CREW]->(crew2:Person), \
              (artist1)-[:SINGS]->(song3:Song)-[:SANG_BY]->(artist2:Person)-[:SINGS]->(song4:Song)-[:SANG_BY]->(artist3:Person) \
              WHERE artist1.id <> artist2.id \
                AND song1.song_id <> song2.song_id \
                AND song1.song_id <> song2.song_id \
                AND song3.song_id <> song2.song_id \
                AND song3.song_id <> song1.song_id \
                AND song4.song_id <> song1.song_id \
                AND song4.song_id <> song2.song_id \
                AND song4.song_id <> song3.song_id \
                AND artist2.id <> artist3.id \
                AND crew1.id <> crew2.id \
                AND NOT exists ((artist3)-[:SINGS]->(:Song)-[:HAS_CREW]->(crew2)) \
                AND NOT exists ((artist1)-[:SINGS]->(:Song)-[:SANG_BY]->(artist3)) \
                AND NOT exists ((artist1)-[:SINGS]->(:Song)-[:HAS_CREW]->(crew2)) \
              RETURN  DISTINCT artist1,artist2,artist3,song1,song2,song3,song4,crew1,crew2 \
              LIMIT 1;"
          };

          viz = new NeoVis.default(config);
          viz.render();
      }
      draw()
  </script>
  `
  res.send(html)
 
})



console.log('Authors: Neil Shweky (nshweky), Salo Serfati (sserfati)');
const port = process.env.PORT || '8080';
app.listen(port, () => {
  console.log('Server running on port ' + port + '. Now open http://localhost:' + port + '/ in your browser!');
});


