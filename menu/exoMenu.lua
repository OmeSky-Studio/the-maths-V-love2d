require("/textureManager")
require("/components/buttonManager")
require("/gameMode")

--VARIABLE DU BOUTON RETURN
local buttonReturn
local r1,r2,r3
local msg = "Problématique"
local reponseJuste = "R 1"
local selected = ""

function loadExoMenu()
  --button return menu
  local greenButton = getTexture("greenButton")
  local redButton = getTexture("redButton")
  buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
  r1 = createButton(
    "R 1",
    0,
    getMidelScreenWidth()-(greenButton:getWidth()/2*getScale())*3-25,
    getMidelScreenHeight(),
    greenButton,
    redButton,
    getScale
  )

  r2 = createButton(
    "R 2",
    0,
    getMidelScreenWidth()-greenButton:getWidth()/2*getScale(),
    getMidelScreenHeight(),
    greenButton,
    redButton,
    getScale
  )

  r3 = createButton(
    "R 3",
    0,
    getMidelScreenWidth()+(greenButton:getWidth()/2*getScale())+25,
    getMidelScreenHeight(),
    greenButton,
    redButton,
    getScale
  )
end

function updateExoMenu()
  --SI ON CLIQUE SUR LE BOUTON RETURN ON DEFINI LA VARIBLE EXO A 0
  if selected == "" then
    if getMouseEnterClick(r1) then
      selected = r1.name
      Updatereponse()
    elseif getMouseEnterClick(r2) then
      selected = r2.name
      Updatereponse()
    elseif getMouseEnterClick(r3) then
      selected = r3.name
      Updatereponse()
    end
  end

  if getMouseEnterClick(buttonReturn) == true then
    setExoNumber(0)       
  end
end



function drawExoMenu()
  --[[
      DRAW PROBLEME
  ]]
  font = love.graphics.getFont()  
  posX = getMidelScreenWidth() -getTexture("screen"):getWidth()/2
  posY = 100

  love.graphics.draw(getTexture("screen"), posX, posY,0,1,1)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print(msg, posX + font:getWidth(msg), posY + getTexture("screen"):getHeight()/2 - (font:getHeight(msg)/2))
  love.graphics.setColor(1, 1, 1, 1)

  if selected ~= "" then
    love.graphics.draw(
      getTexture("greyButton"), 
      getMidelScreenWidth()-getTexture("greyButton"):getWidth()/2*getScale(),
      getMidelScreenHeight()-getTexture("greyButton"):getHeight()/2*3,
      0,
      getScale(),getScale())
  end
  

  --DRAW BUTTON
  drawButton(r1)
  drawButton(r2)
  drawButton(r3)

  drawButton(buttonReturn)
end

function Updatereponse()
  if r1.name == reponseJuste then 
    r1.texture = r1.initTexture
    r2.texture = r2.textureOver
    r3.texture = r3.textureOver
  elseif r2.name == reponseJuste then
    r1.texture = r1.textureOver
    r2.texture = r2.initTexture
    r3.texture = r3.textureOver
  elseif r3.name == reponseJuste then
    r1.texture = r1.textureOver
    r2.texture = r2.textureOver
    r3.texture = r3.initTexture
  end
  
end