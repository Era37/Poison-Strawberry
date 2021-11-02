% Program name: Poison penny project - Poison Strawberry
% Programmer name: Osa and Avery
% Program language: Turing 4.1.1
% Date started: October 28, 2021
% Date last modified: November 2, 2021
% Date submitted: November 2, 2021

% Program description: This program will allow two players to play the poison penny/ strawberry game.
% it will start with a home screen, and offer instruction to the players. it will then ask for player 1 and player 2's name.
% next it will draw the strawberries on the screen and let the first player choose 1 or 2 strawberrys, then player 2.
% changing turn until one player is left with the raspberry and the game ends.

% Data Dictionary: 
% winID - This variable represents
% font1 - The variable that represents a title font
% font2 - A variable which represents a text font
% colour1 - The colour that the endgame text is; this is in order to prevent invisible text if the user activates the easter egg
% endGamePhoto - This is the photo shown at the end of the game
% backgroundImage - The image representing the background when entering user names and viewing instructions
% strawberryImage - The strawberry JPG for the game
% raspberryImage - The raspberry JPG for the game
% strawberriesTake - Represents the number of strawberries the user is taking
% transFlagImage - The easter egg image mmlol
% strawberriesLeft - The variable showing # of strawberries left
% name1 - Variable with the first player's name
% name2 - Variable with the second player's name
% viewInstructions - The variable representing whether or not they want to view instructions
% playAgain - Variable representing if they wish to play again
% winner - Variable representing who won
% phrase - The phrase asking the user to enter strawberry number; just to prevent repeating myself
% restart - The variable I bind the gameOver function to in order to view its returned value

% Int Variables
var winID, font1, font2, colour1, endGamePhoto, backgroundImage, strawberryImage, raspberryImage, strawberriesTake, transFlagImage:int
var strawberriesLeft:int;
% String Variables
var name1, name2, viewInstructions, playAgain, winner:string
var phrase:string := "Enter the number of strawberries you would like to take (1 or 2) ";
% Boolean Variables
var restart:boolean

% Playing the music
process DoMusic
    loop
        Music.PlayFile ("./Assets/aqua.mp3")
    end loop
end DoMusic
    
fork DoMusic

% Binding variables to respective values
font2 := Font.New("dancing script:18:bold")
font1 := Font.New("dancing script:40:bold")
winID := Window.Open("position:top;center,graphics:780;514")
transFlagImage := Pic.FileNew("./Assets/trans.jpg")
transFlagImage := Pic.Scale(transFlagImage, 780, 514)
endGamePhoto := Pic.FileNew("./Assets/Le cat drawing.jpg")
endGamePhoto := Pic.Scale (endGamePhoto, 780, 514)
backgroundImage := Pic.FileNew("./Assets/357e38f73b213135397b275e3c54a642.jpg")
backgroundImage := Pic.Scale (backgroundImage, 780, 514)
strawberryImage := Pic.FileNew("./Assets/strawberry.jpg")
strawberryImage := Pic.Scale(strawberryImage, 60, 60)
raspberryImage := Pic.FileNew("./Assets/raspberry.jpg")
raspberryImage := Pic.Scale(raspberryImage, 60, 60)

% Ask the user if they want instructions; if they do show them for 15 seconds otherwise start the game
loop
    cls
    Pic.Draw (backgroundImage, 0, 0, picCopy)
    Font.Draw("Poison", 360, 300, font1, white)
    Font.Draw("Stawberry", 330, 260, font1, white)
    Font.Draw("Would you like to view instructions? (Y or N)", 250, 200, font2, white)
    locate (22, 55)
    get viewInstructions
    if (Str.Lower(viewInstructions) = "y") then
        % Clears screen and draws text displaying instructions 
        cls
        Pic.Draw (backgroundImage, 0, 0, picCopy)
        Font.Draw("Instructions", 330, 260, font1, white)
        Font.Draw("Poison strawberry is a game played with two people.", 250, 200, font2, white)
        Font.Draw("Starting with 12 strawberries and a raspberry, each ", 250, 180, font2, white)
        Font.Draw("player takes either one or two strawberries. The ", 250, 160, font2, white)
        Font.Draw("player who ends up taking the last strawberry wins", 250, 140, font2, white)
        delay (15000)
        exit
    elsif (Str.Lower(viewInstructions) = "n") then
        exit
    end if
end loop
% Extends file to Game.t
include "Game.t"
