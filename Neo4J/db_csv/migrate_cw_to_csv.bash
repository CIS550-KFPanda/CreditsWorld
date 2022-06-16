mysql -u admin -p -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(artist_id,',',song_id) FROM Sings" --database=creditsworld > "./Sings.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(crew_id,',',song_id) FROM Crew_in" --database=creditsworld > "./Crew_in.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(id,',',title) FROM Songs" --database=creditsworld > "./Songs.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(id,',',name) FROM Person" --database=creditsworld > "./Person.csv"
