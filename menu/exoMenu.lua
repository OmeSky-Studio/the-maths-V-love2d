require("/textureManager")
require("/components/buttonManager")
require("/components/tableauManager")
require("/gameMode")

--2nd
local proportionalite_pourcentage = require("/classe/2nd/proportionalite_pourcentage")
local statistiques_a_une_variable = require("/classe/2nd/statistiques_a_une_variable")
local calculs_statistiques = require("/classe/2nd/calculs_statistiques")
local frequence_dechantillons_probabilites = require("/classe/2nd/frequence_dechantillons_probabilites")
local resolution_dun_probleme_du_premier_degre = require("/classe/2nd/resolution_dun_probleme_du_premier_degre")
local notion_de_fonction = require("/classe/2nd/notion_de_fonction")
local fonction_affine = require("/classe/2nd/fonction_affine")
local fonctions_de_reference = require("/classe/2nd/fonctions_de_reference")
local geometrie_dans_le_triangle = require("/classe/2nd/geometrie_dans_le_triangle")
local aires_et_volumes = require("/classe/2nd/aires_et_volumes")



--VARIABLE DU BOUTON RETURN
local buttonReturn, _next
local r1,r2,r3
local msg = "Donner la solution de l'équation 2x+2=0"
local problematique,calcule
local reponseJuste = "-1"
local selected = ""
local isTableau = false
local tableau = {1,2,3,4}

local smile

local calculatrice = false

function loadExoMenu()
  
  --button return menu
  local greenButton = getTexture("yellowButton")
  local redButton = getTexture("redButton")
  buttonReturn = createButton("",0,25,25,getTexture("greenButtonReturn"),getTexture("redButtonReturn"),getScale())
    
  _next = createButton(
    "Suivant",
    0,
    getMidelScreenWidth()-(greenButton:getWidth()/2*getScale()),
    getMidelScreenHeight()+300,
    getTexture("greenButton"),
    getTexture("redButton"),
    36
  )
  
  r1 = createButton(
    "0",
    0,
    getMidelScreenWidth()-(greenButton:getWidth()/2*getScale())*3-25,
    getMidelScreenHeight()+100,
    greenButton,
    redButton,
    36
  )

  r2 = createButton(
    "4",
    0,
    getMidelScreenWidth()-greenButton:getWidth()/2*getScale(),
    getMidelScreenHeight()+100,
    greenButton,
    redButton,
    36
  )

  r3 = createButton(
    "-1",
    0,
    getMidelScreenWidth()+(greenButton:getWidth()/2*getScale())+25,
    getMidelScreenHeight()+100,
    greenButton,
    redButton,
    36
  )
  
  problematique = createButton(
    msg,
    0,
    getMidelScreenWidth()-(getTexture("screen"):getWidth()/2*getScale()),
    25,
    getTexture("screen"),
    getTexture("screen"),
    36
  )
  
  calcule = createButton(
    "0+0",
    0,
    getMidelScreenWidth()-(getTexture("screen"):getWidth()/2*getScale()),
    getMidelScreenHeight()-150,
    getTexture("screen"),
    getTexture("screen"),
    36
  )
  
  updateChapitre()
  
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
    selected = ""
    chapitre = ""   
    setExoNumber(0)
  end
  if getMouseEnterClick(_next) == true then
    selected = ""
    setExoNumber(getExoNumber()+1)  
    updateChapitre()
  end
end



function drawExoMenu()
  --[[
      DRAW PROBLEME
  ]]
  font = love.graphics.getFont()  
  posX = getMidelScreenWidth() - getTexture("screen"):getWidth()/2
  posY = 100
  
  --draw tableau
  
  if isTableau == true then
    drawTableu(tableau)
  else
    if calcule.name ~= "" then
      drawEnoncer(calcule)
    end
  end
  --DRAW BUTTON
  drawButton(r1)
  drawButton(r2)
  drawButton(r3)
  drawEnoncer(problematique)

  drawButton(buttonReturn)
  
  if selected ~= "" then
    drawButton(_next)
  end
  
  if calculatrice == true then
    love.graphics.draw(getTexture("calculatrice"),
    getMidelScreenWidth()+getMidelScreenWidth()/2,
    50,
    0,
    0.05,
    0.05
  )
  else
    love.graphics.draw(getTexture("nocalculatrice"),
      getMidelScreenWidth()+getMidelScreenWidth()/2,
      50,
      0,
      0.05,
      0.05
    )
  end
  
  if selected ~= "" then
    if selected == reponseJuste then
      love.graphics.draw(getTexture("good"),getMidelScreenWidth()/2-getTexture("good"):getWidth()/2,getMidelScreenHeight()/2-getTexture("good"):getHeight()/2,0,2,2)
    else
      love.graphics.draw(getTexture("bad"),getMidelScreenWidth()/2-getTexture("good"):getWidth()/2,getMidelScreenHeight()/2-getTexture("good"):getHeight()/2,0,2,2)
    end
  end
  
