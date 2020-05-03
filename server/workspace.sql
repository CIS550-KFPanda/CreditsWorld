
-- A query to search for song by words
SELECT * 
FROM Songs 
WHERE title LIKE '%the%'
LIMIT 5;

-- A query to return all the people that worked on a song_id
SELECT crew_id as id
FROM Crew_in
WHERE song_id = '101491'
UNION
SELECT artist_id as id
FROM Sings
WHERE song_id = '101491'

-- leaderboard
SELECT Songs.title, Person.id as id,Person.name, scores.cumulative_score
FROM Sings LEFT JOIN Person ON Person.id = Sings.artist_id
LEFT JOIN Songs ON Sings.song_id = Songs.id
LEFT JOIN (SELECT id, SUM(score) AS cumulative_score
  FROM(SELECT song_id as id, (streams / position) AS score
      FROM Entries) x
      GROUP BY id)
   scores ON Songs.id = scores.id
ORDER BY scores.cumulative_score DESC
LIMIT 20;


-- A query to return to search for person by words
SELECT *
FROM Person
WHERE name LIKE '%name%'
LIMIT 5;


-- Leaderboard songs
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

SELECT s.title, s.song_art_image_thumbnail_url, a.name, s.id as song_id, a.id as artist_id,
       s.album, s.label, s.release_date_for_display as release_date
FROM Popularity p
JOIN Songs s on s.id = p.id
JOIN Sings s2 on s2.song_id = s.id
JOIN Person a on s2.artist_id = a.id
LIMIT 15;


-- leaderboard artists
WITH top_artist_songs AS (
  SELECT song_id, s.artist_id 
  FROM Sings s
  JOIN Popularity p ON p.id = s.song_id  
  JOIN (
    SELECT s.artist_id, MAX(cumulative_score) as score
    FROM Sings s
    JOIN Popularity p ON p.id = s.song_id 
    GROUP BY artist_id
  ) t1 ON s.artist_id = t1.artist_id AND p.cumulative_score = t1.score
)
SELECT t1.name, t1.image_url, t1.score, s.id AS top_song_id, s.title as top_song_name
FROM (
  SELECT per.name, image_url, artist_id, SUM(p.cumulative_score) as score
  FROM Sings s
  JOIN Popularity p ON p.id = s.song_id
  JOIN Person per ON per.id = s.artist_id
  GROUP BY s.artist_id
  ORDER BY score DESC
  LIMIT 15
) t1
JOIN top_artist_songs t2 ON t1.artist_id = t2.artist_id
JOIN Songs s ON s.id = t2.song_id

-- leaderboard writers
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

--leaderboard producers
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


-- get crew members
SELECT p.id, p.name, p.image_url, p.url
FROM (
  SELECT crew_id as id
  FROM Crew_in
  WHERE song_id='101491'
  UNION
  SELECT artist_id as id
  FROM Sings
  WHERE song_id='101491'
) t1
JOIN Person p ON p.id = t1.id


-- get collaborators
SELECT p.id, p.name, p.image_url, p.url
FROM (
(SELECT crew_id as id
FROM Crew_in
WHERE song_id
IN(
	SELECT song_id
	FROM sings
	WHERE artist_id = 326362
	)
AND crew_id <> 326362)
UNION
(SELECT artist_id as id
FROM sings
WHERE song_id
IN(
	SELECT song_id
	FROM Crew_in
	WHERE crew_id = 326362
)
AND artist_id<>326362)) t1
JOIN Person p ON p.id=t1.id





UPDATE Songs
SET title = 'rockstar'
WHERE id=2942139