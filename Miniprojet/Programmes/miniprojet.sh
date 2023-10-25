#!/usr/bin/env bash

URLS=$1
I=1

if [ -n $URLS ];
then
	while read -r line;
	do
		TEST=$(curl -is ${line} | head -n1 | egrep -o "[[:digit:]]{3}")
		echo -e "$I\t${line}\t$TEST";
		I=$(expr $I + 1)
	done < $URLS
else
	echo "Le script attend un argument en entree !"
fi
