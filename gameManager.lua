
require("/menu/mainMenu")
require("/menu/classMenu")
require("/menu/niveauMenu")
require("/menu/optionMenu")
require("/menu/exoMenu")

require("gameMode")

local TimeSleep = 0.15

function loadGame()
    loadMainMenu() -- CHARGE LE MENU PRINCIPALE
    loadClassMenu() -- CHARGE LE MENU DES CLASSE
    loadNiveauMenu() -- CHARGE LE MENU DES NIVEAU
    loadOptionMenu() -- CHARGE LE MENU OPTION
    loadExoMenu() -- CHARGE LE MENU DES EXO
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

function upadteGame(dt)

    if getGameMode() == getAllGameMode().mainMenu then
        upadteMainMenu() -- UPDATE MENU PRINCIPALE
    elseif getGameMode() == getAllGameMode().classeMenu then
        updateClassMenu() -- UPDATE MENU  CLASSE
    elseif getGameMode() == getAllGameMode().optionMenu then
        updateOptionMenu() -- UPDATE MENU OPTION
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        if getExoNumber() == 0 then -- REGARDE SI LE NUMERO DE L'EXO ET EGUALE A 0
            updateNiveauMenu() -- UPDATE DU MENU NIVEAU
        elseif getExoNumber() > 0 then -- REGARDE SI LE NUMERO DE L'EXO ET SUPERIEUR A 0
            updateExoMenu() -- UPDATE DU MENU EXO
        end
    elseif getGameMode() == getAllGameMode().exitGame then
        os.exit() -- ON QUITTE LE JEU ET ON LE FERME
    end
    love.timer.sleep(TimeSleep)
end

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
    elseif getGameMode() == getAllGameMode().classe3eme or getGameMode() == getAllGameMode().classeCap or getGameMode() == getAllGameMode().classe2nd or getGameMode() == getAllGameMode().classe1er or getGameMode() == getAllGameMode().classeTerm then
        if getExoNumber() == 0 then
            drawNiveauMenu() -- AFFICHAGE DU MENU NIVEAU
        elseif getExoNumber() > 0 then
            drawExoMenu() -- AFFICHAGE DU MENU EXO
        end
    end
    --love.timer.sleep(TimeSleep/2)
end
