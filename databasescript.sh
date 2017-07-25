#!/bin/bash

# Establish variables
USER=root
PASS=root
DATABASE=riddles
TABLE=tblSurveyQuestions
INFILE=compileddata.csv

# Move to sql directory
sudo cp ./INFILE /var/lib/mysql-files/
# Create database
mysql -u"$USER" -p"$PASS" -e "CREATE DATABASE $DATABASE"
# Create a table with variables within database
mysql -u"$USER" -p"$PASS" -e "CREATE TABLE $TABLE (Name VARCHAR(255), Quest VARCHAR(255), FavoriteColor VARCHAR(255), AssyrianCapital VARCHAR(255), SwallowVelocity VARCHAR(255), Date TIMESTAMP, UID INTEGER;" $DATABASE
# Load CSV file into db
mysql -u"$USER" -p"$PASS" -e "LOAD DATA INFILE '/var/lib/mysql-files/$INFILE' INTO TABLE $TABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $DATABASE
# Dump it out into a sql file
mysqldump -u"$USER" -p"$PASS" $DATABASE > `date --iso-8601`-$DATABASE.sql
# End.