end

function Updatereponse()
  if reponseJuste == "|all|" then
    reponseJuste = selected
  end
  if r1.name == reponseJuste then
    if selected == r1.name then
        r1.texture = getTexture("greenButton")
        r2.texture = getTexture("greyButton")
        r3.texture = getTexture("greyButton")
        
    elseif selected == r2.name then
        r1.texture = getTexture("greenButton")
        r2.texture = r2.textureOver
        r3.texture = getTexture("greyButton")
    else
        r1.texture = getTexture("greenButton")
        r2.texture = getTexture("greyButton")
        r3.texture = r3.textureOver
    end
  elseif r2.name == reponseJuste then
    if selected == r1.name then
        r1.texture = r1.textureOver
        r2.texture = getTexture("greenButton")
        r3.texture = getTexture("greyButton")
    elseif selected == r2.name then
        r1.texture = getTexture("greyButton")
        r2.texture = getTexture("greenButton")
        r3.texture = getTexture("greyButton")
    else
        r1.texture = getTexture("greyButton")
        r2.texture = getTexture("greenButton")
        r3.texture = r3.textureOver
    end
  elseif r3.name == reponseJuste then
    if selected == r1.name then
        r1.texture = r1.textureOver
        r2.texture = getTexture("greyButton")
        r3.texture = getTexture("greenButton")
    elseif selected == r2.name then
        r1.texture = getTexture("greyButton")
        r2.texture = r2.textureOver
        r3.texture = getTexture("greenButton")
    else
        r1.texture = getTexture("greyButton")
        r2.texture = getTexture("greyButton")
        r3.texture = getTexture("greenButton")
    end
  end
end

