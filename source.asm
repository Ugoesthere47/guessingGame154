;------------------------------------------------------------
; CMPR 154 - Spring 2024
; 
; Team Name: Avengers Assembly
;
; Team Name Members: Matias Aguirre, Jacob Fitzgerald, Eduardo Guerra, Hugo Huerta
;
; Creation Date: June 6, 2024
;
; Collaboration:
;Professor Alweheiby Lecture Notes
;----------------------------------------------------------

INCLUDE IRVINE32.INC

.data; (insert variables here)
teamName BYTE "Avengers Assembly" ,0dh,0ah,0dh,0ah,0dh,0ah ,0
playerName BYTE 31 DUP(?)
menu BYTE " *** MAIN MENU ***" ,0dh,0ah,0dh,0ah
     BYTE "Please Select one of the following: " ,0dh,0ah,0dh,0ah
 BYTE "   1: Display my available credit" ,0dh,0ah
 BYTE "   2: Add credits to my account" ,0dh,0ah
 BYTE "   3: Play the guessing game" ,0dh,0ah
 BYTE "   4: Display my statistics" ,0dh,0ah
 BYTE "   5: To exit",0dh,0ah,0dh,0ah
 BYTE "Enter your choice: ",0
playerNameStr BYTE "Player Name: ",0
availableCreditStr BYTE "Avaliable Credit: ",0
gamesPlayedStr BYTE "Games Played: ",0
correctGuessesStr BYTE "Correct Guesses: ",0
missedGuessesStr BYTE "Missed Guesses: ",0
moneyWonStr BYTE "Money Won: $",0
moneyLostStr BYTE "Money Lost: $",0
goodbyeMsg BYTE "Thank you for playing. Ending Program.",0


; ERROR MESSAGES
tooManyCredits BYTE "=> Error: Maximum allowable credits is $20.00. Please enter a different amount and try again. ",0dh,0ah,0
notEnoughCredits BYTE "=> Error: Not enough credits. You need at least $1.00 to play the game.",0
invalidOption BYTE "=> Error: Invalid menu option. Please enter a correct menu option.",0


; VARIABLES FOR PROMPTING
promptPlayerName BYTE "=> Please enter your name: ",0
availableBalance BYTE "=> Your available balance is: $",0
promptBalance BYTE "=> Please enter the amount you would like to add: ",0
promptIntInput BYTE "=> Please enter a random number 1-10: ",0
promptPlayAgain BYTE "=> Would you like to play again (1 for yes, any other decimal number for no): ",0


; VARIABLES FOR PLAYING GAME (OPTION 3)
correctGuess BYTE "=> You correctly guessed the number! Adding $2 to your balance.", 0
incorrectGuess BYTE "=> You incorrectly guessed the right number of: ",0

; NUMBER VARIABLES
userChoice BYTE ?
balance WORD 0; stores the avaliable credit
MAX_ALLOWED EQU 20; maximum amount of credits to be added
amount WORD0; amount of credit entered by user
randomInt BYTE 0; stores random number generates in option 3
userInt BYTE 0; stores user's inputted number
correctGuesses WORD 0   ; number of times user guessed number correctly
missedGuesses WORD 0; number of times user guessed number incorrectly
gamesPlayed WORD 0; number of times user has played the game
moneyWon WORD 0; stores number of money won from playing game
moneyLost WORD 0; stores number of money lost from playing game


.code; (insert executable instructions here)
main proc

MOV edx,OFFSET teamName;prints Team Name
CALL WriteString
MOV edx, OFFSET promptPlayerName;prompt user for a name
call WriteString





;Can't figure out how to store a string into a variable
MOV ecx, 30;length of string
CALL ReadString
MOV playerName, TYPE edx
CALL crlf







programLoop:
MOV edx,OFFSET menu;prints menu
CALL WriteString


CALL ReadDec;collects inputed choice
MOV userChoice, al;userChoice contains user's input

... (154 lines left)
Collapse
FinalProjectTextCode.txt
9 KB
Attachment file type: code
Irvine.asm
8.19 KB
I pretty much finished option 3 and 4
I couldn't figure out how to read a string that the user inputted so if someone can help me figure that out, then that would basically be it for the basics of the project
All that would be left would be to error check my code and make sure nothing causes the program to crash
If you guys also want to modify it so it looks more visually appealing, whether that be organizing my code, adding new lines to output feed, or changing color of the text/background, feel free to do so
syish — Yesterday at 5:16 PM
okay ill get to that and have it by tomorrow
﻿
;------------------------------------------------------------
; CMPR 154 - Spring 2024
; 
; Team Name: Avengers Assembly
;
; Team Name Members: Matias Aguirre, Jacob Fitzgerald, Eduardo Guerra, Hugo Huerta
;
; Creation Date: June 6, 2024
;
; Collaboration:
;	Professor Alweheiby Lecture Notes
;----------------------------------------------------------

