#!/bin/bash -x

echo "WelCome In SnakeAndLadder Simulator"

#variables
position=0

function  funnyGame()
	{
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

	}
funnyGame