--[[
function UpdateExo()
  if chapitre == "Proportionalité\r\n pourcentages" and getExoNumber() < #proportionalite_pourcentage + 1 then
  
    setText(problematique,proportionalite_pourcentage[getExoNumber()].enoncer)
    isTableau = proportionalite_pourcentage[getExoNumber()].isTableau
    reponseJuste = proportionalite_pourcentage[getExoNumber()].reponse
  
    setText(r1,proportionalite_pourcentage[getExoNumber()].proposition[1])
    setText(r2,proportionalite_pourcentage[getExoNumber()].proposition[2])
    setText(r3,proportionalite_pourcentage[getExoNumber()].proposition[3])
    
    calculatrice = proportionalite_pourcentage[getExoNumber()].calculatrice

  
    if isTableau == true then
      tableau[1] = proportionalite_pourcentage[getExoNumber()].tableau[1]
      tableau[2] = proportionalite_pourcentage[getExoNumber()].tableau[2]
      tableau[3] = proportionalite_pourcentage[getExoNumber()].tableau[3]    
      tableau[4] = proportionalite_pourcentage[getExoNumber()].tableau[4]
    else
      setText(calcule,proportionalite_pourcentage[getExoNumber()].calcule)
    end
    
  elseif chapitre == "Statistiques a \r\n une variables" and getExoNumber() < #statistiques_a_une_variable + 1 then
  
    setText(problematique,statistiques_a_une_variable[getExoNumber()].enoncer)
    isTableau = statistiques_a_une_variable[getExoNumber()].isTableau
    reponseJuste = statistiques_a_une_variable[getExoNumber()].reponse
  
    setText(r1,statistiques_a_une_variable[getExoNumber()].proposition[1])
    setText(r2,statistiques_a_une_variable[getExoNumber()].proposition[2])
    setText(r3,statistiques_a_une_variable[getExoNumber()].proposition[3])
  
    calculatrice = statistiques_a_une_variable[getExoNumber()].calculatrice
  
    if isTableau == true then
      tableau[1] = statistiques_a_une_variable[getExoNumber()].tableau[1]
      tableau[2] = statistiques_a_une_variable[getExoNumber()].tableau[2]
      tableau[3] = statistiques_a_une_variable[getExoNumber()].tableau[3]    
      tableau[4] = statistiques_a_une_variable[getExoNumber()].tableau[4]
    else
      setText(calcule,statistiques_a_une_variable[getExoNumber()].calcule)
    end
  elseif chapitre == "Calculs statiques" and getExoNumber() < #calculs_statistiques + 1 then
  
    setText(problematique,calculs_statistiques[getExoNumber()].enoncer)
    isTableau = calculs_statistiques[getExoNumber()].isTableau
    reponseJuste = calculs_statistiques[getExoNumber()].reponse
  
    setText(r1,calculs_statistiques[getExoNumber()].proposition[1])
    setText(r2,calculs_statistiques[getExoNumber()].proposition[2])
    setText(r3,calculs_statistiques[getExoNumber()].proposition[3])
    
    calculatrice = calculs_statistiques[getExoNumber()].calculatrice

    if isTableau == true then
      tableau[1] = calculs_statistiques[getExoNumber()].tableau[1]
      tableau[2] = calculs_statistiques[getExoNumber()].tableau[2]
      tableau[3] = calculs_statistiques[getExoNumber()].tableau[3]    
      tableau[4] = calculs_statistiques[getExoNumber()].tableau[4]
    else
      setText(calcule,calculs_statistiques[getExoNumber()].calcule)
    end
  elseif chapitre == "Fréquence\r\nd'échantillons\r\nProbabilités" and getExoNumber() < #frequence_dechantillons_probabilites + 1 then
  
    setText(problematique,frequence_dechantillons_probabilites[getExoNumber()].enoncer)
    isTableau = frequence_dechantillons_probabilites[getExoNumber()].isTableau
    reponseJuste = frequence_dechantillons_probabilites[getExoNumber()].reponse
  
    setText(r1,frequence_dechantillons_probabilites[getExoNumber()].proposition[1])
    setText(r2,frequence_dechantillons_probabilites[getExoNumber()].proposition[2])
    setText(r3,frequence_dechantillons_probabilites[getExoNumber()].proposition[3])
    
    calculatrice = frequence_dechantillons_probabilites[getExoNumber()].calculatrice

    if isTableau == true then
      tableau[1] = frequence_dechantillons_probabilites[getExoNumber()].tableau[1]
      tableau[2] = frequence_dechantillons_probabilites[getExoNumber()].tableau[2]
      tableau[3] = frequence_dechantillons_probabilites[getExoNumber()].tableau[3]    
      tableau[4] = frequence_dechantillons_probabilites[getExoNumber()].tableau[4]
    else
      setText(calcule,frequence_dechantillons_probabilites[getExoNumber()].calcule)
    end
  elseif chapitre == "Résolution d'un problème\r\n du 1er degré" and getExoNumber() < #resolution_dun_probleme_du_premier_degre + 1 then
  
    setText(problematique,resolution_dun_probleme_du_premier_degre[getExoNumber()].enoncer)
    isTableau = resolution_dun_probleme_du_premier_degre[getExoNumber()].isTableau
    reponseJuste = resolution_dun_probleme_du_premier_degre[getExoNumber()].reponse
  
    setText(r1,resolution_dun_probleme_du_premier_degre[getExoNumber()].proposition[1])
    setText(r2,resolution_dun_probleme_du_premier_degre[getExoNumber()].proposition[2])
    setText(r3,resolution_dun_probleme_du_premier_degre[getExoNumber()].proposition[3])
    
    calculatrice = resolution_dun_probleme_du_premier_degre[getExoNumber()].calculatrice

    if isTableau == true then
      tableau[1] = resolution_dun_probleme_du_premier_degre[getExoNumber()].tableau[1]
      tableau[2] = resolution_dun_probleme_du_premier_degre[getExoNumber()].tableau[2]
      tableau[3] = resolution_dun_probleme_du_premier_degre[getExoNumber()].tableau[3]    
      tableau[4] = resolution_dun_probleme_du_premier_degre[getExoNumber()].tableau[4]
    else
      setText(calcule,resolution_dun_probleme_du_premier_degre[getExoNumber()].calcule)
    end
  elseif chapitre == "Notion de fonction" and getExoNumber() < #notion_de_fonction + 1 then
  
    setText(problematique,notion_de_fonction[getExoNumber()].enoncer)
    isTableau = notion_de_fonction[getExoNumber()].isTableau
    reponseJuste = notion_de_fonction[getExoNumber()].reponse
  
    setText(r1,notion_de_fonction[getExoNumber()].proposition[1])
    setText(r2,notion_de_fonction[getExoNumber()].proposition[2])
    setText(r3,notion_de_fonction[getExoNumber()].proposition[3])
    
    calculatrice = notion_de_fonction[getExoNumber()].calculatrice

    if isTableau == true then
      tableau[1] = notion_de_fonction[getExoNumber()].tableau[1]
      tableau[2] = notion_de_fonction[getExoNumber()].tableau[2]
      tableau[3] = notion_de_fonction[getExoNumber()].tableau[3]    
      tableau[4] = notion_de_fonction[getExoNumber()].tableau[4]
    else
      setText(calcule,notion_de_fonction[getExoNumber()].calcule)
    end
  
end
]]


