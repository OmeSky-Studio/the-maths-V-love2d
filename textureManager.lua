textures = {}
local scale = 0.6
function initTexture()
    textures["background"] = love.graphics.newImage("/res/textures/background.PNG") --BACKGROUND IMAGE
    textures["greenButton"] = love.graphics.newImage("/res/textures/button/green_button.png") --green_button IMAGE
    textures["redButton"] = love.graphics.newImage("/res/textures/button/red_button.png") --red_button IMAGE
    textures["yellowButton"] = love.graphics.newImage("/res/textures/button/yellow_button.png") --yellow_button IMAGE
    textures["greyButton"] = love.graphics.newImage("/res/textures/button/grey_button.png") --grey_button IMAGE
    
    textures["greenButtonReturn"] = love.graphics.newImage("/res/textures/button/green_button_return.png") --green_button_return IMAGE
    textures["redButtonReturn"] = love.graphics.newImage("/res/textures/button/red_button_return.png") --red_button_return IMAGE
    
    textures["greenButtonSmall"] = love.graphics.newImage("/res/textures/button/green_button_small.png") --green_button_small IMAGE
    textures["redButtonSmall"] = love.graphics.newImage("/res/textures/button/red_button_small.png") --red_button_small IMAGE
    textures["yellowButtonSmall"] = love.graphics.newImage("/res/textures/button/yellow_button_small.png") --yellow_button_small IMAGE
    textures["greyButtonSmall"] = love.graphics.newImage("/res/textures/button/grey_button_small.png") --grey_button_small IMAGE

    
    --TITRE CLASSE MENU
    textures["titre3eme"] = love.graphics.newImage("/res/textures/titre/3eme.png")
    textures["titreCap"] = love.graphics.newImage("/res/textures/titre/cap.png")
    textures["titre2nd"] = love.graphics.newImage("/res/textures/titre/2nd.png")
    textures["titre1er"] = love.graphics.newImage("/res/textures/titre/1er.png")
    textures["titreTerm"] = love.graphics.newImage("/res/textures/titre/terminal.png")
end

-- RETOURNE LA TEXTURE SELECTIONER
function getTexture(texture)
    return textures[texture]
end

--RETOURNE LE MILIEU DE L'ECRAN EN LONGEUR
function getMidelScreenWidth()
    return love.graphics.getWidth()/2
end

--RETOURNE LE MILIEU DE L'ECRAN EN LARGEUR
function getMidelScreenHeight()
    return love.graphics.getHeight()/2
end

--RETOURNE LA VARIABLE SCALE
function getScale()
    return scale
end

--REDEFINI LA VARIABLE SCALE
function setScale(newScale)
    scale = newScale
end