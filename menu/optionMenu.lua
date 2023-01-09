
require("/textureManager")
require("/components/buttonManager")

local buttonReturn
local scale = 0.6

function loadOptionMenu()
  
   --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),scale)
end

function updateOptionMenu()
  if getMouseEnter(buttonReturn) == true then
    if love.mouse.isDown(1) then
      setGameMode(getAllGameMode().mainMenu)        
    end
  end
end

function drawOptionMenu()
  
  --clavier
  love.graphics.draw(love.graphics.newImage("res/textures/icons/num_pad.png"),(love.graphics.getWidth()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getWidth()/2),(love.graphics.getHeight()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getHeight()/2)+150)
  
  drawButton(buttonReturn)
end