function updateChapitre()
  if chapitre == "Proportionalité\r\n pourcentages" and getExoNumber() < #proportionalite_pourcentage + 1 then
    updateExo(proportionalite_pourcentage)
    
  elseif chapitre == "Statistiques a \r\n une variables" and getExoNumber() < #statistiques_a_une_variable + 1 then
    updateExo(statistiques_a_une_variable)
    
  elseif chapitre == "Calculs statiques" and getExoNumber() < #calculs_statistiques + 1 then
    updateExo(calculs_statistiques)
    
  elseif chapitre == "Fréquence\r\nd'échantillons\r\nProbabilités" and getExoNumber() < #frequence_dechantillons_probabilites + 1 then
    updateExo(frequence_dechantillons_probabilites)
    
  elseif chapitre == "Résolution d'un problème\r\n du 1er degré" and getExoNumber() < #resolution_dun_probleme_du_premier_degre + 1 then
    updateExo(resolution_dun_probleme_du_premier_degre)
  
  elseif chapitre == "Notion de fonction" and getExoNumber() < #notion_de_fonction + 1 then
    updateExo(notion_de_fonction)
  
  elseif chapitre == "Fonction affine" and getExoNumber() < #fonction_affine + 1 then
    updateExo(fonction_affine)
    
  elseif chapitre == "Fonctions de\r\n référence" and getExoNumber() < #fonctions_de_reference + 1 then
    updateExo(fonctions_de_reference)
    
  elseif chapitre == "Géométrie dans \r\n le triangle"  and getExoNumber() < #geometrie_dans_le_triangle + 1 then
    updateExo(geometrie_dans_le_triangle)
    
  elseif chapitre == "Aires et volumes" and getExoNumber() < #aires_et_volumes + 1 then
    updateExo(aires_et_volumes)
  else
    selected = ""
    chapitre = ""   
    setExoNumber(0)
  end
end

function updateExo(chapitres)
  
  setText(problematique,chapitres[getExoNumber()].enoncer)
  isTableau = chapitres[getExoNumber()].isTableau
  reponseJuste = chapitres[getExoNumber()].reponse
  
  setText(r1,chapitres[getExoNumber()].proposition[1])
  setText(r2,chapitres[getExoNumber()].proposition[2])
  setText(r3,chapitres[getExoNumber()].proposition[3])
    
  calculatrice = chapitres[getExoNumber()].calculatrice

  if isTableau == true then
    tableau[1] = chapitres[getExoNumber()].tableau[1]
    tableau[2] = chapitres[getExoNumber()].tableau[2]
    tableau[3] = chapitres[getExoNumber()].tableau[3]    
    tableau[4] = chapitres[getExoNumber()].tableau[4]
  else
    setText(calcule,chapitres[getExoNumber()].calcule)
  end
end