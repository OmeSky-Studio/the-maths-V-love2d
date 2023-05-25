--import script/lib
require("textureManager")
require("gameManager")
require("debugMode") 
require("gameMode")
require("/components/mouseManager")
require("/menu/exoMenu")

--SET TEXT FONT 
local font = love.graphics.newFont("res/font/ARIAL.TTF",36, "mono")
font:setFilter("nearest")
love.graphics.setDefaultFilter("nearest","nearest")
love.graphics.setFont(font)
local omskstud = love.graphics.newImage("res/textures/OméSky Studio.png")
--END SET TEXT FONT

function love.load()
  --nouvelle souris
  local cursor = love.mouse.newCursor("res/textures/cursor.png",-0.5,-0.5)
  love.mouse.setCursor(cursor)
    initDebug()
    loadGameMode() --CHAARGEMENT DES MODEs DE JEU
    initTexture() --CHARGEMENT DE TOUTE LES TEXTURES DU JEU 
    loadGame()  --CHARGEMENT DU JEU
end
 
function love.update(dt)
    if getMesureMode() == false then
        upadteGame(dt) -- UPDATE DU JEU
        --print(getGameMode())
    end
end

function love.mousepressed(x,y,button)
  mouseSetPosX(x)
  mouseSetPosY(y)
  mouseSetButton(button)
end

function love.mousereleased()
  mouseReset()
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
    love.graphics.draw(omskstud,love.graphics.getWidth()- omskstud:getWidth(), love.graphics.getHeight()-omskstud:getHeight()-5)
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
    if key == "f4" and getDebugMode() == true then
        if getMesureMode() == true then
            setMesureMode(false)
        else
            setMesureMode(true)
        end
    end
    if key == "f8" and getDebugMode() == true then
        setExoNumber(getExoNumber()+1)
        updateChapitre()
    end
    if key == "f7" and getDebugMode() == true then
        setExoNumber(getExoNumber()-1)
        updateChapitre()
    end
    if key == "f6" and getDebugMode() == true then
        if getCol() == true then
          setCol(false)
        else
          setCol(true)
        end
    end 
    if key == "f5" and getDebugMode() == true then
        if getDebugMenu() == true then
          setDebugMenu(false)
        else
          setDebugMenu(true)
        end
    end
    if key == "escape" then
        setGameMode(getAllGameMode().mainMenu)
        setExoNumber(0)
        chapitre = ""
    end
end