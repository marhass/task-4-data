#!/bin/bash

# Establish variables
USER=root
PASS=root
DATABASE=bridgeofdeath
TABLE=tblSurveyQuestions
INFILE=compileddata.csv

# Move to sql directory
sudo cp ./$INFILE /var/lib/mysql-files/
# Create database
# From John's script, because I keep running into errors: Check if database exists, and if not, create database
echo "Checking for database..."
DBCHECK=`mysql -u"$USER" -p"$PASS" -e "show databases;" | grep -Fo $DATABASE`
if [ "$DBCHECK" == "$DATABASE" ]; then
   echo "Database exists"
else
   echo "Database does not exist. Creating database..."
   mysql -u"$USER" -p"$PASS" -e "CREATE DATABASE $DATABASE"
fi
# Create a table with variables within database
echo "Creating Table"
mysql -u"$USER" -p"$PASS" -e "CREATE TABLE $TABLE (Name VARCHAR(255), Quest VARCHAR(255), FavoriteColor VARCHAR(255), AssyrianCapital VARCHAR(255), SwallowVelocity VARCHAR(255), Date TIMESTAMP, UID VARCHAR(255));" $DATABASE
# Load CSV file into db
echo "Loading CSV file"
mysql -u"$USER" -p"$PASS" -e "LOAD DATA INFILE '/var/lib/mysql-files/$INFILE' INTO TABLE $TABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $DATABASE
# Dump it out into a sql file
echo "dump"
mysqldump -u"$USER" -p"$PASS" $DATABASE > `date --iso-8601`-$DATABASE.sql
# End.