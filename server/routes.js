var config = require('./db-config.js');
var mysql = require('mysql');

config.connectionLimit = 10;
var connection = mysql.createPool(config);

/* -------------------------------------------------- */
/* ------------------- Route Handlers --------------- */
/* -------------------------------------------------- */


/* ---- Q1a (Dashboard) ---- */
function getAllGenres(req, res) {
  var query = `
    SELECT DISTINCT y.genre AS genre
    FROM Genres y
  `;
    connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      res.json(rows);
    }
  });
};


/* ---- Q1b (Dashboard) ---- */
function getTopInGenre(req, res) {
  const genre = req.params.genre

  var query = `
    SELECT M.title AS title, M.rating AS rating, M.vote_count AS vote_count
    FROM Movies M JOIN Genres G ON M.id = G.movie_id
    WHERE G.genre LIKE '${genre}'
    ORDER BY M.rating DESC, M.vote_count DESC
    LIMIT 10 
  `;
    connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      res.json(rows);
    }
  });
};

/* ---- Q2 (Recommendations) ---- */
function getRecs(req, res) {
  let movieName = req.params.movieName; 

  var query = `
    SELECT
      M.title,
      M.id,
      M.rating,
      M.vote_count
    FROM
      Movies M
    WHERE
      NOT EXISTS (
        SELECT
          G.genre
        FROM
          Genres G
        WHERE
          G.movie_id = (
            SELECT
              id
            FROM
              Movies
            WHERE
              title LIKE '${movieName}'
          )
          AND G.genre NOT IN (
            SELECT
              genre
            FROM
              Genres
            WHERE
              M.id = movie_id
          )
      )
      AND EXISTS (
        SELECT
          id
        FROM
          Movies
        WHERE
          title LIKE '${movieName}'
      )
      AND M.title NOT LIKE '${movieName}'
    ORDER BY M.rating DESC, M.vote_count DESC
    LIMIT 5
  `;
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      console.log(rows)
      res.json(rows);
    }
  });

};

/* ---- (Best Genres) ---- */
function getDecades(req, res) {
	var query = `
    SELECT DISTINCT (FLOOR(year/10)*10) AS decade
    FROM (
      SELECT DISTINCT release_year as year
      FROM Movies
      ORDER BY release_year
    ) y
  `;
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      res.json(rows);
    }
  });
}

/* ---- Q3 (Best Genres) ---- */
function bestGenresPerDecade(req, res) {
  let decadeStr = req.params.decade;
  let decade = parseInt(decadeStr, 10); 
  console.log(decade +10); 
  // var query = `
  //   SELECT G.genre, IFNULL(AVG(M.rating), 0) AS avg_rating 
  //   FROM Movies M RIGHT JOIN Genres G ON M.id = G.movie_id
  //   WHERE M.release_year >= ${decade}
  //     AND M.release_year < ${decade +10}
  //   GROUP BY G.genre
  //   ORDER BY AVG(M.rating) DESC, G.genre ASC
  // `;

  var query = `
    SELECT GG.genre, IFNULL(M1.avg_rating, 0) AS avg_rating 
    FROM (    SELECT G.genre, IFNULL(AVG(M.rating), 0) AS avg_rating 
              FROM Movies M RIGHT JOIN Genres G ON M.id = G.movie_id
              WHERE M.release_year >= ${decade}
                AND M.release_year < ${decade +10}
              GROUP BY G.genre
              ORDER BY AVG(M.rating) DESC, G.genre ASC) M1 
      RIGHT JOIN Genres GG ON M1.genre = GG.genre
    GROUP BY GG.genre
    ORDER BY AVG(M1.avgs_rating) DESC, GG.genre ASC
  `;
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      console.log("rows")
      console.log(rows)
      res.json(rows);
    }
  });
  console.log("q")
};

// The exported functions, which can be accessed in index.js.
module.exports = {
	getAllGenres: getAllGenres,
	getTopInGenre: getTopInGenre,
	getRecs: getRecs,
	getDecades: getDecades,
  bestGenresPerDecade: bestGenresPerDecade
}