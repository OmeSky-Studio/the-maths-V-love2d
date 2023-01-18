
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

    loadGameMode() --CHAARGEMENT DES MODEs DE JEU
    initTexture() --CHARGEMENT DE TOUTE LES TEXTURES DU JEU
    loadGame()  --CHARGEMENT DU JEU
end

function love.update(dt)
    upadteGame(dt) -- UPDATE DU JEU
    --print(getGameMode())
end

function love.draw()
    --AFFICHE L'ARRIER PLAN PAR DEFAUT
    love.graphics.draw(
        getTexture("background"), -- TEXTURE DE L'ARRIER PLAN
        0, -- POSITION X
        0, -- POSITION Y
        0, -- ROTATION DE LIMAGE
        love.graphics:getWidth() / getTexture("background"):getWidth(), -- SCALE X
        love.graphics:getHeight() / getTexture("background"):getHeight() -- SCALE Y
    )

    drawGame() -- AFFICHER LE JEU
    drawDebugMode() -- AFFICHE OU NON LE DEBUG MODE
end


function love.keypressed(key)
    --GESTION DES TOUCHES DE DEBUG
    if key == "f3" then
        if getDebugMode() == true then
            setDebugMode(false)
        else
            setDebugMode(true)
        end
    end
    if key == "escape" then
        setGameMode(getAllGameMode().mainMenu)
    end
end