# sql-challenge
Employee Database: A Mystery in Two Parts

# Tasks

* Created Postgres database employees_db

* Used quickdatabasediagrams.com to generate ERD and schema sql statements

* Modified the schema

  * Added a check constraint on the employees table, sex column to only allow 'M' or 'F'

  * Added a trigger on the employees table to check if birth date was greater than the current date (this was done because it was a 2 digit year and any values that were less than 70 were interpreted as 20xx)

    * If yes, subtracted 100 years from the date to convert to 19xx

* Loaded csv files in the following order:

  * departments.csv

  * titles.csv

  * employees.csv

  * salaries.csv

  * dept_emp.csv

  * dept_manager.csv

* Executed queries in the queries.sql file

* Created jupyter notebook Employee.ipynb

* Imported tables from Postgres employees_db into Data Frames

* Created Salary Range Histogram with 8 salary ranges

* Imported Average Salary per Title into a Data Frame using a query in Postgres

* Created Bar Chart of Average Salary by Title
