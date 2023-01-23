require("/textureManager")
require("/components/buttonManager")

local buttonReturn --VARIABLE DU BOUTON RETURN

function loadControlMenu()
  --CREATION DU BOUTON RETURN
  -- CREATEBUTTON(TITRE DU BOUTON, POSITION X, POSITION Y, TEXTURE PAR DEFAUT, TEXTURE QUAND LA SOURIS PASSE DESSUS, SCALE)
  buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end

function updateControlMenu()
  --REGADE SI ON CLIQUE SUR LE BOUTON RETURN SI OUI ON DEFINI LE GAMEMODE SUR "CLASSE MENU"
  if getMouseEnterClick(buttonReturn) == true then
    setGameMode(getAllGameMode().classeMenu)        
  end
end

function drawControlMenu()
  drawButton(buttonReturn) -- ON AFFICHE LE BOUTON RETURN
end