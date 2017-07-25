#!/bin/bash

##### Define the variables. #####
NAME=$NAME
QUEST=$QUEST
COLOR=$COLOR
CAPITAL=$CAPITAL
SWALLOW=$SWALLOW

##### Ask each question of the user running the script. #####
# Question 1
echo "What is your name?"
read NAME
# Question 2
echo "What is your quest?"
read QUEST
# Question 3
echo "What is your favorite color?"
read COLOR
# Question 4
echo "What is the capital of Assyria?"
read CAPITAL
# Question 5
echo "What is the airspeed velocity of an unladen swallow?"
read SWALLOW
echo "Thank you, Sir $NAME. Your responses have been recorded."
#Save answers to ALL NAMES' .csv file
echo "$NAME,$QUEST,$COLOR,$CAPITAL,$SWALLOW,`date --iso-8601=seconds`,$RANDOM" | cat >> /home/cabox/workspace/compileddata.csv
#Move that file to another directory? And write it to the database?


# Suggest running other script, if all survey responses have been collected
echo "If all survey responses have been collected, then run script databasescript.sh"

#   specify temp directory variable
#TEMPDIR="./temp"
#   specify names of variables in a CSV list
#VARNAMES="name,quest,favoritecolor,assyriancapital,swallowvelocity,datestamp,UID"
#   make temp directory
#mkdir $TEMPDIR/
#   copy all CSV files into temp directory
#cp /*.csv $TEMPDIR/
#   Create a new csv with variables in a header row
#echo "$VARNAMES" > $TEMPDIR/00varheader.csv
#   concatenate all data
#cat $TEMPDIR/*.csv > ./`date --iso-8601`-survey-data-compiled.csv
#   clean up temp files
#rm -r $TEMPDIR

###
