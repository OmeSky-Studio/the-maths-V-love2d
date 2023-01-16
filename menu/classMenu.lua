
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")
require("/menu/niveauMenu")


local button3eme, buttonCAP, button2nd, button1er, buttonTerm,buttonReturn

--TEXTURE SCALE
local scale = 0.6
--VAR TEXTURE

local titre = love.graphics.newImage("res/textures/themaths.png") --IMG TITRE
--VAR MIDEL SCREEN
local midelScreenX = love.graphics.getWidth() / 2
local midelScreenY = love.graphics.getHeight() / 2


function loadClassMenu()
    local textureButton = getTexture("greenButton") --IMG BUTTON
    local textureButtonOver = getTexture("redButton") --IMG BUTTON OVER 
    --VAR MIDEL BUTTON
    local midelButtonX = textureButton:getWidth() / 2
    local midelButtonY = textureButton:getHeight() / 2

    local posX = midelScreenX - ((textureButton:getWidth()*scale +10)*2) - midelButtonX*scale
    print(posX)
    local posY = midelScreenY-midelButtonY*scale +120

    button3eme = createButton("3éme",0,posX,posY,textureButton,textureButtonOver,scale)

    posX = posX + textureButton:getWidth()*scale +10
    buttonCAP = createButton("CAP",0,posX,posY,textureButton,textureButtonOver,scale)

    posX = posX + textureButton:getWidth()*scale +10
    button2nd = createButton("2nd",0,posX,posY,textureButton,textureButtonOver,scale)
    
    posX = posX + textureButton:getWidth()*scale +10
    button1er = createButton("1er",0,posX,posY,textureButton,textureButtonOver,scale)
    
    posX = posX + textureButton:getWidth()*scale +10
    buttonTerm = createButton("Terminal",0,posX,posY,textureButton,textureButtonOver,scale)
    
    --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),scale)
end

function updateClassMenu()
    if getMouseEnterClick(button3eme) == true then
        setGameMode(getAllGameMode().classe3eme)        
    end
    if getMouseEnterClick(buttonCAP) == true then
        setGameMode(getAllGameMode().classeCap)        
    end
    if getMouseEnterClick(button2nd) == true then
        setGameMode(getAllGameMode().classe2nd)        
    end
    if getMouseEnterClick(button1er) == true then
        setGameMode(getAllGameMode().classe1er)        
    end
    if getMouseEnterClick(buttonTerm) == true then
        setGameMode(getAllGameMode().classeTerm)        
    end
    if getMouseEnterClick(buttonReturn) == true then
        setGameMode(getAllGameMode().mainMenu)
    end
end

function drawClassMenu()
    drawButton(button3eme)
    drawButton(buttonCAP)
    drawButton(button2nd)
    drawButton(button1er)
    drawButton(buttonTerm)
    drawButton(buttonReturn)
    love.graphics.draw(titre,love.graphics.getWidth()/2- titre:getWidth()/2, 100)
end