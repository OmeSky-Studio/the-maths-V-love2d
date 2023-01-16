require("/textureManager")
require("/debugMode")



function createButton(Name,id,posX,posY,texture,textureOver,scale)
    local b = {}
    b.name = Name
    b.id = id
    b.posX = posX
    b.posY = posY
    b.scale = scale
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
    local scale = button.scale
    local sizeX = button.sizeX
    local sizeY = button.sizeY
    local name = button.name

    love.graphics.draw(texture,posX,posY,0,scale,scale)

    local middelButtonX = posX + ((sizeX / 2) * scale)
    local middelButtonY = posY + ((sizeY / 2) * scale)

    local middelNameX = 48
    local middelNameY = 24
  

    love.graphics.print(name,middelButtonX - (font:getWidth(name)/2),middelButtonY - (font:getHeight(name)/2))

    if getDebugMode() == true then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", posX, posY, button.sizeX* scale, button.sizeY* scale)
        love.graphics.setColor(0, 0, 1, 1)
        love.graphics.line(posX+(sizeX*scale) / 2, posY, posX+(sizeX*scale) / 2,posY+sizeY*scale)
        love.graphics.line(posX,posY+(sizeY*scale) / 2, posX+sizeX*scale, posY+(sizeY*scale)/2)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

function getMouseEnter(button)
    
    local posX = button.posX
    local posY = button.posY
    local sizeX = button.sizeX
    local sizeY = button.sizeY
    local scale = button.scale

    if love.mouse.getX() > posX and love.mouse.getX() < posX + sizeX * scale and love.mouse.getY() > posY and love.mouse.getY() < posY + sizeY * scale then
        button.texture = button.textureOver
        return true
    else
        button.texture = button.initTexture
        return false
    end
end

function getMouseEnterClick(button)
    
    if getMouseEnter(button) and love.mouse.isDown(1) then
        return true
    end
    return false
end