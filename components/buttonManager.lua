require("/textureManager")
require("/debugMode")
require("/components/mouseManager")
require("/components/mouseManager")

function createButton(Name,id,posX,posY,texture,textureOver)
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
    return b
end

function drawButton(button)
    
    local font = love.graphics.getFont()
    
    local posX = button.posX
    local posY = button.posY
    local texture = button.texture
    local sizeX = button.sizeX
    local sizeY = button.sizeY
    local name = button.name

    love.graphics.draw(texture,posX,posY,0,getScale(),getScale())

    local middelButtonX = posX + ((sizeX / 2) * getScale())
    local middelButtonY = posY + ((sizeY / 2) * getScale())

    local middelNameX = 48
    local middelNameY = 24
  

    love.graphics.print(name,middelButtonX - (font:getWidth(name)/2),middelButtonY - (font:getHeight(name)/2))

    if getDebugMode() == true then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", posX, posY, button.sizeX* getScale(), button.sizeY* getScale())
        love.graphics.setColor(0, 0, 1, 1)
        love.graphics.line(posX+(sizeX*getScale()) / 2, posY, posX+(sizeX*getScale()) / 2,posY+sizeY*getScale())
        love.graphics.line(posX,posY+(sizeY*getScale()) / 2, posX+sizeX*getScale(), posY+(sizeY*getScale())/2)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

function getMouseEnter(button)
    
    local posX = button.posX
    local posY = button.posY
    local sizeX = button.sizeX
    local sizeY = button.sizeY

    if love.mouse.getX() > posX and love.mouse.getX() < posX + sizeX * getScale() and love.mouse.getY() > posY and love.mouse.getY() < posY + sizeY * getScale() then
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