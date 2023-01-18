require("/textureManager")
require("/components/buttonManager")
require("/gameMode")

local niveau = {} --VARIABLE DES BOUTON NIVEAU
local buttonReturn --VARIABLE DU BOUTON RETURN

function loadNiveauMenu()
  --CHARGEMENT DES TEXTURE DES PETIT BOUTON VERT ET ROUGE
  local textureButton = getTexture("greenButtonSmall")
  local textureButtonOver = getTexture("redButtonSmall")

  --VARIABLE DU MILIEU DU BOUTON
  local midelButtonX = textureButton:getWidth() / 2
  local midelButtonY = textureButton:getHeight() / 2
  
  --POSITION INITIALE DU PREMIER BOUTON
  local posX = getMidelScreenWidth() - ((textureButton:getWidth()*getScale() +10)*5) + 5
  local posY = getMidelScreenHeight()-midelButtonY*getScale() - 50- midelButtonY
  
  --VARIABLE ID
  local id
  
  --[[
    BOUCLE FOR ID = 1 JUSQUA 40
      SI ID ET EGUALE A 11/21/31/41 ALORS
        ON REDEFINI LA POSITION X SUR LA POSITION INITIALE DU PREMIER BOUTON
        ON REDEFINI LA POSITION Y SUR LA POSITION Y + 25
      
      ON REDEFINI DANS LE TABLEAU "NIVEAU" A LA CASE "ID" UN NOUVEAU BOUTON 
      PUIS ON AJOUTE A LA POSITION X, LA POSITION X + LA TAILLE DES BOUTON * LE SCALE + 10
  ]]

  for id = 1,40 do
    if id == 11 or id == 21 or id == 31 or id == 41 then
      posX = getMidelScreenWidth() - ((textureButton:getWidth()*getScale() +10)*5) + 5

      posY = posY + midelButtonY +25
    end
    
    niveau[id] = createButton(id,0,posX,posY,textureButton,textureButtonOver,getScale())
    posX = posX + textureButton:getWidth()*getScale() +10
  end
  
   --CREATION DU BOUTON RETURN
   -- CREATEBUTTON(TITRE DU BOUTON, POSITION X, POSITION Y, TEXTURE PAR DEFAUT, TEXTURE QUAND LA SOURIS PASSE DESSUS, SCALE)
    buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
end


function updateNiveauMenu()
  
  --[[
    BOUCLE FOR ID = 1 JUSQU'AUX MAXIMUM DE CASE QU'IL Y A DANS LE TABLEAU "NIVEAU"
    ON REGARDE: SI LA SOURIS CLIQUE SUR L'UN DE CES BOUTON ALORS
      ON DEFINIE "EXONUMBER" AU NUMERO DU BOUTON ("id")
  ]]
    for id = 1,#niveau do
      if getMouseEnterClick(niveau[id]) == true then
          setExoNumber(id)
      end
    end
    --REGADE SI ON CLIQUE SUR LE BOUTON RETURN SI OUI ON DEFINI LE GAMEMODE SUR "CLASSE MENU"
  if getMouseEnterClick(buttonReturn) == true then
      setGameMode(getAllGameMode().classeMenu)        
  end
end

function drawNiveauMenu()
  --ON AFFICHE TOUT LES BOUTON DU TABLEAU "NIVEAU"
  for id = 1,#niveau do
    drawButton(niveau[id])
  end
  
  drawButton(buttonReturn) -- ON AFFICHE LE BOUTON RETURN
  drawTitre() -- ON AFFICHE LE TITRE SELON LA CLASSE SELECTIONNER 
end

function drawTitre()
  --AFFICHAGE DU TITRE SELON LA CLASSE CHOISI
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