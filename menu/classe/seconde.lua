--INIT VAR
require("/gameMode")
require("/textureManager")
require("/components/buttonManager")
require("/menu/exoMenu")
local font
local button_chapitre = {}
local buttonReturn 

function secondeLoad()
    font = love.graphics.getFont()
    createButtons()
end

function secondeUpdate()
    if getMouseEnterClick(buttonReturn) == true then
        setGameMode(getAllGameMode().classeMenu)      
    end
    
    for nb = 1, #button_chapitre do
      if getMouseEnterClick(button_chapitre[nb]) == true then
        chapitre = button_chapitre[nb].name
        setExoNumber(1)
        updateChapitre()
      end
    end
end

function secondeDraw()
    local nb = 0
    for nb = 1, #button_chapitre do
      drawButton(button_chapitre[nb])
    end
    drawButton(buttonReturn)
end

function createButtons()
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())

    local nb
    local posY = getMidelScreenHeight() - 50
    local posX = getMidelScreenWidth() - ((getTexture("yellowButton"):getWidth() +50)*4)/2 +50
    
    for nb = 1, #chapitres_seconde do
        if nb == 5 or nb == 9 then
            posX = getMidelScreenWidth() - ((getTexture("yellowButton"):getWidth() +50)*4)/2 +50
            posY = posY + 90               
        end
        print(nb .. " " ..posX.." "..posY)
        button_chapitre[nb] = createButton(chapitres_seconde[nb],0,posX,posY,getTexture("yellowButton"),getTexture("redButton"),22)
        posX = posX +getTexture("greenButton"):getWidth() + 50
        
    end
end