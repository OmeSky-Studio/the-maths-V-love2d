local debug = false

function getDebugMode() -- RETOURNE LA VARIABLE DEBUG
    return debug
end

function setDebugMode(t) -- REDEFINI LA VARIABLE DEBUG
    debug = t
end

function drawDebugMode()
  if debug == true then
    love.graphics.setColor(255,0,0)
    love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2, love.graphics.getHeight())
    love.graphics.line(0, love.graphics.getHeight()/2, love.graphics.getWidth(),love.graphics.getHeight()/2)
    love.graphics.setColor(255,255,255)


    --MENU INFO
    local font = love.graphics.getFont()
    local sizeX = (love.graphics.getWidth()/4)
    local sizeY = love.graphics.getHeight()

    local posX = love.graphics.getWidth()-sizeX
    local posY = 0

    love.graphics.setColor(.2, .2, .2, .5)
    love.graphics.rectangle("fill", posX, posY, sizeX, sizeY)
    love.graphics.setColor(1, 1, 1, 1)

    --title
    love.graphics.print("DEBUG MODE", posX+(sizeX/2)-font:getWidth("DEBUG MODE")/2, 50)
    love.graphics.print("Mouse PosX | PosY",posX+(sizeX/2)-font:getWidth("Mouse PosX | PosY")/2,100)
    love.graphics.print(love.mouse.getX() .. " | " .. love.mouse.getY(), posX+(sizeX/2)-font:getWidth(love.mouse.getX() .. " | " .. love.mouse.getY())/2, 150)
    
  end
end