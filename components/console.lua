require("/debugMode")

function execute()
    love._openConsole()
    local arg = io.read()

    if arg == "debugButton = true" then
        setDebugMode("debugButton")
    elseif arg == "debugButton = false" then
        setDebugMode("none")
    elseif arg == "middelScreen = true" then
        setDebugMode("middelScreen")
    elseif arg == "middelScreen = false" then
        setDebugMode("none")
    elseif arg == "exit" then
        os.exit()
    end
end