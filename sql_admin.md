 * Loading Data into mysql
To load data from a file called myfile.sql (replace myfile.sql with the file that you want to load)

1. type the following: mysql

2.  type the following: SOURCE /workspace/mysql-gitpod-setup/myfile.sql

It should look similar to below:

```
gitpod /workspace/mysql-gitpod-setup (main) $ mysql
> SOURCE /workspace/mysql-gitpod-setup/myfile.sql;
```

Another way is to use the mysql command directly 

1. type the following: mysql < myFile.sql

It should look somehting like the text below:

```
gitpod /workspace/mysql-gitpod-setup (main) $ mysql < myFile.sql
```


 To "dump" a datatabase into a file, say database myDB into file myDB.sql

 1. mysqldump myDB > myDB.sql

 (note to restore the database from this file use the source command above)


 * Saving data, triggers, and stored procedures in a database to a file(s)
 To "dump" a datatabase into a file, say database myDB into file myDB.sql

 1. mysqldump --routines --triggers the_database_name > myDB.sql

 (note to restore the database from this file use the source command above)

```
mysql --skip-column-names --batch -e 'select CONCAT("DROP TABLE IF EXISTS ", TABLE_SCHEMA, ".", TABLE_NAME, "; CREATE OR REPLACE VIEW ", TABLE_SCHEMA, ".", TABLE_NAME, " AS ", VIEW_DEFINITION, "; ") table_name from information_schema.views'
```


 * User Administration
 
 Create a new user and give them access to only one database

```
CREATE USER 'new_u'@'localhost' IDENTIFIED BY 'new_password';
GRANT ALL ON toy_sales.* TO 'new_u'@'localhost';
GRANT USAGE ON toy_sales.* TO 'new_u'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'new_us'@'localhost';
select user from mysql.user where user like '%new%';
DROP USER 'new_u'@'localhost';

CREATE USER 'new_user'@'localhost'
  IDENTIFIED WITH caching_sha2_password BY 'new_password'
  PASSWORD EXPIRE INTERVAL 180 DAY
  FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;
```

 To login with mysql

 ```
 mysql --help
 mysql -u new_user -p toy_sales
 ```
