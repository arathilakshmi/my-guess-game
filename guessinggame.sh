#!/usr/bin/env bash
# File : guessinggame.sh
# Author : Arathilakshmi Mukundan

# Function used to validate the user's guess - prompts the user to guess again if the guess is wrong or invalid , and congratulates the user if the guess is right.
function guess_the_num {
	usr_guess=$@
	num_of_files=$(ls | wc -l)
	val_flg=1
	while [[ val_flg -eq 1 ]]
	do
		if [[ ! $usr_guess =~ ^[0-9]+$ ]]
		then
			echo "Invalid input. Please try again :"
		elif [[ $usr_guess -ne $num_of_files  ]]
		then
			if [[ $usr_guess -lt $num_of_files ]]
			then
				echo "Your guess is too low. Please try again :"
			else
				echo "Your guess is too high. Please try again :"
			fi
		else
			if [[ $usr_guess -eq $num_of_files  ]]
			then
				val_flg=0
			fi
		fi
		if [[ val_flg -eq 1 ]]
		then
			read usr_guess
		fi
	done
	echo "Congratulations !!! You have guessed the right answer !! "
}

# Prompt the user to guess the number of files in the current directory
echo -e "Hello User !! "'\n'"Welcome to the Guessing Game. Can you tell the number of files that are available in the current directory ?"'\n'"Please enter your guess :"
read usr_inp

guess_the_num $usr_inp
