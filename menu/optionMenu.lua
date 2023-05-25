require("/textureManager")
require("/components/buttonManager")

local buttonReturn,buttonControl

function loadOptionMenu()
  
    buttonControl = createButton("Controle",0,getMidelScreenWidth()-getTexture("greenButton"):getWidth()/2*getScale(),getMidelScreenHeight()-getTexture("yellowButton"):getHeight()/2*getScale(),getTexture("greenButton"),getTexture("redButton"),36)
  
   --button return menu
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),36)
end

function updateOptionMenu()
  --SI LA SOURI CLICK SUR LE BOUTON ALOS ON PASSE LE MODE DE JEU EN "CONTROL PRINCIPALE"
  if getMouseEnterClick(buttonControl) == true then
      setGameMode(getAllGameMode().controlMenu)
  end
  
  --SI LA SOURI CLICK SUR LE BOUTON ALOS ON PASSE LE MODE DE JEU EN "MENU PRINCIPALE"
  if getMouseEnterClick(buttonReturn) == true then
      setGameMode(getAllGameMode().mainMenu)
  end
end

function drawOptionMenu()
  
  --clavier
  --love.graphics.draw(love.graphics.newImage("res/textures/icons/num_pad.png"),(love.graphics.getWidth()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getWidth()/2),(love.graphics.getHeight()/2-love.graphics.newImage("res/textures/icons/num_pad.png"):getHeight()/2)+150)
  drawButton(buttonControl)
  drawButton(buttonReturn) -- ON AFFICHE LE BOUTON RETURN
end