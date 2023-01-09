local gameMode = "MainMenu"

local gameModes = {}

function loadGameMode()
    gameModes.mainMenu = "MainMenu" --Menu principale du jeu
    gameModes.optionMenu = "settingsMenu" --Menu paramétre du jeu
    gameModes.classeMenu = "classeMenu" --Menu pour sélectionner sont niveau de classe
    gameModes.exitGame = "leave" --Quitte le jeu
    
    --CLASSE MENU
    gameModes.classe3eme = "3emeMenu" --Menu Classe 3eme  
    gameModes.classeCap = "CapMenu" --Menu Classe 3eme  
    gameModes.classe2nd = "2ndMenu" --Menu Classe 3eme  
    gameModes.classe1er = "1erMenu" --Menu Classe 3eme  
    gameModes.classeTerm = "TermMenu" --Menu Classe 3eme  
end

function getAllGameMode()
    return gameModes
end

function getGameMode()
    return gameMode
end

function setGameMode(newGameMode)
    gameMode = newGameMode
end