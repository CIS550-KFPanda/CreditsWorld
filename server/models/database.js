const moment = require('moment');
const SHA256 = require('crypto-js/sha256');
const credentials = require('../credentials.js')
var mysql = require('mysql');

var connection = mysql.createConnection(credentials); 
connection.connect();




module.exports = {

}

