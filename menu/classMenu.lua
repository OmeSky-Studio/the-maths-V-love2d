
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")
require("/menu/niveauMenu")

local button3eme, buttonCAP, button2nd, button1er, buttonTerm,buttonReturn

--VAR TEXTURE

local titre = love.graphics.newImage("res/textures/themaths.png") --IMG TITRE

function loadClassMenu()
    local textureButton = getTexture("greenButton") --IMG BUTTON
    local textureButtonOver = getTexture("redButton") --IMG BUTTON OVER 
    --VAR MIDEL BUTTON
    local midelButtonX = textureButton:getWidth() / 2
    local midelButtonY = textureButton:getHeight() / 2

    local posX = getMidelScreenWidth() - ((textureButton:getWidth()*getScale() +10)*2) - midelButtonX*getScale()
    print(posX)
    local posY = getMidelScreenHeight()-midelButtonY*getScale() +120

    button3eme = createButton("3éme",0,posX,posY,textureButton,textureButtonOver,getScale())

    posX = posX + textureButton:getWidth()*getScale() +10
    buttonCAP = createButton("CAP",0,posX,posY,textureButton,textureButtonOver,getScale())

    posX = posX + textureButton:getWidth()*getScale() +10
    button2nd = createButton("2nd",0,posX,posY,textureButton,textureButtonOver,getScale())
    
    posX = posX + textureButton:getWidth()*getScale() +10
    button1er = createButton("1er",0,posX,posY,textureButton,textureButtonOver,getScale())
    
    posX = posX + textureButton:getWidth()*getScale() +10
    buttonTerm = createButton("Terminal",0,posX,posY,textureButton,textureButtonOver,getScale())
    
    --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
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