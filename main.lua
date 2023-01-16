
--import script/lib
require("textureManager")
require("gameManager")
require("debugMode")
require("/components/console")
require("gameMode")

--SET TEXT FONT 
local font = love.graphics.newFont(32, "mono")
font:setFilter("nearest")
love.graphics.setFont(font)
--END SET TEXT FONT

function love.load()
  --nouvelle souris
  --local cursor = love.mouse.newCursor("res/textures/cursor.png",-0.5,-0.5)
  --love.mouse.setCursor(cursor)
  
    loadGameMode()
    initTexture()
    loadGame()
end

function love.update(dt)
    upadteGame()
    --print(getGameMode())
end

function love.draw()
    --INIT DEFAULT BACKGROUND
    scale1 = love.graphics:getWidth() / getTexture("background"):getWidth()
    scale2 = love.graphics:getHeight() / getTexture("background"):getHeight()
    love.graphics.draw(getTexture("background"),0,0,0,scale1, scale2)
    drawGame()

    drawDebugMode()
end


function love.keypressed(key)
    --print(key)
    if key == "f11" then
        setDebugMode(false)
    end
    if key == "f12" then
        setDebugMode(true)
    end
    if key == "escape" then
        setGameMode(getAllGameMode().mainMenu)
    end
end