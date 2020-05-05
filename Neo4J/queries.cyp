
MATCH (artist1:Person)-[:SINGS]->(song1:Song)-[:HAS_CREW]->(crew:Person)-[:CREW_IN]->(song2:Song)-[:SANG_BY]->(artist2:Person),
(song2)-[:HAS_CREW]->(crew2:Person)
WHERE artist1.id <> artist2.id
  AND song1.song_id <> song2.song_id
  AND song3.song_id <> song2.song_id
  AND artist1.name="Drake"
RETURN artist1, song1, crew, song2, artist2
LIMIT 50;


//shortest path between two artists
MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
WHERE artist1.name = 'Drake' AND artist2.name = 'Kendrick Lamar' 
RETURN p


//1 degree match

MATCH (artist1:Person)-[:SINGS]->(song1:Song)-[:HAS_CREW]->(crew1:Person),
(artist1)-[:SINGS]->(song2:Song)-[:SANG_BY]->(artist2:Person)
WHERE artist1.id <> artist2.id
  AND song1.song_id <> song2.song_id
  AND NOT exists ((artist2)-[:SINGS]->(:Song)-[:HAS_CREW]->(crew1))
RETURN  DISTINCT artist2 as ARTIST, crew1 as Collaborator, artist1 as Origin,song1,song2


//2 degree match

MATCH (artist1:Person)-[:SINGS]->(song1:Song)-[:HAS_CREW]->(crew1:Person)-[:CREW_IN]-(song2:Song)-[:HAS_CREW]->(crew2:Person),
(artist1)-[:SINGS]->(song3:Song)-[:SANG_BY]->(artist2:Person)-[:SINGS]->(song4:Song)-[:SANG_BY]->(artist3:Person)
WHERE artist1.id <> artist2.id
  AND song1.song_id <> song2.song_id
  AND song1.song_id <> song2.song_id
  AND song3.song_id <> song2.song_id
  AND song3.song_id <> song1.song_id
  AND song4.song_id <> song1.song_id
  AND song4.song_id <> song2.song_id
  AND song4.song_id <> song3.song_id
  AND artist2.id <> artist3.id
  AND crew1.id <> crew2.id
  AND NOT exists ((artist3)-[:SINGS]->(:Song)-[:HAS_CREW]->(crew2))
  AND NOT exists ((artist1)-[:SINGS]->(:Song)-[:SANG_BY]->(artist3))
  AND NOT exists ((artist1)-[:SINGS]->(:Song)-[:HAS_CREW]->(crew2))
RETURN  DISTINCT artist1,artist2,artist3,song1,song2,song3,song4,crew1,crew2
LIMIT 1;



// Find all equal shortest paths between two nodes


MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
WHERE artist1.id = '130' AND artist2.id = '1421' 
WITH length(p) AS len_p
MATCH g = ((artist3: Person)-[*.. toInteger(x)]->(artist4:Person))
WHERE artist3.id = '130' AND artist4.id = '1421' 
RETURN g;


// ----------------------------------------

MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
WHERE artist1.id = '130' AND artist2.id = '1421' 
WITH length(p) AS len_p, collect(artist2) AS terminatorNodes
MATCH (artist3: Person{id: '130'})
CALL apoc.path.expandConfig(artist3, {
    relationshipFilter: 'SINGS|SANG_BY|CREW_IN|HAS_CREW',
    minLevel: len_p,
    maxLevel: len_p,
    terminatorNodes: terminatorNodes
}) YIELD path
RETURN path;


// ----------------------------------------

WITH length(p) AS len_p
MATCH (charlie:Person {name: 'Charlie Sheen'})
CALL apoc.path.expandConfig(charlie, {
    relationshipFilter: 'ACTED_IN',
    minLevel: len_p,
    maxLevel: len_p
}) YIELD path
RETURN LAST(NODES(path)).title AS title

// ----------------------------------------
MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
WHERE artist1.id = '130' AND artist2.id = '1421' 
WITH length(p) AS len_p
MATCH (artist3: Person{id: '130'})
CALL apoc.path.expandConfig(artist3, {
    relationshipFilter: '*',
    minLevel: len_p,
    maxLevel: len_p,
    terminatorNodes:'/(:Person{id: \'1421\'})'
}) YIELD path
RETURN path;

// ----------------------------------------




MATCH g = ((artist1: Person)-[*4..4]->(song:Person))
RETURN g;


MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person))
WHERE artist1.id = '130' AND artist2.id = '1421' 
WITH length(p) AS x


MATCH g = ((artist3: Person)-[*..10]->(artist4:Person))
WHERE artist3.id = '130' AND artist4.id = '1421' 
AND length(g) = length(shortestPath((artist3)-[*]-(artist4)))
RETURN g;




MATCH (p1:Person { id: '130' }),(p2:Person { id: '1421' }), p = allShortestPaths((p1)-[*]-(p2))
RETURN p