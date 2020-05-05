/*
  scehmas.js: connects the mysql database to be used in other parts of the app
*/

const moment = require('moment');
const SHA256 = require('crypto-js/sha256');
const credentials = require('../credentials.js')
var mysql = require('mysql');

let test = false;

let test_credentials = {
  host     : 'localhost',
  user     : 'root',
  database : 'creditsworld_test',
  port     : '3306',
}
const connection = mysql.createConnection(test ? test_credentials : credentials);
connection.connect();

//Wrapped a connection.query in a Promise bec they let you group promises together  
//and utilize .then that simplifies code 

const query = (str, params=[]) => {
  return new Promise(function(resolve, reject) {
    connection.query(str, params, function (err, rows, fields) {
      if (err) return reject(err)
      else return resolve(rows)
    })
  })
}

//Example of what our calls would look like if we didn't have this wrapper
/* 
connection.query(str, function() {
  connection.query(str, function() {
    connection.query(str, function() {
      connection.query(str, function() {}
      
    }
  }
})
db.query(str)
  .then(data => db.query())
  .then(data => ...)
*/


module.exports = { query, connection }