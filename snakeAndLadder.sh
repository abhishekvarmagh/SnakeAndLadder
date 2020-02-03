#! /bin/bash

echo "Welcome to Snake And Ladder Simulator"

START_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

currentPosition=$START_POSITION
countDie=0
playerOnePosition=$START_POSITION
playerTwoPosition=$START_POSITION
flag=true

declare -A playerPosition

function switchPlayer()
{
	if [[ $flag == true ]]
	then
		countDie=$(( countDie+1 ))
		currentPosition=$playerOnePosition
		playerNum=1
		rollingDie
		playerOnePosition=$currentPosition
		flag=false
	else
		currentPosition=$playerTwoPosition
		playerNum=2
		rollingDie
		playerTwoPosition=$currentPosition
		flag=true
	fi
}

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
	playerPosition[Player_"$playerNum"_"$countDie"]=$currentPosition
}

while [ $currentPosition -ne $WINNING_POSITION ]
do
	switchPlayer
done

if [ $playerOnePosition -eq $WINNING_POSITION ]
then
	echo "Player 1 : Win!!!"
elif [ $playerTwoPosition -eq $WINNING_POSITION ]
then
	echo "Player 2 : Win!!!"
fi
