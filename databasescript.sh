#!/bin/bash

# Once all responses are recorded, concatenate all data
CAT=`date --iso-8601`-survey-data-compiled.csv
cat /home/cabox/workspace/responses/*.csv > /home/cabox/workspace/responses/$CAT
# Move it so mysql doesn't break 
#cp $CAT /var/lib/mysql-files/
#cp $CAT /home/cabox/workspace/responses/


#connect to a MySQL database (HINT: this will involve setting variables for MySQL USERNAME, PASSWORD, and LOCATION)
#mysql -u root -p"root" -e "CREATE DATABASE responsesurvey;"
#enter the data input by users into a MySQL database
mysql -u root -p"root" -e responsesurvey "LOAD DATA INFILE '/home/cabox/workspace/responses/$CAT' INTO TABLE SurveyResponses FIELDS TERMINATED BY ',';"
mysql -u root -p"root" -e responsesurvey "SHOW COLUMNS FROM SurveyResponses"

#dump the MySQL database into a .sql file in your repository directory with the rest of your files after it has been modified with new data (IMPORTANT: make sure the filename has a timestamp)
