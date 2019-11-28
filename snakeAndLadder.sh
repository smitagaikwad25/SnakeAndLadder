#!/bin/bash -x

echo "WelCome In SnakeAndLadder Simulator" 


declare MAXPOSITION=100

#variables
position1=0
position2=0
flag=false
position=0
player1=0
player2=0

declare -A dieStore
declare -A dieStore2

function  funnyGame()
	{
			die=$((RANDOM%6+1))
			random=$((RANDOM%3+1))
			position=$1
			case $random in
				1)
					position=$position ;;
				2)
					position=$(( $position + $die )) ;;
				3)
					position=$(( $position - $die )) ;;
			esac
			if [ $position -lt 0 ]
			then
				position=0
			fi

			if [ $position -gt $MAXPOSITION ]
			then
				position=$(( $position-$die ))
			fi 

			echo $position
	}

function choosePlayer()
	{
		local player1DieCount=0
		local player2DieCount=0
		while [ $player1 -lt $MAXPOSITION ] && [ $player2 -lt $MAXPOSITION ]
		do
			if [ $flag == false ]
			then
				player1=$( funnyGame $player1 )
				flag=true
				echo "player1 position" $player1
				player1DieCount=$(( $palyer1DieCount + 1 ))
			else
				player2=$( funnyGame $player2 )
				flag=false
				echo "player2 position" $player2
				player2DieCount=$(( $palyer2DieCount + 1 ))
			fi
			dieStore[$player1DieCount]=$player1
			dieStore2[$player2DieCount]=$player2

		done
		totalCountPlayer1=`for o in ${!dieStore[@]}
		do echo ${dieStore[$o]}
		done`
		totalCountPlayer2=`for k in ${!dieStore2[@]}
		do echo ${dieStore2[$k]}
		done`
		echo
		echo
		if [ $totalCountPlayer1 -eq $MAXPOSITION ]
		then
			echo "Player1 is winner"
		else
			echo "Player2 is winner"
		fi

	}
choosePlayer
#funnyGame

