CREATE TABLE Songs (
  id varchar(255),
  title varchar(255),
  album varchar(255),
  label varchar(255),
  youtube_url varchar(255),
  song_art_image_thumbnail_url varchar(255),
  release_date_for_display varchar(255),
  PRIMARY KEY (id)
); 
CREATE TABLE Person (
  id varchar(255),
  name varchar(255),
  image_url varchar(255),
  url varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE Artists(
  artist_id varchar(255),
  genius_followers int,
  genius_iq int,
  PRIMARY KEY (artist_id),
  FOREIGN KEY (artist_id) REFERENCES Person(id)
);

CREATE TABLE Sings(
  artist_id varchar(255),
  song_id varchar(255),
  type varchar(255),
  PRIMARY KEY (artist_id,song_id,type),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);

CREATE TABLE Crew_in (
  crew_id varchar(255),
  song_id varchar(255),
  type varchar(255),
  PRIMARY KEY (crew_id, song_id),
  FOREIGN KEY (crew_id) REFERENCES Person(id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
)

CREATE TABLE Entries (
  song_id varchar(255),
  position int,
  date int,
  streams int,
  PRIMARY KEY (song_id, date),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
)

CREATE TABLE Popularity AS
SELECT Songs.id, scores.cumulative_score 
FROM Sings LEFT JOIN Person ON Person.id = Sings.artist_id
LEFT JOIN Songs ON Sings.song_id = Songs.id
LEFT JOIN (SELECT id, SUM(score) AS cumulative_score
  FROM(SELECT song_id as id, (streams / position) AS score
      FROM Entries) x
      GROUP BY id)
   scores ON Songs.id = scores.id
ORDER BY scores.cumulative_score DESC;