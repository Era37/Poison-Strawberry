% This function is called when the game is over and will ask the player if they wish to play again, it also contains an easter egg!
function gameOver (nme : string) : boolean
    loop
        if (Str.Lower(name1) = "jessica") or (Str.Lower(name2) = "jessica") then
            Pic.Draw (transFlagID, 0, 0, picCopy)
            colour1 := black
        else
            Pic.Draw (endGamePhoto, 0, 0, picCopy)
            colour1 := white
        end if
        winner := "Congratulations " + nme + " you won!"
        Font.Draw (winner, 310, 335, font2, white)
        Font.Draw ("Would you like to play again?",310,310,font2,colour1)
        locate (15, 53)
        get playAgain
        if (Str.Lower(playAgain) = "y") then
            exit
        else
            Window.Close (winID)
        end if
    end loop
    result true
end gameOver

% This procedure will draw berries, it draws the number of strawberries left and 1 raspberry
procedure drawBerries
    cls
    for i : 0 .. strawberriesLeft
        if (i = strawberriesLeft) then
            Pic.Draw (raspberryImage, (60*i), 450, picCopy)
        else
            Pic.Draw (strawberryImage, (60*i), 450, picCopy)
        end if
    end for
end drawBerries

% This loop is the main game loop which asks player names, defines number of strawberries and asks the players to take respective berry amounts
loop
    strawberriesLeft := 12
    cls
    Pic.Draw (backgroundImage, 0, 0, picCopy)
    Font.Draw ("Insert Player1's name", 340, 200, font2, white)
    locate (22, 55)
    get name1
    cls
    Pic.Draw (backgroundImage, 0, 0, picCopy)
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
