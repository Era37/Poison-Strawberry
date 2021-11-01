% Int Variables
var winID, instructions, font1, font2, backgroundID, colour1, endGamePhoto, backgroundImage, strawberryID, strawberryImage, raspberryID, raspberryImage, strawberriesTake, transFlagID, transFlagImage:int
var strawberriesLeft:int;
% String Variables
var name1, name2, viewInstructions, playAgain, winner:string
var phrase:string := "Enter the number of strawberries you would like to take (1 or 2) ";
% Boolean Variables
var restart:boolean

process DoMusic
    loop
        Music.PlayFile ("./Assets/aqua.mp3")
    end loop
end DoMusic
    
fork DoMusic

font2 := Font.New("dancing script:18:bold")
font1 := Font.New("dancing script:40:bold")
winID := Window.Open("position:top;center,graphics:780;514")
transFlagID := Pic.FileNew("./Assets/trans.jpg")
transFlagImage := Pic.Scale(transFlagID, 780, 514)
endGamePhoto := Pic.FileNew("./Assets/Le cat drawing.jpg")
endGamePhoto := Pic.Scale (endGamePhoto, 780, 514)
backgroundID := Pic.FileNew("./Assets/357e38f73b213135397b275e3c54a642.jpg")
backgroundImage := Pic.Scale (backgroundID, 780, 514)
strawberryID := Pic.FileNew("./Assets/strawberry.jpg")
strawberryImage := Pic.Scale(strawberryID, 60, 60)
raspberryID := Pic.FileNew("./Assets/raspberry.jpg")
raspberryImage := Pic.Scale(raspberryID, 60, 60)

loop
    cls
    Pic.Draw (backgroundImage, 0, 0, picCopy)
    Font.Draw("Poison", 360, 300, font1, white)
    Font.Draw("Stawberry", 330, 260, font1, white)
    Font.Draw("Would you like to view instructions? (Y or N)", 250, 200, font2, white)
    locate (22, 55)
    get viewInstructions
    if (Str.Lower(viewInstructions) = "y") then
        cls
        Pic.Draw (backgroundImage, 0, 0, picCopy)
        Font.Draw("Instructions", 330, 260, font1, white)
        Font.Draw("This is where the instructions will go", 250, 200, font2, white)
        delay (15000)
        exit
    elsif (Str.Lower(viewInstructions) = "n") then
        exit
    end if
end loop
include "Game.t"