INCLUDE IRVINE32.INC

.data		; (insert variables here)
teamName BYTE "Avengers Assembly" ,0dh,0ah,0dh,0ah,0dh,0ah ,0
playerName BYTE 31 DUP(?)
menu BYTE " *** MAIN MENU ***" ,0dh,0ah,0dh,0ah
     BYTE "Please Select one of the following: " ,0dh,0ah,0dh,0ah
	 BYTE "   1: Display my available credit" ,0dh,0ah
	 BYTE "   2: Add credits to my account" ,0dh,0ah
	 BYTE "   3: Play the guessing game" ,0dh,0ah
	 BYTE "   4: Display my statistics" ,0dh,0ah
	 BYTE "   5: To exit",0dh,0ah,0dh,0ah
	 BYTE "Enter your choice: ",0
playerNameStr BYTE "Player Name: ",0
availableCreditStr BYTE "Avaliable Credit: ",0
gamesPlayedStr BYTE "Games Played: ",0
correctGuessesStr BYTE "Correct Guesses: ",0
missedGuessesStr BYTE "Missed Guesses: ",0
moneyWonStr BYTE "Money Won: $",0
moneyLostStr BYTE "Money Lost: $",0
goodbyeMsg BYTE "Thank you for playing. Ending Program.",0


; ERROR MESSAGES
tooManyCredits BYTE "=> Error: Maximum allowable credits is $20.00. Please enter a different amount and try again. ",0dh,0ah,0
notEnoughCredits BYTE "=> Error: Not enough credits. You need at least $1.00 to play the game.",0
invalidOption BYTE "=> Error: Invalid menu option. Please enter a correct menu option.",0


; VARIABLES FOR PROMPTING
promptPlayerName BYTE "=> Please enter your name: ",0
availableBalance BYTE "=> Your available balance is: $",0
promptBalance BYTE "=> Please enter the amount you would like to add: ",0
promptIntInput BYTE "=> Please enter a random number 1-10: ",0
promptPlayAgain BYTE "=> Would you like to play again (1 for yes, any other decimal number for no): ",0


; VARIABLES FOR PLAYING GAME (OPTION 3)
correctGuess BYTE "=> You correctly guessed the number! Adding $2 to your balance.", 0
incorrectGuess BYTE "=> You incorrectly guessed the right number of: ",0

; NUMBER VARIABLES
userChoice BYTE ?
balance WORD 0			; stores the avaliable credit
MAX_ALLOWED EQU 20		; maximum amount of credits to be added
amount WORD	0			; amount of credit entered by user
randomInt BYTE 0		; stores random number generates in option 3
userInt BYTE 0			; stores user's inputted number
correctGuesses WORD 0   ; number of times user guessed number correctly
missedGuesses WORD 0	; number of times user guessed number incorrectly
gamesPlayed WORD 0		; number of times user has played the game
moneyWon WORD 0			; stores number of money won from playing game
moneyLost WORD 0		; stores number of money lost from playing game


.code		; (insert executable instructions here)
main proc	

MOV edx,OFFSET teamName							;prints Team Name
CALL WriteString	
MOV edx, OFFSET promptPlayerName				;prompt user for a name
call WriteString





;Can't figure out how to store a string into a variable
MOV ecx, 30										;length of string
CALL ReadString
MOV playerName, TYPE edx
CALL crlf







