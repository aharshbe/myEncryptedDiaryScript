#!/bin/bash

clear

ddate=$(date +"%m-%d-%Y")

echo "-- ** Welcome to your Diary ** --"
espeak "Welcome to your diary. Today is $ddate"

echo "Great, the date is: $ddate"


espeak "How is your day, Austin?"

echo "How is your day, Austin?"

read howis

if [[ "$howis" == "good" ]]; then 

espeak "Wonderful"
echo "Wonderful!"

elif [[ "$howis" == "bad" ]]; then

espeak "Sorry to hear it"
echo "Sorry to hear it"

else 

epseak "I'm not sure I understood what you mean, Austin."
echo "I'm not sure I understood what you mean, Austin."

fi

espeak "Would you like to create a diary entry?"
echo "Would you like to create a diary entry?"

echo "Y/N: "

read diaryentry

if [[ "$diaryentry" == "y" ]]; then

espeak "Perfect, what would you like to record today, Austin?"
echo "Perfect, what would you like to record today, Austin?"

echo "Entry title: "

read title

echo "Entry body: "

read entry

echo "NEW ENTRY" >> diary.txt
echo "Today's date: $ddate" >> diary.txt
echo "*******" >> diary.txt
echo "Entry title: $title" >> diary.txt
echo "*******" >> diary.txt
echo "Entry body: $entry" >> diary.txt 
echo "           " >> diary.txt
echo "           " >> diary.txt


espeak "Entry saved!"
echo "Entry saved!"
espeak "Entry complete."
echo "Entry complete."

else 

espeak "Okay, Austin, until next time."
echo "Okay, Austin, until next time."

fi

espeak "Would you like to open your diary, Austin?"
echo "Would you like to open your diary, Austin?"

echo "Y/N"
read opendiary

if [[ "$opendiary" == "y" ]]; then

xdg-open ./diary.txt

else 

espeak "Okay, no problem."
echo "Okay, no problem."

fi

espeak "Would you like to create another diary entry?"
echo "Would you like to create another diary entry?"

echo "Y/N"

read runagain

if [[ $runagain == "y" ]]; then 

bash mydiary.sh

else 

espeak "Okay, no problem, how about a random quote?"
echo "Okay, no problem, how about a random quote?"

fi

echo "Y/N"

read runfortune

if [[ $runfortune == "y" ]]; then


fortunevar="$(echo $(fortune))"

echo $fortunevar && echo $fortunevar | espeak

else 

echo "Okay, your loss."

fi

echo "See ya!"
espeak "See ya!"

exit 



