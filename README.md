# CreditsWorld

Artists and repertoire (known as A&R) is the division of a record label or music publishing company that is responsible for talent scouting and overseeing the artistic development of recording artists and songwriters1. To create meaningful music sessions, A&R managers need to pair up artists, songwriters, and producers. This matchmaking is often done by leveraging personal connections and is kept personally. 

The goal of this project is to create a website that A&R managers could visit to learn about what type of connections worked in the past, to create more meaningful connections in the future.

## Website
The website is now up! https://creditsworld.herokuapp.com/

## Server
To run the server:
```
cd server
node server
```

## Client
To run the client:
```
cd client
npm start 
```

## MySQL
To set up the database, first install MySQL using homebrew:
```
brew install mysql
brew tap homebrew/services
brew services start mysql
```
Next set up a user in MySQL. The credentials in our app have username: root, password: 5684
```
mysqladmin -u root password '5648'
```
Now to login to MySQL run:
```
mysql -u root -p 
```
and enter 5648 for the password.

Once you login to the databse create the creditsworld database:
```
CREATE DATABASE creditsworld;
```
Switch the database to creditsworld using:
```
use creditsworld;
```
Then you should be good to go!
To load data from the loader, open a new terminal (or logout of mysql) and run:
```
cd server
mysql -u root -p creditsworld < loader.sql
```
## MySQL RDS
To login to the MySQL RDS run:
```
mysql -h credits-world-db-id.chp4hbnqk2jd.us-east-1.rds.amazonaws.com -P 1521 -u admin -p
Password: KFPanda550
```

