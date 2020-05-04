MATCH (artist1:Person)-[:SINGS]->(song1:Song)-[:HAS_CREW]->(crew:Person)-[:CREW_IN]->(song2:Song)-[:SANG_BY]->(artist2:Person)
WHERE artist1.id <> artist2.id
  AND song1.song_id <> song2.song_id
  AND artist1.name="Drake"
RETURN artist1, song1, crew, song2, artist2
LIMIT 50;
