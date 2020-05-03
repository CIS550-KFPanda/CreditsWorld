
//Each of these methods receive an endpoint, body, and a token (null if not given)
//the elements in the body are processed to become URLSearchParameters then sent over
//*************************/
//**Templates for methods */
//*************************/
const fetch = require('node-fetch');

const methods = {
  get: async function (baseUrl,endpoint, body, token = null) {
    const options = {
      method: 'GET',
      headers: {
        ...(token && { Authorization: `Bearer ${token}` })
      }
    };
    
    const paramString = new URLSearchParams(body);
    const response = await fetch(`${baseUrl}/${endpoint}?${paramString}`, options);
    const json = await response.json();

    if (!response.ok) throw Error(JSON.stringify(json)); 
    return json;
  },

  post: async function (baseUrl, endpoint, body, token = null) {
    const options = {
      method: 'POST',
      headers: {
        'Accept': "*/*",
        'Content-Type': 'application/json',
        // ...(token && { Authorization: `Bearer ${token}` })
      },
      
      body: JSON.stringify(body)
    };
    const response = await fetch(`${baseUrl}/${endpoint}`, options);
    const json = await response.json();

    if (!response.ok) {
      if (response.status === 422) {
        json.errors.forEach(error => {
          throw Error(`${error.param} ${error.msg}`);
        });
      }

      throw Error(json.message);
    }

    return json;
  },

  delete: async function (baseUrl, endpoint, token = null) {
    const options = {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        ...(token && { Authorization: `Bearer ${token}` })
      }
    };

    const response = await fetch(`${baseUrl}/${endpoint}`, options);
    const json = await response.json();
    if (!response.ok) {
      if (response.status === 401) throw Error('unauthorized');
      throw Error(json.message);
    }
    return json;
  }
};

/**********************************************************/
/** ACTUAL FUNCTIONS TO BE CALLED / INTERACT WITH BACKEND */
/**********************************************************/
// run the following command to get your local ip: ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
// FOR TESTING
// const baseUrl = 'http://192.168.1.108:8081/api';
const geniusBaseUrl = 'https://api.genius.com'; 
const api_creds = require('../api_creds')

/*
    searchGenuisSong: search Genius to get a songId and a artistId for a songName and author 
    return: a list of objects representing the possible song matches
*/
async function searchGenuisSong(songName, author) {
  return methods.get(geniusBaseUrl, `search`, { q: songName + " " + author }, api_creds.token);
}

async function getSong(song_id) {
  return methods.get(geniusBaseUrl, `songs/${song_id}`, { }, api_creds.token);
}

async function getArtist(artist_id) {
  return methods.get(geniusBaseUrl, `artists/${artist_id}`, { }, api_creds.token);
}

async function getSongLyrics(song_id) {
  return methods.get(geniusBaseUrl, `songs/${song_id}/lyrics`, { }, api_creds.token);
}



module.exports = {
  searchGenuisSong,
  getSong,
  getArtist,
  getSongLyrics
}

