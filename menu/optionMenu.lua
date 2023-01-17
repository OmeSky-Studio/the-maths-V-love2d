
require("/textureManager")
require("/components/buttonManager")

local buttonReturn

function loadOptionMenu()
  
   --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end

function updateOptionMenu()
  if getMouseEnterClick(buttonReturn) == true then
      setGameMode(getAllGameMode().mainMenu)
  end
end

function drawOptionMenu()
  
  --clavier
  --love.graphics.draw(love.graphics.newImage("res/textures/icons/num_pad.png"),(love.graphics.getWidth()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getWidth()/2),(love.graphics.getHeight()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getHeight()/2)+150)
  
  drawButton(buttonReturn)
end