require("/textureManager")

lg = love.graphics


function drawTableu(valeurs)
  local font = love.graphics.getFont()
  local sizeX = 200
  local sizeY = 80
  local x = getMidelScreenWidth()
  local y = getMidelScreenHeight() - 80
  
  lg.draw(getTexture("tableau"), x- sizeX, y -sizeY)
  --DRAW VALEURS
    --valeur 1
    lg.setColor(1,1,0)
  lg.print(tostring(valeurs[1]), 
    (x - (sizeX/2)) - (font:getWidth(tostring(valeurs[1]))/2),
    (y - (sizeY/2)) - (font:getHeight(tostring(valeurs[1]))/2)
  )
    --valeur 2
  lg.print(tostring(valeurs[2]), 
    (x + (sizeX/2)) - (font:getWidth(tostring(valeurs[2]))/2),
    (y - (sizeY/2)) - (font:getHeight(tostring(valeurs[2]))/2)
  )
  
    --valeur 3
  lg.print(tostring(valeurs[3]), 
    (x - (sizeX/2)) - (font:getWidth(tostring(valeurs[3]))/2),
    (y + (sizeY/2)) - (font:getHeight(tostring(valeurs[3]))/2)-5
  )
  
    --valeur 3
  lg.print(tostring(valeurs[4]), 
    (x + (sizeX/2)) - (font:getWidth(tostring(valeurs[4]))/2),
    (y + (sizeY/2)) - (font:getHeight(tostring(valeurs[4]))/2) - 5
  )
  lg.setColor(1,1,1)

end