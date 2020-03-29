const db = require('../models/database.js');
const moment = require('moment')

const errorMessageForError = err => {
  if (err instanceof Error) {
    if (!!err.code) {
      const codes = {
      }
      return codes[`${err.code}`] || err
    } else return err.message 
  } else return err
}



module.exports = {
  
}

