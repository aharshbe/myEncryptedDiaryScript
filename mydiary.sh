#!/bin/bash

clear

echo "Do you need to lock/unlock your diary before opening?"

echo "Y/N"

read lockunlock

if [[ $lockunlock == "y" ]]; then

#To unlock

echo "Would you like to unlock your diary?"

read theiranser

if [[ $theiranser == "y" ]]; then 

echo "Enter password to unlock diary: "

openssl enc -in diary.txt.enc \
    -d -aes-256-cbc \
    -pass stdin > diary.txt

rm diary.txt.enc

echo "Unlocked."

else

echo "No problem, you Diary is locked."

fi


#To lock

echo "Would you like to lock your diary?"

read theiranser

if [[ $theiranser == "y" ]]; then

echo "Enter password to lock diary: "

openssl enc -in diary.txt \
    -aes-256-cbc \
    -pass stdin > diary.txt.enc

echo "Locked."

rm diary.txt

else 

echo "No problem, your Diary is unlocked."

fi

else

echo "cool."

fi

echo "Start Diary?"

echo "Y/N"

read startdiaryy

if [[ $startdiaryy == "y" ]]; then

clear

ddate=$(date +"%m-%d-%Y")

echo "-- ** Welcome to your Diary ** --"
espeak "Welcome to your diary. Today is $ddate"

echo "Great, the date is: $ddate"


espeak "How is your day, Austin?"

echo "How is your day, Austin? (good/bad)"

read howis

if [[ "$howis" == "good" ]]; then 

espeak "Wonderful"
echo "Wonderful!"

elif [[ "$howis" == "bad" ]]; then

espeak "Sorry to hear it, that's bullocks."
echo "Sorry to hear it, that's bullocks."

else 

epseak "I'm not sure I understood what you mean, Austin."
echo "I'm not sure I understood what you mean, Austin."

fi

espeak "Would you like to create a diary entry?"
echo "Would you like to create a diary entry?"

echo "Y/N: "

read diaryentry

if [[ "$diaryentry" == "y" ]]; then

#To unlock

espeak "Please unlock your diary, Austin."
echo "Please unlock your diary, Austin."

echo "Enter password to unlock diary: "

openssl enc -in diary.txt.enc \
    -d -aes-256-cbc \
    -pass stdin > diary.txt

echo "Unlocked."

rm diary.txt.enc


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

else 

espeak "Okay, Austin, until next time."
echo "Okay, Austin, until next time."

fi

espeak "Would you like to open your diary, Austin?"
echo "Would you like to open your diary, Austin?"

echo "Y/N"
read opendiary

if [[ "$opendiary" == "y" ]]; then

#To unlock

echo "Would you like to unlock your diary?"

read theiranser

if [[ $theiranser == "y" ]]; then 

echo "Enter password to unlock diary: "

openssl enc -in diary.txt.enc \
    -d -aes-256-cbc \
    -pass stdin > diary.txt

rm diary.txt.enc

echo "Unlocked."

else

echo "No problem, you Diary is locked."

fi

xdg-open ./diary.txt

else 

espeak "Okay, no problem."
echo "Okay, no problem."

#To lock

espeak "Please lock your Diary."
echo "Please lock your Diary."

echo "Enter password to lock diary: "

openssl enc -in diary.txt \
    -aes-256-cbc \
    -pass stdin > diary.txt.enc

echo "Locked."

rm diary.txt

fi

espeak "Would you like to create another diary entry?"
echo "Would you like to create another diary entry?"

echo "Y/N"

read runagain

if [[ $runagain == "y" ]]; then 

espeak "Did you open your Diary earlier?"
echo "Did you open your Diary earlier?"

echo "Y/N"

read didopendiary

if [[ $didopendiary == "y" ]]; then

#To lock

espeak "Please lock your Diary."
echo "Please lock your Diary."

echo "Enter password to lock diary: "

openssl enc -in diary.txt \
    -aes-256-cbc \
    -pass stdin > diary.txt.enc

echo "Locked."

rm diary.txt

bash mydiary.sh

else 

bash mydiary.sh

fi

else 

echo "Okay."

fi

espeak "Would you like to hear a adage? They are fun!"
echo "Would you like to hear a adage? They are fun!"

echo "Y/N"

read runfortune

if [[ $runfortune == "y" ]]; then


fortunevar="$(echo $(fortune))"

echo $fortunevar && echo $fortunevar | espeak

else 

echo "Okay, your loss."

fi

espeak "Did you open your Diary earlier?"
echo "Did you open your Diary earlier?"

echo "Y/N"

read didopendiary

if [[ $didopendiary == "y" ]]; then

#To lock

espeak "Please lock your Diary."
echo "Please lock your Diary."

echo "Enter password to lock diary: "

openssl enc -in diary.txt \
    -aes-256-cbc \
    -pass stdin > diary.txt.enc

echo "Locked."

rm diary.txt

fi

echo "See ya!"
espeak "See ya!"

clear

exit 

else 

echo "Enjoy your day! :-)"

clear

fi



