require("/textureManager")
require("/components/buttonManager")
require("/gameMode")

--VARIABLE DU BOUTON RETURN
local buttonReturn

function loadExoMenu()
  --button return menu
  buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end

function updateExoMenu()
  --SI ON CLIQUE SUR LE BOUTON RETURN ON DEFINI LA VARIBLE EXO A 0
  if getMouseEnterClick(buttonReturn) == true then
    setExoNumber(0)       
  end
end

function drawExoMenu()
  --[[
      DRAW PROBLEME
  ]]
  local font = love.graphics.getFont()
  local msg = "Donner la solution de l'équation x-3=10"
  local posX = getMidelScreenWidth() - (font:getWidth(msg)/2)
  local posY = 100

  love.graphics.setColor(128, 128, 128, 128)
  love.graphics.rectangle("fill", posX, posY, font:getWidth(msg), 100)
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.print(msg, posX, posY + (posY/2) - (font:getHeight()/2))
  love.graphics.setColor(255, 255, 255, 255)
  drawButton(buttonReturn)
end