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
cls
lastInteration := 12
for i : 0 .. lastInteration
    if (i = lastInteration) then
	Pic.Draw (raspberryImage, (60*lastInteration), 300, picCopy)
    else
	Pic.Draw (strawberryImage, (60*i), 300, picCopy)
    end if
end for
