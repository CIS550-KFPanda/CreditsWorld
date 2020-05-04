mysql -u admin -p -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(artist_id,',',song_id) FROM Sings" --database=creditsworld > "/Users/maxgoldman/Dropbox/Penn Spring 2020/CIS450/project/Sings.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(crew_id,',',song_id) FROM Crew_in" --database=creditsworld > "/Users/maxgoldman/Dropbox/Penn Spring 2020/CIS450/project/Crew_in.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(id,',',title) FROM Songs" --database=creditsworld > "/Users/maxgoldman/Dropbox/Penn Spring 2020/CIS450/project/Songs.csv"

mysql -u admin -p  -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com --port=1521 -e "select concat(id,',',name) FROM Person" --database=creditsworld > "/Users/maxgoldman/Dropbox/Penn Spring 2020/CIS450/project/Person.csv"
