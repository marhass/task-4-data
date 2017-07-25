#!/bin/bash

# Define the variables
NAME=$NAME
QUEST=$QUEST
COLOR=$COLOR
CAPITAL=$CAPITAL
SWALLOW=$SWALLOW

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
# Suggest running other script, if all survey responses have been collected
echo "If all survey responses have been collected, then run script databasescript.sh"

# End.