require("/textureManager")
require("/components/buttonManager")

local buttonReturn -- VARIABLE DU BOUTON RETURN

function loadOptionMenu()
  
   --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end

function updateOptionMenu()
  --SI LA SOURI CLICK SUR LE BOUTON ALOS ON PASSE LE MODE DE JEU EN "MENU PRINCIPALE"
  if getMouseEnterClick(buttonReturn) == true then
      setGameMode(getAllGameMode().mainMenu)
  end
end

function drawOptionMenu()
  
  --clavier
  --love.graphics.draw(love.graphics.newImage("res/textures/icons/num_pad.png"),(love.graphics.getWidth()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getWidth()/2),(love.graphics.getHeight()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getHeight()/2)+150)
  
  drawButton(buttonReturn) -- ON AFFICHE LE BOUTON RETURN
end