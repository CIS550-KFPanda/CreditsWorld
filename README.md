# CreditsWorld

Artists and repertoire (known as A&R) is the division of a record label or music publishing company that is responsible for talent scouting and overseeing the artistic development of recording artists and songwriters1. To create meaningful music sessions, A&R managers need to pair up artists, songwriters, and producers. This matchmaking is often done by leveraging personal connections and is kept personally. 

The goal of this project is to create a website that A&R managers could visit to learn about what type of connections worked in the past, to create more meaningful connections in the future.
## Postman API routes 
Current Strategy is to do the following:
1. Get a public playlist of your choice from Spotify and populate your "Songs" data table with all the info you want from that song. 
2. Using this new table, get the song title and song artist and create a new "People" table by calling Genius API. You will need to make two separate routes to make this table, fist get the songID and then use the songID to get info on that song. 

### Helpful links 
* Node Wrapper for making Spotify API Calls: https://github.com/thelinmichael/spotify-web-api-node
* Making Calls to Spotify API: https://developer.spotify.com/documentation/general/guides/authorization-guide/#authorization-code-flow

### Comments 
Taken from Spotify Autorization link: 
* Accessing your data without showing a login form
> I want to interact with the web API and show some data on my website. I see that the endpoints I require authorization, but I don’t need/want a login window to pop-up, because I want to grant my own app access to my own playlists once. Is there any way of doing this?
You basically need an access token and a refresh token issued for your user account. To obtain a pair of access token - refresh token, follow the Authorization Code Flow (if you need a certain scope to be approved) or Client Credentials (if you just need to sign your request, like when fetching a certain playlist). Once you obtain them, you can use your access token and refresh it when it expires without having to show any login form.
* I want to create a quick script to add a new song every day to my playlist. Is there a way I can do this without having to open the browser and log in every day? I could set my user and password in the script.
> The Spotify Web API does not support authorization through username and password. For this use case you would obtain an access token through the Authorization code. See the response above.

* Reason for using Client Credentials Flow:
> The advantage here in comparison with requests to the Web API made without an access token, is that a higher rate limit is applied.
