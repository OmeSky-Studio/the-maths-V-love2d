
require("/menu/mainMenu")
require("/menu/classMenu")
require("/menu/niveauMenu")
require("/menu/optionMenu")
require("/menu/exoMenu")

require("gameMode")

local TimeSleep = 0.15



function loadGame()
    loadMainMenu()
    loadClassMenu()
    loadNiveauMenu()
    loadOptionMenu()
    loadExoMenu()
end

function upadteGame(dt)
    --print(getExoNumber())
    if getGameMode() == getAllGameMode().mainMenu then
        upadteMainMenu()
        love.timer.sleep(TimeSleep)
    elseif getGameMode() == getAllGameMode().classeMenu then
        updateClassMenu()
        love.timer.sleep(TimeSleep)
    elseif getGameMode() == getAllGameMode().optionMenu then
        updateOptionMenu()
        love.timer.sleep(TimeSleep)
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        if getExoNumber() == 0 then
            updateNiveauMenu()
            love.timer.sleep(TimeSleep)
        elseif getExoNumber() > 0 then
            updateExoMenu()
            love.timer.sleep(TimeSleep)
        end
    elseif getGameMode() == getAllGameMode().exitGame then
        os.exit()
    end
    --love.timer.sleep(TimeSleep)
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
