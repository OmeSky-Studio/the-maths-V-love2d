local debug = "none"

function getDebugMode()
    return debug
end

function setDebugMode(t)
    debug = t
end


function drawDebugMode()
  if debug == true then
    love.graphics.setColor(255,0,0)
    love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2, love.graphics.getHeight())
    love.graphics.line(0, love.graphics.getHeight()/2, love.graphics.getWidth(),love.graphics.getHeight()/2)
    love.graphics.setColor(255,255,255)
  end
end