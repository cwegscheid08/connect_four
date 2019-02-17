# CONNECT FOUR


## INITIAL THOUGHTS

For this project we are creating a connect four program, where you can choose to play a full game against either another human or a computer challenger. This will organized through these classes: Game, Board, Player, Computer, and Human.  Game will house the rules of the game and will be used to actually play the game.  Board will be a 7x6 grid and will hold the players pieces and will shift the player's guesses based on which cells are already filled.  Players will be a parent class for both Computer and Human and will house a parent method that will return an integer from 1-7, which will represent which column the player would like to drop their piece down.

This lesson is to focus on practicing writing test for code, using the Test Driven Developement as our guidelines.  This will help me to focus on what is being returned from each method, by taking the time before hand and figuring out what type of data and tools I will need to complete this program. Hopefully, I will gain a few skills that will help make my code more organized and easier to read. 


### GAME

House's the rules for the game, calls players to make moves, checks to see if either player has won. To win, either player must get at least four of their symbols in a row in either horizontal, veritcal, or diagonal positions.

Game will have to initialize with player_1 and player_2 as arguments. If player_2 is left nil, it will auto load with a computer player randomly generating guesses. 

### BOARD

Will be a 7x6 grid housing cells set equal to 'nil', will place players icons in correspoding cells based on their input


### COMPUTER

Returns a randomly generated guess

### HUMAN

Returns a user input guess


## TESTING

For testing I will be using RSpec, which has been being taught through previous lessons. Making sure to follow test driven developement protocal as closely as I can, I am going to write each of my tests before writing any of my classes or methods.  With this, I am really going to have to determine what data type I am going to need from each method, as well as which parameters I will have to run through them. Hopefully this will help to keep my work focused and precise.


## RUNNING APPLICATION

This application will have to be ran from the root file.  To set the game up, create a new Game class, which will initialize each of the other classes in the library, and to start playing, call the start method on your Game class. The Game class must be initialized with a player name as an argument, if you pass it two names you will have a game with two player mode started. If only one name is given to it, player_2 will be loaded with computer mechanics. If you start a new game with player_1 name as 'computer', both player_1 and player_2 will be loaded with computer mechanics, so you can start a game that plays itself.  