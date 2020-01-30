#! /bin/bash

echo "Welcome to Snake And Ladder Simulator"

NO_OF_PLAYERS=1
START_POSITION=0

function rollingDie()
{
	getNumber=$(( (RANDOM%6)+1 ))
	echo $getNumber
}

rollingDie
