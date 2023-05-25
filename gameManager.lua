
require("/menu/mainMenu")
require("/menu/classMenu")
require("/menu/niveauMenu")
require("/menu/optionMenu")
require("/menu/exoMenu")
require("/menu/controlMenu")
require("/menu/classe/seconde")
require("/components/tableauManager")

require("gameMode")

local tab

function loadGame()
    loadMainMenu() -- CHARGE LE MENU PRINCIPALE
    loadClassMenu() -- CHARGE LE MENU DES CLASSE
    loadNiveauMenu() -- CHARGE LE MENU DES NIVEAU
    loadOptionMenu() -- CHARGE LE MENU OPTION
    loadExoMenu() -- CHARGE LE MENU DES EXO
    loadControlMenu()
    --CLASSE MENU
    secondeLoad()
end

--[[
    REGARDE: 
        SI LE MODE DE JEU ACTUEL ET EGUALE AU MAIN MENU ALORS
            ON UPDATE LE MENUPRINCIPALE
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU CLASSE ALORS
            ON UPDATE LE MENU CLASSE
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU OPTION ALORS
            ON UPDATE LE MENU OPTION
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU3EME/CAP/2ND/1ER/TERM ALORS
            SI LE NUMERO DE L'EXO ET EGUALE A 0 ALORS
                ON UPDATE LE MENU NIVEAU
            SINON SI IL ES SUPERIEUR A 0 ALORS
                ON UPDATE LE MENU EXO
        SINON SI LE MODE DE JEU ET EGUALE A EXIT ALORS
            ON FERME LE JEU
]]

function upadteGame()
    
    if getGameMode() == getAllGameMode().mainMenu then
        upadteMainMenu() -- UPDATE MENU PRINCIPALE
    elseif getGameMode() == getAllGameMode().classeMenu then
        updateClassMenu() -- UPDATE MENU  CLASSE
    elseif getGameMode() == getAllGameMode().optionMenu then
        updateOptionMenu() -- UPDATE MENU OPTION
    elseif getGameMode() == getAllGameMode().controlMenu then
        updateControlMenu() -- UPDATE MENU CONTROL
    elseif getGameMode() == getAllGameMode().classe2nd then
        updateSeconde()
    elseif getGameMode() == getAllGameMode().exitGame then
        os.exit() -- ON QUITTE LE JEU ET ON LE FERME
    end
end
--[[
    getGameMode() == getAllGameMode().classeCap 
    getGameMode() == getAllGameMode().classe2nd 
    getGameMode() == getAllGameMode().classe1er 
    getGameMode() == getAllGameMode().classeTerm
]]
--[[
    ON REGARDE: 
        SI LE MODE DE JEU ACTUEL ET EGUALE AU MAIN MENU ALORS
            ON AFFICHE LE MENUPRINCIPALE
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU CLASSE ALORS
            ON AFFICHE LE MENU CLASSE
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU OPTION ALORS
            ON AFFICHE LE MENU OPTION
        SINON SI LE MODE DE JEU ACTUEL ET EGUALE AU MENU3EME/CAP/2ND/1ER/TERM ALORS
            SI LE NUMERO DE L'EXO ET EGUALE A 0 ALORS
                ON AFFICHE LE MENU NIVEAU
            SINON SI IL ES SUPERIEUR A 0 ALORS
                ON AFFICHE LE MENU EXO
]]
function drawGame()
    if getGameMode() == getAllGameMode().mainMenu then
      drawMainMenu() -- AFFICHAGE DU MENU PRINCIPALE
    elseif getGameMode() == getAllGameMode().classeMenu then
      drawClassMenu() -- AFFICHAGE DU MENU DES CLASSE
    elseif getGameMode() == getAllGameMode().optionMenu then
      drawOptionMenu() -- AFFICHAGE DU MENU OPTION
    elseif getGameMode() == getAllGameMode().controlMenu then
      drawControlMenu() -- AFFICHAGE DU MENU CONTROL
    elseif getGameMode() == getAllGameMode().classe2nd then
      drawSeconde() 
    end
end

function updateSeconde()
  
  if chapitre == chapitres_seconde[1] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[2] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[3] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[4] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[5] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[6] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[7] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[8] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[9] then
    updateExoMenu()
  elseif chapitre == chapitres_seconde[10] then
    updateExoMenu()
  else
    secondeUpdate()
  end
end

function drawSeconde()

  if chapitre == chapitres_seconde[1] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[2] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[3] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[4] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[5] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[6] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[7] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[8] then
    drawExoMenu()
  elseif chapitre == chapitres_seconde[9] then
    drawExoMenu()
    elseif chapitre == chapitres_seconde[10] then
    drawExoMenu()
  else
    secondeDraw()
  end
end