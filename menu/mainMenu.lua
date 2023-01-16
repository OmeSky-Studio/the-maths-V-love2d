
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")
require("/menu/classMenu")


local buttonJouer, buttonSettings, buttonExit
local omskstud = love.graphics.newImage("res/textures/OméSky Studio.png")
local titre = love.graphics.newImage("res/textures/themaths.png")

function loadMainMenu()

    local midelScreenX = love.graphics.getWidth() / 2
    local midelScreenY = love.graphics.getHeight() / 2
    local scale = 0.6

    local green_Button = getTexture("greenButton")
    local red_Button = getTexture("redButton")
    
    buttonJouer = createButton("Jouer",0,midelScreenX - (green_Button:getWidth()/2)*scale,midelScreenY - (green_Button:getHeight()/2)*scale,green_Button,red_Button,scale)
    buttonSettings = createButton("Option",0,midelScreenX - (green_Button:getWidth()/2)*scale,midelScreenY - (green_Button:getHeight()/2)*scale + 100,green_Button,red_Button,scale)
    buttonExit = createButton("Quitter",0,midelScreenX - (green_Button:getWidth()/2)*scale,midelScreenY - (green_Button:getHeight()/2)*scale + 200,green_Button,red_Button,scale)

end

function upadteMainMenu()
    if getMouseEnterClick(buttonJouer) == true then
        setGameMode(getAllGameMode().classeMenu)        
    end
    if getMouseEnterClick(buttonSettings) == true then
        setGameMode(getAllGameMode().optionMenu)        
    end
    if getMouseEnterClick(buttonExit) == true then
        setGameMode(getAllGameMode().exitGame)        
    end
end

function drawMainMenu()
    drawButton(buttonJouer)
    drawButton(buttonSettings)
    drawButton(buttonExit)
    love.graphics.draw(titre,love.graphics.getWidth()/2- titre:getWidth()/2, 100)
    love.graphics.draw(omskstud,love.graphics.getWidth()- omskstud:getWidth(), love.graphics.getHeight()-omskstud:getHeight()-5)
end
