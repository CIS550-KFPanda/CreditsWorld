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
  var neo4j = require('neo4j');
  var db = new neo4j.GraphDatabase('http://neo4j:***REMOVED***@ec2-52-207-251-29.compute-1.amazonaws.com:7474');

  // MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
  // WHERE artist1.name = 'Drake' AND artist2.name = 'Kendrick Lamar' 
  // RETURN p

  // db.cypher({
  //   query: `
  // MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
  // WHERE artist1.name = 'Drake' AND artist2.name = 'Kendrick Lamar' 
  // RETURN p
  //   `,
  //   // params: {
  //   //     email: 'alice@example.com',
  //   // },
  // }, function(err, results) {
  //   console.log(JSON.stringify(results, null, 2));
  // })
    var html = `
    <!doctype html>
    <html>
        <head>
            <title>Neovis.js Simple Example</title>
            <style type="text/css">
                html, body {
                    font: 16pt arial;
                }
        
                #viz {
                    width: 900px;
                    height: 700px;
                    border: 1px solid lightgray;
                    font: 22pt arial;
                }
            </style> 
        </head>
        <body onload="draw()">
            <div id="viz"></div>
        </body>    
    </html>
    <script src="https://cdn.neo4jlabs.com/neovis.js/v1.0.0/neovis.js"></script>
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
                        "size": "pagerank",
                        "community": "community"
                    },
                    "Song": {
                      "caption": "title",
                      "size": "pagerank",
                      "community": "community"
                    }
                },
                relationships: {
                    "Crew_in": {
                        "thickness": 1,
                        "caption": false
                    },
                    "Sings": {
                      "thickness": 1,
                      "caption": false
                    }
                },
                initial_cypher: "MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person)) WHERE artist1.name = 'Drake' AND artist2.name = 'Kendrick Lamar' RETURN p"
            };

            viz = new NeoVis.default(config);
            viz.render();
        }
    </script>
    `
    res.send(html)
 
})



console.log('Authors: Neil Shweky (nshweky), Salo Serfati (sserfati)');
const port = process.env.PORT || '8080';
app.listen(port, () => {
  console.log('Server running on port ' + port + '. Now open http://localhost:' + port + '/ in your browser!');
});


