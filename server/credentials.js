

module.exports = {
  host     : process.env.MYSQL_HOST     || 'localhost',
  user     : process.env.MYSQL_USER     || 'root',
  password : process.env.MYSQL_PASSWORD || '5648',
  database : process.env.MYSQL_DATABASE || 'creditsworld',
  port     : process.env.MYSQL_PORT     || '3306',
}

//admin, KFPanda550 


/*

mysql -h mysql–instance1.123456789012.us-east-1.rds.amazonaws.com -u admin -P 1521 -p
*/