
require("/menu/mainMenu")
require("/menu/classMenu")
require("/menu/niveauMenu")
require("/menu/optionMenu")
require("/menu/exoMenu")

require("gameMode")

local TimeSleep = 0.1



function loadGame()
    loadMainMenu()
    loadClassMenu()
    loadNiveauMenu()
    loadOptionMenu()
    loadExoMenu()
end

function upadteGame()
    --print(getExoNumber())
    if getGameMode() == getAllGameMode().mainMenu then
        upadteMainMenu()
    elseif getGameMode() == getAllGameMode().classeMenu then
        updateClassMenu()
    elseif getGameMode() == getAllGameMode().optionMenu then
        updateOptionMenu()
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        if getExoNumber() == 0 then
            updateNiveauMenu()
        elseif getExoNumber() > 0 then
            updateExoMenu()
        end
    elseif getGameMode() == getAllGameMode().exitGame then
        os.exit()
    end
    love.timer.sleep(TimeSleep)
end

function drawGame()
    if getGameMode() == getAllGameMode().mainMenu then
      drawMainMenu()
    elseif getGameMode() == getAllGameMode().classeMenu then
      drawClassMenu()
     elseif getGameMode() == getAllGameMode().optionMenu then
      drawOptionMenu()    
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        if getExoNumber() == 0 then
            drawNiveauMenu()
        elseif getExoNumber() > 0 then
            drawExoMenu()
        end
    end
    --love.timer.sleep(TimeSleep/2)
end
