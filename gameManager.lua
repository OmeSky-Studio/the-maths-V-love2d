
require("/menu/mainMenu")
require("/menu/classMenu")
require("/menu/niveauMenu")
require("/menu/optionMenu")




require("gameMode")


function loadGame()
    loadMainMenu()
    loadClassMenu()
    loadNiveauMenu()
    loadOptionMenu()
end

function upadteGame()
    if getGameMode() == getAllGameMode().mainMenu then
        upadteMainMenu()
        love.timer.sleep(0.1)
    elseif getGameMode() == getAllGameMode().classeMenu then
        updateClassMenu()
        love.timer.sleep(0.1)
    elseif getGameMode() == getAllGameMode().optionMenu then
        updateOptionMenu()
        love.timer.sleep(0.1)
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        updateNiveauMenu()
        love.timer.sleep(0.1)
    elseif getGameMode() == getAllGameMode().exitGame then
        os.exit()
    end
end

function drawGame()
    if getGameMode() == getAllGameMode().mainMenu then
      drawMainMenu()
    elseif getGameMode() == getAllGameMode().classeMenu then
      drawClassMenu()
     elseif getGameMode() == getAllGameMode().optionMenu then
      drawOptionMenu()    
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
      drawNiveauMenu()
    end
    
end
