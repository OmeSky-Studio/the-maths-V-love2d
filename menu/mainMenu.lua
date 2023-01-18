
require("/textureManager")
require("/components/buttonManager")
require("/gameMode")
require("/menu/classMenu")

--VARIABLE DES BOUTON JOUER/SETTINGS/EXIT
local buttonJouer, buttonSettings, buttonExit
--VARIABLE DES TEXTURE TITRE ET OMSK STUDIO
local omskstud = love.graphics.newImage("res/textures/OméSky Studio.png")
local titre = love.graphics.newImage("res/textures/themaths.png")

function loadMainMenu()
    --VARIABLE DES TEXTURE DES BOUTON VERT ET ROUGE
    local green_Button = getTexture("greenButton")
    local red_Button = getTexture("redButton")
    
    --CREATION DES BOUTONS JOUER/SETTINGS/EXIT
    buttonJouer = createButton("Jouer",0,getMidelScreenWidth() - (green_Button:getWidth()/2)*getScale(),getMidelScreenHeight() - (green_Button:getHeight()/2)*getScale(),green_Button,red_Button,getScale())
    buttonSettings = createButton("Option",0,getMidelScreenWidth() - (green_Button:getWidth()/2)*getScale(),getMidelScreenHeight() - (green_Button:getHeight()/2)*getScale() + 100,green_Button,red_Button,getScale())
    buttonExit = createButton("Quitter",0,getMidelScreenWidth() - (green_Button:getWidth()/2)*getScale(),getMidelScreenHeight() - (green_Button:getHeight()/2)*getScale() + 200,green_Button,red_Button,getScale())

end

function upadteMainMenu()
    --[[
        ON REGARDE:
            SI ON CLIQUE SUR LE BOUTON JOUER ALORS
                ON DEFINI LE MODE DE JEU EN "CLASSEMENU"
            SINON SI ON CLIQUE SUR LE BOUTON OPTION ALORS
                ON DEFINI LE MODE DE JEU EN "OPTIONMENU"
            SIONO SI ON CLIQUE SUR LE BOUTON EXIT ALORS
                ON DEFINI LE MODE DE JEU EN "EXIT"
    ]]
    if getMouseEnterClick(buttonJouer) == true then
        setGameMode(getAllGameMode().classeMenu)        
    end
    if getMouseEnterClick(buttonSettings) == true then
        setGameMode(getAllGameMode().optionMenu)        
    end
    if getMouseEnterClick(buttonExit) == true then
        setGameMode(getAllGameMode().exitGame)        
    end
end

function drawMainMenu()
    drawButton(buttonJouer) -- ON AFFICHE LE BOUTON JOUER
    drawButton(buttonSettings) -- ON AFFICHE LE BOUTON OPTION
    drawButton(buttonExit) -- ON AFFICHE LE BOUTON EXIT
    love.graphics.draw(titre,love.graphics.getWidth()/2- titre:getWidth()/2, 100) -- ON AFFICHE LE TITRE
    --ON AFFICHE LE LOGO OMESKY STUDIO
    love.graphics.draw(omskstud,love.graphics.getWidth()- omskstud:getWidth(), love.graphics.getHeight()-omskstud:getHeight()-5)
end
