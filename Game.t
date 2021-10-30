function gameOver (nme : string) : boolean
    loop
	Pic.Draw (backgroundImage, 0, 0, picCopy)
	winner := "Congradulations " + nme + " you won!"
	Font.Draw (winner, 310, 335, font2, white)
	Font.Draw ("Would you like to play again?",310,310,font2,white)
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
    % This gives me pain to read
    loop
	loop
	    drawBerries
	    locate (5, 1)
	    put "Enter the number of strawberries you would like to take ", name1
	    get strawberriesTake
	    if (strawberriesTake = 1) or (strawberriesTake = 2 and strawberriesLeft > 1) then
		strawberriesLeft := strawberriesLeft - strawberriesTake
		exit
	    end if
	end loop
	if (strawberriesLeft = 0) then
	    restart := gameOver (name1)
	    if (restart = true) then
		exit
	    end if
	end if
	loop
	    drawBerries
	    locate (5, 1)
	    put "Enter the number of strawberries you would like to take ", name2
	    get strawberriesTake
	    if (strawberriesTake = 1) or (strawberriesTake = 2 and strawberriesLeft > 1) then
		strawberriesLeft := strawberriesLeft - strawberriesTake
		exit
	    end if
	end loop
	if (strawberriesLeft = 0) then
	    restart := gameOver (name2)
	    if (restart = true) then
		exit
	    end if
	end if
    end loop
end loop
	
	
	
