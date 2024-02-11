/* ICT 128i 003 - Class 3 example - Getting started with MySQL */

/* Step 1 - Use MySQL
Most of the commands we will type will be in the terminal window.  The terminal window
is actually the command line interface on the virtual machine that we have created 
in the Gitpod workspace. The virtual machine uses the linux operating system, so in 
the terminal window we can run any of the standard linux commands.

However, we are learning MySQL not linux so let's focus on MySQL. When the virtual
machine was created a MySQL Server was installed and started and what we want to do
is to access this server. To do this type the following in the terminal window
mysql

note that the prompt at the bottom of the terminal now looks like
mysql>

this means that you are now in the MySQL database
*/



/* Step 2 - List the databases

The command below lists the databases, remember to add the semi-colon
at the end of the command and to type the enter or return key afterwards.

Note that there are 4 databases that were created by the MySQL server
to store information about the MySQL database.  Do not change anything in 
these databases, it could break your MySQL Server.  They MySQL databases are:
    information_schema
    mysql
    performance_schema
    sys
    
There is one user created database called: 
    classicmodels 
*/
SHOW DATABASES;


/* Step 3 - Change databases

Let's checkout what is in the one user created database, the first
think we will need to do is to tell MySQL which database we want to
check out.  This can be done by the command below.

Rememember the semi-colon and to type return/enter after entering the command.
*/
USE classicmodels;



/* Step 4 - List the Tables

The first thing we would like to know is what are the tables
in the database, the command below will list the table. There
should be 8 tables listed, based on the table names, what do you
think the purpose of this database is?
*/
SHOW TABLES;


/* Step 5 - Check out the Tables

Next we might want to know the colunns, or attributes for each of
the tables. This can be done by using the first command below 'DESCRIBE'.
It will list all of the columns in the table, their attributes, if
the column allows NULL values, if there is a default value for the column,
and if it is a primary or foreign key.

Sometimes this is not enough information, sometimes we might want to know
what table the foreign key references or is connected with or other details
that we can not see with the DESCRIBE Command. In this case to see the full
details of the table used the "SHOW CREATE TABLE" command is needed, 
also shown below.

What are the differences and similarities between the two commands?
Do you think you could use the information from the "SHOW CREATE TABLE"
to create a new table?

*/
DESCRIBE customers;
SHOW CREATE TABlE customers;


/* STEP 6 - Table Contents 

The SELECT SQL statement can be used to see the data stored in each of the 
tables try the commands below to list the data in the offices and employees
tables

How many rows are in each of these tables?  (hint: look at the last line)

Try on your own to list the contents of the orders table or the payments table.
*/
SELECT * FROM offices;
SELECT * FROM employees;


/* STEP 7 - More Select Commands

There are 110 rows in the prodcuts table, that's a lot to read, what if
we want to look at only some of the information?

We can use LIMIT to limit how many rows, see the first example below which
shows only the first 10 rows.  How would you change this command to show 1 
row of data, how about 5?

We can choose which columns to list, '*' which we have been using so far 
tells MySQL to show all of the columns. Instead of '*' we can list the 
columns.  The second example below shows the productName, productLine, 
and productVendor columns only.

The third exmple below uses LIMIT and a specific set of column.

Note that the second and third queries we wrote to be on multiple lines
this is to make it easier to read and is a common way of writing SQL
queries.

Now try some of your own on the other tables.

*/
SELECT * FROM products LIMIT 10;

SELECT productName, productLine, productVendor 
FROM products;

SELECT productName, productLine, productVendor 
FROM products 
LIMIT 5;



/* STEP 8 - Exit MySQL
Somtimes it might be needed to go run commands in the terminal window, linux commands
or we are done for the day.  It is good practice to not stay within the server.

Type
    exit

to leave the MySQL database, and if you want to go back and run more queries, just type
    mysql

to go back into the database, don't forget to change to the database before
doing select queries on the tables.

*/
