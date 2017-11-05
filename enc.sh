#!/bin/bash

#touch diaryentry.txt

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


