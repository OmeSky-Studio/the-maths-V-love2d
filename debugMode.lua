local debug = false

local regle = {}

local sizeX = (love.graphics.getWidth()/4)
local sizeY = love.graphics.getHeight()
local font 
local posX = love.graphics.getWidth()-sizeX
local posY = 0
local calculePosX = 0
  local calculePosY = 0

function initDebug()
  regle.posX = 0
  regle.posY = 0
  regle.newPosX = 0
  regle.newPosY = 0
  regle.isActive = false
  font = love.graphics.getFont()
end

function getDebugMode() -- RETOURNE LA VARIABLE DEBUG
    return debug
end

function setDebugMode(t) -- REDEFINI LA VARIABLE DEBUG
    debug = t
end

function getMesureMode() -- RETOURNE LA VARIABLE REGLE.ISACTIVE
  return regle.isActive
end

function setMesureMode(t) -- REDEFINI LA VARIABLE REGLE.ISACTIVE
  regle.isActive = t
end

function drawDebugMode()
  if debug == true then
    love.graphics.setColor(255,0,0)
    love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2, love.graphics.getHeight())
    love.graphics.line(0, love.graphics.getHeight()/2, love.graphics.getWidth(),love.graphics.getHeight()/2)
    love.graphics.setColor(255,255,255)

    printMenu(calculePosX,calculePosY)
    if regle.isActive == true then
      funRegle()
    end
  end
end

function funRegle()
  if love.mouse.isDown(1) then
    regle.posX = love.mouse.getX()
    regle.posY = love.mouse.getY()
  elseif love.mouse.isDown(2) then
    regle.newPosX = love.mouse.getX()
    regle.newPosY = love.mouse.getY()
  end

  if regle.newPosX > regle.posX then
    calculePosX = regle.newPosX - regle.posX
  else
    calculePosX = regle.posX - regle.newPosX
  end
  if regle.newPosY > regle.posX then
    calculePosY = regle.newPosY - regle.posY
  else
    calculePosY = regle.posY - regle.newPosY
  end
  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.line(regle.posX, regle.posY, regle.newPosX, regle.newPosY)
  love.graphics.setColor(1, 1, 1, 1)
  
  
end

function printMenu(calculePosX,calculePosY)
  --MENU INFO
  love.graphics.setColor(.2, .2, .2, .5)
  love.graphics.rectangle("fill", posX, posY, sizeX, sizeY)
  love.graphics.setColor(1, 1, 1, 1)

  printTextMenu("DEBUG MODE", 50)
  --Display
  printTextMenu("Display", 100)
  printTextMenu("Size: " ..love.graphics.getWidth().."x"..love.graphics.getHeight(),150)

  --MOUSE POS
  printTextMenu("Mouse PosX | PosY",200)
  printTextMenu(love.mouse.getX() .. " | " .. love.mouse.getY(),250)
  
  --MESURE
  printTextMenu("Mesure",300)
  printTextMenu(calculePosX .. " " ..calculePosY, 350)
end

function printTextMenu(text, posY)
  love.graphics.print(text,posX+(sizeX/2)-font:getWidth(text)/2,posY)
end