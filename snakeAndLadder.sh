#!/bin/bash -x

echo "WelCome In SnakeAndLadder Simulator"

#variables
position=0

function  funnyGame()
	{
		local MAXPOSITION=100
		while [ $position -lt $MAXPOSITION ]
		do
			die=$((RANDOM%6+1))
			random=$((RANDOM%3+1))
			case $random in
				1)
					position=$position
					echo "NO Play" ;;
				2)
					position=$(( $position+$die ))
					echo "position of player $position" ;;
				3)
					position=$(( $position-$die )) 
					echo "position after snake $position" ;;
			esac
			if [ $position -lt 0 ]
			then
				position=0
			fi

			if [ $position -gt $MAXPOSITION ]
			then
				position=$(( $position-$die ))
			fi 

		done

	}
funnyGame
