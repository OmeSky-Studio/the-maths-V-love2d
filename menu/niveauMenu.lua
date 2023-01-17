
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")


local niveau = {}
local buttonReturn

function loadNiveauMenu()
  local textureButton = getTexture("greenButtonSmall")
  local textureButtonOver = getTexture("redButtonSmall")

  local midelButtonX = textureButton:getWidth() / 2
  local midelButtonY = textureButton:getHeight() / 2
  
  local posX = getMidelScreenWidth() - ((textureButton:getWidth()*getScale() +10)*5) + 5
  local posY = getMidelScreenHeight()-midelButtonY*getScale() - 50- midelButtonY
  
  local id
  
  for id = 1,40 do
    if id == 11 or id == 21 or id == 31 or id == 41 then
      posX = getMidelScreenWidth() - ((textureButton:getWidth()*getScale() +10)*5) + 5

      posY = posY + midelButtonY +25
    end
    
    niveau[id] = createButton(id,0,posX,posY,textureButton,textureButtonOver,getScale())
    posX = posX + textureButton:getWidth()*getScale() +10
  end
  
   --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end

function updateNiveauMenu()
    for id = 1,#niveau do
      if getMouseEnterClick(niveau[id]) == true then
          setExoNumber(id)
      end
    end
    
  if getMouseEnterClick(buttonReturn) == true then
      setGameMode(getAllGameMode().classeMenu)        
  end
end

function drawNiveauMenu()
  for id = 1,#niveau do
    drawButton(niveau[id])
  end
  drawButton(buttonReturn)
  love.timer.sleep(0.01)
  drawTitre()
end

function drawTitre()
  if getGameMode() == "3emeMenu" then
    love.graphics.draw(getTexture("titre3eme"),love.graphics.getWidth()/2-getTexture("titre3eme"):getWidth()/2,100)
  elseif getGameMode() == "CapMenu" then
    love.graphics.draw(getTexture("titreCap"),love.graphics.getWidth()/2-getTexture("titreCap"):getWidth()/2,100)

  elseif getGameMode() == "2ndMenu" then
    love.graphics.draw(getTexture("titre2nd"),love.graphics.getWidth()/2-getTexture("titreCap"):getWidth()/2,100)
  elseif getGameMode() == "1erMenu" then
    love.graphics.draw(getTexture("titre1er"),love.graphics.getWidth()/2-getTexture("titre1er"):getWidth()/2,100)
  elseif getGameMode() == "TermMenu" then
    love.graphics.draw(getTexture("titreTerm"),love.graphics.getWidth()/2-getTexture("titreTerm"):getWidth()/2,100)
  end
end