programLoop:
	MOV edx,OFFSET menu							;prints menu
	CALL WriteString


	CALL ReadDec								;collects inputed choice
	MOV userChoice, al							;userChoice contains user's input

	MOV al, 1									;switch statement (MOVe into al to compare with userChoice)
	CMP al, userChoice					
	JE option1									;if user inputted 1, take them to option 1
	MOV al, 2
	CMP al, userChoice
	JE option2									;if user inputted 2, take them to option 2
	MOV al, 3
	CMP al, userChoice
	JE option3									;if user inputted 3, take them to option 3
	MOV al, 4
	CMP al, userChoice
	JE option4									;if user inputted 4, take them to option 4
	MOV al, 5							
	CMP al, userChoice
	JE exitOption								;if user inputted 5, take them to exitOption
	JMP option6									;if user inputted an invalid option

	option1:
		MOV edx,OFFSET availableBalance			;print sentence before balance
		CALL WriteString
		MOV ax, balance							;print balance
		CALL WriteDec						
		CALL crlf
		CALL crlf
		CALL crlf
		JMP ProgramLoop							;go back to menu
	option2:
		MOV edx,OFFSET promptBalance			;prints sentence asking to insert balance
		CALL WriteString	
		CALL ReadDec							;read console for balance to add
		MOV amount, ax
		ADD ax, balance
		CMP	ax, MAX_ALLOWED			     		;check to make sure inputted value is <= 20
		JBE	belowMax							;amount + balance <= 20

		MOV edx,OFFSET tooManyCredits			;amount + balance > 20
		CALL WriteString
		JMP option2

		belowMax:								;below max so set new balance
			MOV ax, balance
			ADD ax, amount
			MOV balance, ax
			CALL crlf
			JMP programLoop				
	option3:
	playAgain:
		MOV ax, balance							; need to make sure have enough money
		CMP eax, 0							
		JLE	noBalance							; if(eax <= 0) -> jump to noBalance
			DEC balance							; -$1 do play the game
			INC gamesPlayed						; +1 to number of times user has played the game
			MOV eax, 10							; to generate a random number
			CALL RandomRange					; generates random number in eax from 0-9
			INC eax								; so that its 1-10
			MOV randomInt, al					; randomInt stores the random number
			MOV edx, OFFSET promptIntInput		; prompt user for a random number 1-10
			CALL WriteString
			CALL ReadDec						; eax stores user input
			MOV userInt, al						; userInt stores eax(user input)
			CMP al, randomInt					; eax still contains user input
			JNE notEqual						; if(userInt != RandomInt) -> jump to notEqual

			MOV edx, OFFSET correctGuess		; else(userInt == RandomInt)
			CALL WriteString					; tell user they guessed correctly
			CALL crlf
			INC	balance							; +$2 for winning the game
			INC balance
			INC moneyWon						; +2 to amount of money user has made by playing game
			INC moneyWon
			INC correctGuesses					; +1 to correctGuess to store number of times user guess correct
			JMP promptPlay						; jump to promptPlay to prompt user whether they would like to play again or not.
			
			notEqual:
			MOV edx, OFFSET incorrectGuess		
			CALL WriteString					; tell user they guessed incorrectly
			MOV al, randomInt
			CALL WriteDec						; print correct number
			CALL crlf
			INC missedGuesses					; +1 to missedGuesses to store number of times user guess incorrect
			INC moneyLost						; -1 to amount of money user has made by playing game

		promptPlay:
			CALL crlf
			MOV edx, OFFSet promptPlayAgain		; ask user if they would like to play again
			CALL WriteString
			CALL ReadDec						; read user input
			CMP eax, 1
			JNE backToMenu						; if(eax != 1) -> go back to menu because don't want to play again
			JMP playAgain						; else(eax == 1) -> restart because user wants to play again.

		noBalance:	
			MOV edx, OFFSET notEnoughCredits	; print error message
			call WriteString
			CALL crlf
			CALL crlf

		backToMenu:
			JMP ProgramLoop						;go back to menu
	option4:
		CALL crlf
		MOV edx, OFFSET playerNameStr			; print player's Name
		CALL WriteString
		MOV edx, OFFSET playerName
		CALL WriteString
		CALL crlf
		MOV edx, OFFSET	availableCreditStr		; print available credit
		CALL WriteString
		MOV ax, balance
		CALL WriteDec
		CALL crlf
		MOV edx, OFFSET	gamesPlayedStr			; print games played
		CALL WriteString
		MOV ax, gamesPlayed
		CALL WriteDec
		CALL crlf
		MOV edx, OFFSET	correctGuessesStr		; print correct guesses
		CALL WriteString
		MOV ax, correctGuesses
		CALL WriteDec
		CALL crlf
		MOV edx, OFFSET	missedGuessesStr		; print missed guesses
		CALL WriteString
		MOV ax, missedGuesses
		CALL WriteDec
		CALL crlf
		MOV edx, OFFSET	moneyWonStr				; print money won
		CALL WriteString
		MOV ax, moneyWon
		CALL WriteDec
		CALL crlf
		MOV edx, OFFSET	moneyLostStr			; print money lost
		CALL WriteString
		MOV ax, moneyLost
		CALL WriteDec
		CALL crlf
		CALL WaitMsg							;waits for user to print enter before continuing
		JMP ProgramLoop
	option6:
		MOV edx,OFFSET invalidOption
		JMP programLoop

exitOption:
MOV edx,OFFSET goodbyeMsg					;exitting messages and program
CALL WriteString
CALL crlf

exit
main endp	; (insert ADDitional procedures here)



end main
FinalProjectTextCode.txt
9 KB