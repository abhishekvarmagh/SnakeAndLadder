#! /bin/bash

echo "Welcome to Snake And Ladder Simulator"

START_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

currentPosition=$START_POSITION
dieCount=0

declare -A position

function rollingDie()
{
	getNumber=$(( (RANDOM%6)+1 ))
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
			if [ $currentPosition -gt $WINNING_POSITION ]
			then
				currentPosition=$(( currentPosition-getNumber ))
			fi
			;;
		$SNAKE)
			currentPosition=$(( currentPosition-getNumber ))
			if [ $currentPosition -lt $START_POSITION ]
			then
				currentPosition=$START_POSITION
			fi
			;;
	esac
	updatePosition
}

function updatePosition()
{
	position[Roll-"$countDie"]=$currentPosition
}

while [ $currentPosition -ne $WINNING_POSITION ]
do
	countDie=$(( countDie+1 ))
	rollingDie
done

echo "Number of Times Die Roll : " $countDie


