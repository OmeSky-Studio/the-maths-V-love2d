local posX = 0
local posY = 0
local button = 0

function mouseSetPosX(x)
  posX = x
end

function mouseSetPosY(y)
  posY = y
end

function mouseSetButton(b)
  button = b
end

function mouseReset()
  posX = 0
  posY = 0
  button = 0
end

function mouseGetPosX()
  return posX
end

function mouseGetPosY()
  return posY
end

function mouseGetButton()
  return button
end

