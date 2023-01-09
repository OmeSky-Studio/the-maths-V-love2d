
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")
require("/menu/niveauMenu")


local button3eme, buttonCAP, button2nd, button1er, buttonTerm,buttonReturn
local titre = love.graphics.newImage("res/textures/themaths.png")
function loadClassMenu()
    local midelScreenX = love.graphics.getWidth() / 2
    local midelScreenY = love.graphics.getHeight() / 2
    local scale = 0.6
    local textureButton = getTexture("greenButton")
    local textureButtonOver = getTexture("redButton")

    local midelButtonX = textureButton:getWidth() / 2
    local midelButtonY = textureButton:getHeight() / 2


    local posX = love.graphics.getWidth() / 4.1
    local posY = midelScreenY-midelButtonY*scale +120
    print(posX)
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
    if getMouseEnter(button3eme) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().classe3eme)        
        end
    end
    if getMouseEnter(buttonCAP) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().classeCap)        
        end
    end
    if getMouseEnter(button2nd) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().classe2nd)        
        end
    end
    if getMouseEnter(button1er) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().classe1er)        
        end
    end
    if getMouseEnter(buttonTerm) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().classeTerm)        
        end
    end
    if getMouseEnter(buttonReturn) == true then
      if love.mouse.isDown(1) then
        
            setGameMode(getAllGameMode().mainMenu)        
        end
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