const moment = require('moment');
const SHA256 = require('crypto-js/sha256');
const credentials = require('../credentials.js')
var mysql = require('mysql');

const connection = mysql.createConnection(credentials);
 
connection.connect();

const query = str => {
  return new Promise(function(resolve, reject) {
    connection.query(str, function (err, rows, fields) {
      if (err) return reject(err)
      else return resolve(rows, fields)
    })
  })
}

module.exports = { query, connection }