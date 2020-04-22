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

app.get('/searchsong', routes.search_song)
app.post('/searchgroup', routes.search_group)
app.get('/searchperson', routes.search_person)
app.get('/leaderboardsongs', routes.leaderboard_songs)
app.get('/leaderboardArtists', routes.leaderboard_artists)
app.get('/leaderboardWriters', routes.leaderboard_writers)
app.get('/leaderboardProducers', routes.leaderboard_producers)


console.log('Authors: Neil Shweky (nshweky), Salo Serfati (sserfati)');
const port = process.env.PORT || '8080';
app.listen(port, () => {
  console.log('Server running on port ' + port + '. Now open http://localhost:' + port + '/ in your browser!');
});


