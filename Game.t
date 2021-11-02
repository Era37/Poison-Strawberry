% This function is called when the game is over and will ask the player if they wish to play again, it also contains an easter egg!
function gameOver (nme : string) : boolean
    loop
        % Checks if the name is jessica, if so the background is a trans flag and text is black uwu
        if (Str.Lower(name1) = "jessica") or (Str.Lower(name2) = "jessica") then
            Pic.Draw (transFlagImage, 0, 0, picCopy)
            colour1 := black
        else
            % If the statment above is false it will make white text and draw the ordinary background
            Pic.Draw (endGamePhoto, 0, 0, picCopy)
            colour1 := white
        end if
        % Binds the congradulations message to a variable
        winner := "Congratulations " + nme + " you won!"
        % Draws out the congradulations message
        Font.Draw (winner, 290, 280, font2, colour1)
        % Asks the user if they wish to play again
        Font.Draw ("Would you like to play again?",270,250,font2,colour1)
        locate (18, 53)
        get playAgain
        % If they want to play again the function returns true and the loop repeats
        if (Str.Lower(playAgain) = "y") then
            exit
        else
            % If the answer is not yes the window is closed
            Window.Close (winID)
        end if
    end loop
    result true
end gameOver



% This procedure will draw berries, it draws the number of strawberries left and 1 raspberry
procedure drawBerries
    % Clears screens
    cls
    % Loops through the number of strawberries left
    for i : 0 .. strawberriesLeft
        % If it is the last strawberry it draws a raspberry
        if (i = strawberriesLeft) then
            Pic.Draw (raspberryImage, (60*i), 450, picCopy)
        % If the statement above is false it draws a strawberry
        else
            Pic.Draw (strawberryImage, (60*i), 450, picCopy)
        end if
    end for
end drawBerries

% This loop is the main game loop which asks player names, defines number of strawberries and asks the players to take respective berry amounts
loop
    % Sets the number of strawberries left to 12
    strawberriesLeft := 12
    % Clears the user's screen
    cls
    % Draws the respective background
    Pic.Draw (backgroundImage, 0, 0, picCopy)
    % Asks for player 1's name
    Font.Draw ("Insert Player1's name", 340, 200, font2, white)
    locate (22, 55)
    get name1
    % Clears the screen
    cls
    % Draws the background image
    Pic.Draw (backgroundImage, 0, 0, picCopy)
    % Ask player 2's name
    Font.Draw ("Insert Player2's name", 340, 200, font2, white)
    locate (22, 55)
    get name2
    % This nested loop helps with the alteration of turns
    loop
        % This loop draws the berries, asks the 1st players # of strawberries and removes it from the total amount
        loop
            drawBerries
            locate (5, 1)
            put phrase, name1
            get strawberriesTake
            if (strawberriesTake = 1) or (strawberriesTake = 2 and strawberriesLeft > 1) then
                % Subtracts strawberries from total berries left
                strawberriesLeft := strawberriesLeft - strawberriesTake
                exit
            end if
        end loop
        % This if statement checks if the strawberries left is equal to 0 and if so ends the game
        if (strawberriesLeft = 0) then
            restart := gameOver (name1)
            if (restart = true) then
                exit
            end if
        end if
        % This loop draws the berries, asks the 2nd players # of strawberries and removes it from the total amount
        loop
            drawBerries
            locate (5, 1)
            put phrase, name2
            get strawberriesTake
            if (strawberriesTake = 1) or (strawberriesTake = 2 and strawberriesLeft > 1) then
                % Subtracts strawberries from total berries left
                strawberriesLeft := strawberriesLeft - strawberriesTake
                exit
            end if
        end loop
        % This if statement checks if the strawberries left is equal to 0 and if so ends the game
        if (strawberriesLeft = 0) then
            restart := gameOver (name2)
            if (restart = true) then
                exit
            end if
        end if
    end loop
end loop
