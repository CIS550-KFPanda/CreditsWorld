LOAD CSV WITH HEADERS FROM 'file:///Songs.csv' AS row with row where row.id is not null
CREATE (song:Song {song_id: row.id, title: row.title});

LOAD CSV WITH HEADERS FROM 'file:///Person.csv' AS row with row where row.id is not null
CREATE (person:Person {id: row.id, name: row.name});


LOAD CSV WITH HEADERS FROM 'file:///Crew_in.csv' AS row with row where row.crew_id is not null
MATCH (person: Person{id: row.crew_id})
MATCH (song: Song{song_id: row.song_id})
CREATE (person)-[:CREW_IN]->(song)
CREATE (song)-[:HAS_CREW]->(person);

LOAD CSV WITH HEADERS FROM 'file:///Sings.csv' AS row with row where row.artist_id is not null
MATCH (person: Person{id: row.artist_id})
MATCH (song: Song{song_id: row.song_id})
CREATE (person)-[:SINGS]->(song)
CREATE (song)-[:SANG_BY]->(person);
