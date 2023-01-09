require("/textureManager")
require("/components/buttonManager")

local probleme = {}
probleme.posX = 225
probleme.posY = 225
probleme.enoncer = "Donner la solution de l'équation 2x+2=0"
probleme.bouton = {}

proposition = {}
proposition[1] = "X = -1"
proposition[2] = "X = 0"
proposition[3] = "X = 4"

function laodExoMenu()
  for i = 1,3 do        --createButton(Name,id,posX,posY,texture,textureOver,scale)
    probleme.bouton[i] = createButton(proposition[i],id,posX,posY,texture,textureOver,scale)
  end
end

function updateExoMenu()
  
end

function drawExoMenu()
  --draw problématique
  love.graphics.draw()
end