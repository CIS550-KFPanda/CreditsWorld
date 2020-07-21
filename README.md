# CreditsWorld

## OVER HERE TAs
- If you're looking to grade this we have all of the information listed below. The website link is located [here](#website). Dependecies are located [below](#dependencies).
- If you're looking for the code that loads our data into the database, check for server/data.csv for the actual beginner data, server/loader.js for the code that generates the sql, and loader.sql for the final sql. 
test
## Description

Artists and repertoire (known as A&R) is the division of a record label or music publishing company that is responsible for talent scouting and overseeing the artistic development of recording artists and songwriters. To create meaningful music sessions, A&R managers need to pair up artists, songwriters, and producers. This matchmaking is often done by leveraging personal connections and is kept personally. 

The goal of this project is to create a website that A&R managers could visit to learn about what type of connections worked in the past, to create more meaningful connections in the future.

(#website)
## Website
The website is now up! http://creditsworld.herokuapp.com/

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

(#dependencies)
## Dependencies 
* `React`-related dependencies
* `qs` - parse query strings
* `neovis.js` - neo4j graph viz
* `bootstrap` - nice looking react components
* `express`, `express-session`, `body-parser`, `cookie-parser`, `cors` - express related dependencies
* `jest` - testing framework
* `morgan` - for printing each request
* `mysql` - for connecting to mysql
* `node-fetch` - for HTTP requests

