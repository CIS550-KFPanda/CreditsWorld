
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



SELECT SUM(DayCounter.num_days_on_charts) as cumulative_days_on_chart, artist_id, Person.name
FROM (
  SELECT count(DISTINCT date) as num_days_on_charts, song_id
  FROM Entries
  GROUP BY song_id) DayCounter
LEFT JOIN Sings ON DayCounter.song_id = Sings.song_id
LEFT JOIN Person ON Sings.artist_id = Person.id
WHERE artist_id=130
GROUP BY artist_id, Person.name
ORDER BY cumulative_days_on_chart DESC;


SELECT DISTINCT s.title, s.song_art_image_thumbnail_url, s.id as song_id,
       s.album, s.label, s.release_date_for_display as release_date
  FROM (
    SELECT ((max_date - min_date) / 86400 + 1) as days_on_chart, song_id
    FROM (SELECT MIN(date) as min_date, MAX(date) max_date,song_id
    FROM Entries e
    
    GROUP BY song_id
    ) x
    ORDER BY days_on_chart DESC
    LIMIT 15) t
  JOIN Songs s on s.id = t.song_id
  JOIN Sings s2 on s2.song_id = s.id
  JOIN Person a on s2.artist_id = a.id




SELECT DISTINCT s.title, s.song_art_image_thumbnail_url, a.name, s.id as song_id, a.id as artist_id, s.youtube_url, a.image_url
FROM Popularity p
JOIN Songs s on s.id = p.id
JOIN Sings s2 on s2.song_id = s.id AND s2.type = "primary"
JOIN Person a on s2.artist_id = a.id
LIMIT 15;




SELECT DISTINCT t1.crew_id, t1.name, t1.image_url, t1.url, t1.score, s.id AS top_song_id, s.title as top_song_name
  FROM (
    SELECT per.name, image_url, url, crew_id, SUM(p.cumulative_score) as score
    FROM Crew_in c
    JOIN Popularity p ON p.id = c.song_id
    JOIN Person per ON per.id = c.crew_id
    WHERE c.type = "producer"
    GROUP BY c.crew_id
    ORDER BY score DESC
    LIMIT 15
  ) t1
  JOIN (
    SELECT song_id, c.crew_id, c.type
    FROM Crew_in c
    JOIN Popularity p ON p.id = c.song_id  
    JOIN (
      SELECT c.crew_id, MAX(cumulative_score) as score
      FROM Crew_in c
      JOIN Popularity p ON p.id = c.song_id 
      WHERE c.type = "producer"
      GROUP BY crew_id
    ) t1 ON c.crew_id = t1.crew_id AND p.cumulative_score = t1.score
    WHERE c.type = "producer"
  ) t2 ON t1.crew_id = t2.crew_id
  JOIN Songs s ON s.id = t2.song_id


/* 
Query time: 0.33s
Created index, puhed projections
ALTER TABLE Popularity DELETE PRIMARY KEY (id);
THE KICKER Order the CTEs
*/
WITH  people_to_songs as ( 
    SELECT artist_id as id, song_id
    FROM Sings
    UNION
    SELECT crew_id as id, song_id
    FROM Crew_in
    ORDER BY id
),
songs_by_origin AS (  
    SELECT ps1.song_id
    FROM people_to_songs ps1 
    WHERE ps1.id = 130
    ORDER BY song_id
),
artist_popularity AS (
  SELECT SUM(p.cumulative_score) as score, per.id as id
  FROM people_to_songs s
  JOIN Popularity p ON p.id = s.song_id
  JOIN Person per ON per.id = s.id
  GROUP BY s.id
  ORDER BY score DESC
)
SELECT p.name, t1.* 
FROM (
    SELECT DISTINCT Person.name, a.score
    FROM songs_by_origin
    JOIN people_to_songs ps2 
        ON ps2.song_id = songs_by_origin.song_id AND ps2.id <> 130
    JOIN people_to_songs ps3
        ON ps3.song_id <> ps2.song_id AND ps3.id = ps2.id
    JOIN people_to_songs ps4 ON ps4.id <> ps3.id
                            AND ps4.id <> 130
                            AND ps4.song_id = ps3.song_id
    JOIN Person ON ps4.id = Person.id
    JOIN artist_popularity a ON a.id = ps4.id
    ORDER BY a.score DESC

) t1
JOIN Person p ON p.id = 130;






-- initial recommendation query 9.34 s
WITH  people_to_songs as ( 
    SELECT artist_id as id, song_id
    FROM Sings
    UNION
    SELECT crew_id as id, song_id
    FROM Crew_in
),
songs_by_origin AS (  
    SELECT ps1.song_id
    FROM people_to_songs ps1 
    WHERE ps1.id = 130
),
artist_popularity AS (
  SELECT per.name, SUM(p.cumulative_score) as score, per.id as id
  FROM people_to_songs s
  JOIN Popularity p ON p.id = s.song_id
  JOIN Person per ON per.id = s.id
  GROUP BY s.id
  ORDER BY score DESC
)
SELECT p.name, t1.* 
FROM (
    SELECT DISTINCT Person.name, a.score
    FROM songs_by_origin
    JOIN people_to_songs ps2 
        ON ps2.song_id = songs_by_origin.song_id AND ps2.id <> 130
    JOIN people_to_songs ps3
        ON ps3.song_id <> ps2.song_id AND ps3.id = ps2.id
    JOIN people_to_songs ps4 ON ps4.id <> ps3.id
                            AND ps4.id <> 130
                            AND ps4.song_id = ps3.song_id
    JOIN Person ON ps4.id = Person.id
    JOIN artist_popularity a ON a.id = ps4.id
    ORDER BY a.score DESC

) t1
JOIN Person p ON p.id = 130;