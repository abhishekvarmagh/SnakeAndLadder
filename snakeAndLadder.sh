#! /bin/bash

echo "Welcome to Snake And Ladder Simulator"

NO_OF_PLAYERS=1
START_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2

currentPosition=$START_POSITION

function rollingDie()
{
	getNumber=$(( (RANDOM%6)+1 ))
	echo "Generated Die Number : "$getNumber
	checkOption
}

function checkOption()
{
	case $(( RANDOM%3 )) in
		$NO_PLAY)
			currentPosition=$currentPosition
			;;
		$LADDER)
			currentPosition=$(( currentPosition+getNumber ))
			;;
		$SNAKE)
			currentPosition=$(( currentPosition-getNumber ))
			;;
	esac
	echo "Current Position : " $currentPosition
}

rollingDie
