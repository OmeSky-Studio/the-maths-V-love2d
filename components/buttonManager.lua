require("/textureManager")
require("/debugMode")
require("/components/mouseManager")

local _font = "/res/font/ARIAL.TTF"

function createButton(Name,id,posX,posY,texture,textureOver,texteSize)
    local b = {}
    b.name = Name
    b.id = id
    b.posX = posX
    b.posY = posY
    b.sizeX = texture:getWidth()
    b.sizeY = texture:getHeight()
    b.texture = texture
    b.textureOver = textureOver
    b.initTexture = texture
    b.texteFond = texteSize
    return b
end

function drawButton(button)
    local font = love.graphics.newFont(_font,button.texteFond, "mono")
    love.graphics.setFont(font)
    love.graphics.draw(button.texture,button.posX,button.posY,0,getScale(),getScale())

    local middelButtonX = button.posX + ((button.sizeX / 2) * getScale())
    local middelButtonY = button.posY + ((button.sizeY / 2) * getScale())

    local middelNameX = 48
    local middelNameY = 24
  
  love.graphics.setColor(0,0,0)
  love.graphics.print(button.name,middelButtonX - (font:getWidth(button.name)/2),middelButtonY - (font:getHeight(button.name)/2) - get_number_ligne(button.name)*7)
  love.graphics.setColor(1,1,1)
    if getDebugMode() == true and getCol() == true then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", button.posX, button.posY, button.sizeX* getScale(), button.sizeY* getScale())
        love.graphics.setColor(0, 0, 1, 1)
        love.graphics.line(button.posX+(button.sizeX*getScale()) / 2, button.posY, button.posX+(button.sizeX*getScale()) / 2,button.posY+button.sizeY*getScale())
        love.graphics.line(button.posX,button.posY+(button.sizeY*getScale()) / 2, button.posX+button.sizeX*getScale(), button.posY+(button.sizeY*getScale())/2)
        love.graphics.setColor(1, 1, 1, 1)

    end
  font = love.graphics.newFont(_font,36, "mono")
  love.graphics.setFont(font)
end

function drawEnoncer(button)
  
    local font = love.graphics.newFont(_font,button.texteFond, "mono")
    love.graphics.setFont(font)
    love.graphics.draw(button.texture,button.posX,button.posY,0,getScale(),getScale())

    local middelButtonX = button.posX + ((button.sizeX / 2) * getScale())
    local middelButtonY = button.posY + ((button.sizeY / 2) * getScale())

    local middelNameX = 48
    local middelNameY = 24
  
  love.graphics.setColor(1,1,1)
  
    love.graphics.print(
      button.name,
      middelButtonX - (font:getWidth(button.name)/2),
      button.posY + (get_number_ligne(button.name)*1/3) + 10
    )
    
  love.graphics.setColor(1,1,1)
  
    if getDebugMode() == true and getCol() == true then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", button.posX, button.posY, button.sizeX* getScale(), button.sizeY* getScale())
        love.graphics.setColor(0, 0, 1, 1)
        love.graphics.line(button.posX+(button.sizeX*getScale()) / 2, button.posY, button.posX+(button.sizeX*getScale()) / 2,button.posY+button.sizeY*getScale())
        love.graphics.line(button.posX,button.posY+(button.sizeY*getScale()) / 2, button.posX+button.sizeX*getScale(), button.posY+(button.sizeY*getScale())/2)
        love.graphics.setColor(1, 1, 1, 1)
        
        print(button.name .. " texte size :" .. button.texteFond)
    end
  font = love.graphics.newFont(_font,36, "mono")
  love.graphics.setFont(font)
end

function setText(button,txt)
    button.name = txt
end

function getMouseEnter(button)

    if love.mouse.getX() > button.posX and love.mouse.getX() < button.posX + button.sizeX * getScale() and love.mouse.getY() > button.posY and love.mouse.getY() < button.posY + button.sizeY * getScale() then
        button.texture = button.textureOver
        return true
    else
        button.texture = button.initTexture
        return false
    end
end

function getMouseEnterClick(button)
    if getMouseEnter(button) and mouseGetButton() == 1 then
      mouseReset()
      return true
    else
    end
    return false
end

function get_number_ligne(str)
  local count = 1
  for _ in string.gmatch(str, "\n") do
    count = count + 1
  end
  return count
end