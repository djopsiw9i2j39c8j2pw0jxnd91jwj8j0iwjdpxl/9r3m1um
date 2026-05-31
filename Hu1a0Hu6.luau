Players = game:GetService("Players")
Workspace = game:GetService("Workspace")
ReplicatedStorage = game:GetService("ReplicatedStorage")
ServerStorage = game:GetService("ServerStorage")
RunService = game:GetService("RunService")
TweenService = game:GetService("TweenService")
TeleportService = game:GetService("TeleportService")
UserInputService = game:GetService("UserInputService")
VirtualUser = game:GetService("VirtualUser")
ContextActionService = game:GetService("ContextActionService")
GuiService = game:GetService("GuiService")
CoreGui = game:GetService("CoreGui")
HttpService = game:GetService("HttpService")
SoundService = game:GetService("SoundService")
Lighting = game:GetService("Lighting")
PhysicsService = game:GetService("PhysicsService")
PathfindingService = game:GetService("PathfindingService")
LocalizationService = game:GetService("LocalizationService")
Debris = game:GetService("Debris")

local killersFolder = Workspace:WaitForChild("Players"):WaitForChild("Killers")
local survivorsFolder = Workspace:WaitForChild("Players"):WaitForChild("Survivors")
local localPlayer = Players.LocalPlayer
local playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()

localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

if getgenv().loadalllanguage == nil then
    getgenv().loadalllanguage = true
end

systemLocale = LocalizationService.RobloxLocaleId:sub(1, 2)

langMapping = {
    ["en"] = "English",
    ["vi"] = "Vietnamese",
    ["zh"] = "Chinese (Simplified)",
    ["th"] = "Thai",
    ["tl"] = "Tagalog",
    ["id"] = "Indonesian",
    ["ja"] = "Japanese",
    ["ko"] = "korean",
    ["es"] = "Spanish",
    ["pt"] = "Portuguese",
    ["fr"] = "French",
    ["ru"] = "Russian",
}

DropdownLanguages = {
    "English", "Vietnamese", "Chinese (Simplified)", "Thai", "Tagalog", 
    "Indonesian", "Japanese", "Korean", "Spanish", "Portuguese", "French", "Russian"
}

targetLanguageCode = systemLocale or "en"
defaultLanguageName = langMapping[targetLanguageCode]

if not defaultLanguageName then
    defaultLanguageName = "Custom (" .. targetLanguageCode:upper() .. ")"
    langMapping[targetLanguageCode] = defaultLanguageName
    table.insert(DropdownLanguages, defaultLanguageName)
end

if getgenv().loadalllanguage == false then
    local filteredLangMapping = { ["en"] = "English" }
    local filteredDropdownLanguages = { "English" }
    
    if targetLanguageCode ~= "en" then
        local currentLangName = langMapping[targetLanguageCode]
        if currentLangName then
            filteredLangMapping[targetLanguageCode] = currentLangName
            table.insert(filteredDropdownLanguages, currentLangName)
        end
    end
    
    langMapping = filteredLangMapping
    DropdownLanguages = filteredDropdownLanguages
end

baseTranslations = {
    ["Forsaken"] = "Forsaken - By 72ms",
    ["About"] = "About",
    ["Features"] = "Features",
    ["Gameplay"] = "Gameplay",
    ["System"] = "System",
    ["Free"] = "Free",
    ["Information"] = "Information",
    ["Farm"] = "Farm",
    ["Survivors"] = "Survivors",
    ["Killers"] = "Killers",
    ["Name"] = "Name",
    ["Player"] = "Player",
    ["Visual"] = "Visual",
    ["Misc"] = "Misc",
    ["Settings"] = "Settings",
    ["Transparency"] = "Transparency",
    ["Transparency_disabled"] = "Transparency disabled",
    ["Transparency_enabled"] = "Transparency enabled",
    ["Theme_Changed"] = "Theme Changed",
    ["Switched_to_Dark"] = "Switched to Dark theme!",
    ["Switched_to_Light"] = "Switched to Light theme!",
    ["Switched_to_Gray"] = "Switched to Gray theme!",
    ["Switched_to_Blue"] = "Switched to Blue theme!",
    ["Switched_to_Green"] = "Switched to Green theme!",
    ["Switched_to_Purple"] = "Switched to Purple theme!",
    ["Welcome_Owner"] = "Welcome, owner!",
    ["Owner_In_Game"] = "An owner is in this game.",
    ["Language_Changed"] = "Language Changed",
    ["Language_Desc"] = "Select your preferred language",
    ["Language"] = "Language",
    ["Update_Info"] = "Update Information",
    ["Update_Info_Desc"] = "Used to update Discord information.",
    ["Update_Notify"] = "Updated!",
    ["Update_Notify_Content"] = "Statistics refreshed",
    ["Copy_Discord_Invite"] = "Copy Discord Invite",
    ["Copy_Discord_Invite_Desc"] = "Use this to copy the Discord group link.",
    ["Copy_Discord_Invite_Copied"] = "Copied!",
    ["Copy_Discord_Invite_Content"] = "Link copied to clipboard",
    ["Main_Owner"] = "Main Owner",
    ["Support_Owner"] = "Support Owner",
    ["Security_Owner"] = "Security Owner",
    ["Youtube_Desc"] = "Copy link youtube for subscribe!",
    ["Discord_Desc"] = "Join our discord for more scripts!",
    ["TikTok_Desc"] = "Copy the link to follow on TikTok!",
    ["Copy_Link"] = "Copy Link",
    ["Dev_Script"] = ">>          Dev Script          <<",
    ["My_Link"] = ">>          My Link          <<",
    ["Auto_Kill_The_Survivors"] = "Auto Kill The Survivors",
    ["Auto_Kill_The_Survivors_Desc"] = "Teleport behind nearest survivor continuously",
    ["Generator"] = "Generator",
    ["Auto_Farm_Generator"] = "Auto Farm Generator",
    ["Safe_Mode_Enable"] = "Safe Mode Enable",
    ["Safe_Mode_Enable_Desc"] = "It protects you from the killers near the generator.",
    ["Set_Safe_Range"] = "Set Safe Range",
    ["Set_Safe_Range_Desc"] = "Killer detection range",
    ["Auto_Farm_Generator_Desc"] = "Auto teleport to the generators to fix it.",
    ["Auto_Finish_Generator"] = "Auto Finish Generator",
    ["Auto_Finish_Generator_Desc"] = "Auto adjust the generator based on the speed entered in the input.",
    ["Generator_Delay"] = "Generator Delay",
    ["Generator_Delay_Desc"] = "Adjust the toggle delay each time you fix the generator.",
    ["Items_Settings"] = "Items Settings",
    ["Select_Item"] = "Select Item",
    ["Select_Item_Desc"] = "Choose the item you want to pick up.",
    ["Pick_Up_Selected_Item"] = "Pick Up Selected Item",
    ["Pick_Up_Selected_Item_Desc"] = "Get item you selected in the dropdown.",
    ["Pick_Up_Random_Item"] = "Pick Up Random Item",
    ["Pick_Up_Random_Item_Desc"] = "Pick up random items in the map.",
    ["Auto_PickUp_Selected_Item"] = "Auto PickUp Selected Item",
    ["Auto_PickUp_Selected_Item_Desc"] = "Auto pick up the selected item in the dropdown menu.",
    ["Auto_PickUp_Nearest_Item"] = "Auto PickUp Nearest Item",
    ["Auto_PickUp_Nearest_Item_Desc"] = "Auto picks up the nearest item around you.",
    ["Auto_Attack_Range"] = "Auto Attack Range",
    ["Auto_Attack_Range_Desc"] = "Distance check to survivors",
    ["Auto_Attack_Survivors"] = "Auto Attack Survivors",
    ["Auto_Attack_Survivors_Desc"] = "Auto click abilities when survivor nearby",
    ["Auto_Skill"] = "Auto Skill",
    ["Auto_Use_All_Skills"] = "Auto Use All Skills",
    ["Auto_Use_All_Skills_Desc"] = "Automatically use all skills when Auto Killers Farm is enabled",
    ["Auto_RagingPace"] = "Auto RagingPace",
    ["Auto_RagingPace_Desc"] = "Auto use skill RagingPace",
    ["Auto_PizzaDelivery"] = "Auto PizzaDelivery",
    ["Auto_PizzaDelivery_Desc"] = "Auto use skill PizzaDelivery",
    ["Auto_404Error"] = "Auto 404Error",
    ["Auto_404Error_Desc"] = "Auto use skill 404Error",
    ["Auto_UnstableEye"] = "Auto UnstableEye",
    ["Auto_UnstableEye_Desc"] = "Auto use skill UnstableEye",
    ["Auto_BloodHunt"] = "Auto BloodHunt",
    ["Auto_BloodHunt_Desc"] = "Auto use skill BloodHunt",
    ["Auto_Complete_Mini_Game"] = "Complete Mini Game",
    ["Auto_Complete_Mini_Game_Desc"] = "Auto complete the mini-game that appears on the screen.",
    ["MassInfection_Aimbot"] = "MassInfection Aimbot",
    ["Entanglement_Aimbot"] = "Entanglement Aimbot",
    ["Massinfection_Entanglement_Desc"] = "Automatically aimbot the nearest survivors.",
    ["Void_Rush_Controller"] = "Void Rush Controller",
    ["Void_Rush_Controller_Desc"] = "Move smoothly during skill.",
    ["Void_Rush_Aimbot"] = "Void Rush Aimbot",
    ["Void_Rush_Aimbot_Desc"] = "Auto target survivors during skill.",
    ["Void_Rush_Wall_Check"] = "Void Rush Wall Check",
    ["Void_Rush_Wall_Check_Desc"] = "Auto adjusts direction to avoid obstacles.",
    ["Walkspeed_Override_Controller"] = "Walkspeed Override Controller",
    ["Walkspeed_Override_Controller_Desc"] = "This helps you glide very smoothly every time you use a skill.",
    ["Walkspeed_Override_Aimbot"] = "Walkspeed Override Aimbot",
    ["Walkspeed_Override_Aimbot_Desc"] = "Automatically search for survivors near you and aimbot.",
    ["Radar_360_Wall_Check"] = "Radar 360° Wall Check",
    ["Radar_360_Wall_Check_Desc"] = "This helps you dodge walls to avoid crashing into them.",
    ["Custom_Name"] = "Custom Name",
    ["Custom_Name_Desc"] = "Enter the name you want to fake.",
    ["Fake_Name"] = "Fake Name",
    ["Fake_Name_Desc"] = "Enter the name you want to fake.",
    ["Anti_CC"] = "Anti-CC",
    ["Anti_Stun"] = "Anti-Stun",
    ["Anti_Stun_Desc"] = "Prevents you from being stunned.",
    ["Stamina"] = "Stamina",
    ["Full_Stamina"] = "Full Stamina",
    ["Full_Stamina_Desc"] = "Get full 100% stamina.",
    ["Infinite_Stamina"] = "Infinite Stamina",
    ["Infinite_Stamina_Desc"] = "Never run out of stamina.",
    ["Max_Stamina_Value"] = "Max Stamina Value",
    ["Max_Stamina_Value_Desc"] = "Enter custom stamina limit.",
    ["Apply_Max_Stamina"] = "Apply Max Stamina",
    ["Apply_Max_Stamina_Desc"] = "Enable custom stamina limit.",
    ["Regen_Value"] = "Regen Value",
    ["Regen_Value_Desc"] = "Enter regen speed.",
    ["Apply_Regen"] = "Apply Regen",
    ["Apply_Regen_Desc"] = "Enable custom regen.",
    ["Drain_Value"] = "Drain Value",
    ["Drain_Value_Desc"] = "Enter drain speed.",
    ["Apply_Drain"] = "Apply Drain",
    ["Apply_Drain_Desc"] = "Enable custom drain.",
    ["Game_Play"] = "Game Play",
    ["Remove_Effects"] = "Remove Effects",
    ["Remove_Effects_Desc"] = "Detele all bad effects for you.",
    ["Anti_Slow"] = "Anti-Slow",
    ["Anti_Slow_Desc"] = "No more slowing down when using items or skills.",
    ["Show_Chat"] = "Show Chat",
    ["Show_Chat_Desc"] = "Help show hidden chat windows.",
    ["Protect"] = "Protect",
    ["Anti_Screen_Recording"] = "Anti Screen Recording",
    ["Anti_Screen_Recording_Desc"] = "Protect yourself from being videotaped and abuse report screenshot.",
    ["Remove_Fake_Noli"] = "Remove Fake Noli",
    ["Remove_Fake_Noli_Desc"] = "Auto remove noli's hallucinations.",
    ["Anti_AFK_Roblox"] = "Anti-AFK [Roblox]",
    ["Anti_AFK_Roblox_Desc"] = "This helps you avoid getting kicked when you're AFK.",
    ["Camera"] = "Camera",
    ["Full_Bright"] = "Full Bright",
    ["Full_Bright_Desc"] = "Helps increase brightness around the map.",
    ["Remove_Fog"] = "Remove Fog",
    ["Remove_Fog_Desc"] = "Removing fog of war can help increase fps.",
    ["Infinite_Zoom"] = "Infinite Zoom",
    ["Infinite_Zoom_Desc"] = "It helps you zoom in infinitely.",
    ["Rejoin_Starting"] = "Rejoin Starting",
    ["Rejoin_Starting_Content1"] = "Started on the server with the lag fixed.",
    ["Rejoin_Settings"] = "Rejoin Settings",
    ["Rejoin_Settings_Content"] = "Reducing Lag on Servers...",
    ["Teleport_Error"] = "Teleport Error",
    ["Rejoin_To_Fix_Lag"] = "Rejoin To Fix Lag",
    ["Rejoin_To_Fix_Lag_Desc"] = "Press to activate the server lag reduction function.",
    ["Clone_ESP"] = "Clone ESP",
    ["Clone_ESP_Desc"] = "Show all valid models in the map.",
    ["Model_ESP"] = "Model ESP",
    ["Model_ESP_Desc"] = "Show all valid models in the map.",
    ["Survivors_ESP"] = "Survivors ESP",
    ["Survivors_ESP_Desc"] = "Show location and hp of all survivors.",
    ["Killers_ESP"] = "Killers ESP",
    ["Killers_ESP_Desc"] = "Show location and hp of all killers.",
    ["Generator_ESP"] = "Generator ESP",
    ["Generator_ESP_Desc"] = "Show unfinished generators on the map.",
    ["FakeGenerator_ESP"] = "Fake Generator ESP",
    ["FakeGenerator_ESP_Desc"] = "The current location of Noli's fake generator.",
    ["Items_ESP"] = "Items ESP",
    ["Items_ESP_Desc"] = "Display the location of the items in the map.",
    ["Dispenser_ESP"] = "Dispenser ESP",
    ["Dispenser_ESP_Desc"] = "Display the location of the healing dispenser.",
    ["Sentry_ESP"] = "Sentry ESP",
    ["Sentry_ESP_Desc"] = "Display the location of the Sentry launcher.",
    ["Tripwire_ESP"] = "Tripwire ESP",
    ["Tripwire_ESP_Desc"] = "Display the location of the Tripwire trap.",
    ["Subspace_ESP"] = "Subspace ESP",
    ["Subspace_ESP_Desc"] = "Display the location of the Subspace mine.",
    ["Digital_Trap_ESP"] = "Digital Trap ESP",
    ["Digital_Trap_ESP_Desc"] = "Shows the location where killers placed Digital Traps.",
        ["Config_Name"] = "Config Name",
    ["Config_Name_Desc"] = "Enter the name of the config you want.",
    ["Config_List"] = "Config List",
    ["Config_List_Desc"] = "Select your created config.",
    ["Make_Config"] = "Make Config",
    ["Make_Config_Desc"] = "Click to generate the configuration entered in the input.",
    ["Config"] = "Config",
    ["Config_Content"] = "Please enter config name",
    ["Config_Content1"] = "Config already exists",
    ["Config_Content2"] = "Config created success",
    ["Update_Config"] = "Update Config",
    ["Update_Config_Content"] = "Click to update the selected config.",
    ["Config_Content3"] = "No config selected",
    ["Config_Content4"] = "Config does not exist",
    ["Config_Content5"] = "Config has been updated.",
    ["Load_Config"] = "Load Config",
    ["Load_Config_Desc"] = "Click to load the selected config.",
    ["Config_Content6"] = "Please select a config first",
    ["Config_Content7"] = "Config does not exist",
    ["Config_Content8"] = "Config has finish loading.",
    ["Delete_Config"] = "Delete Config",
    ["Delete_Config_Desc"] = "Click to delete the selected config.",
    ["Config_Content9"] = "No config selected",
    ["Config_Content10"] = "Config already deleted",
    ["Config_Content11"] = "Config success deleted.",
    ["Auto_Load_Config"] = "Auto Load Config",
    ["Auto_Load_Config_Desc"] = "Auto sync first 3s then auto save every 1s",
    ["Auto_Load"] = "Auto Load",
    ["Config_Content12"] = "Please select a config first",
    ["Disabled"] = "Disabled",
    ["Config_Content13"] = "Switched to Auto Save Config",
}

finalTranslations = {}
for code, _ in pairs(langMapping) do
    finalTranslations[code] = {}
end

function getLangCodeFromName(name)
    for code, langName in pairs(langMapping) do
        if langName == name then return code end
    end
    return "en"
end

function translateText(text, targetLang)
    if targetLang == "en" then return text end
    local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=" .. targetLang .. "&dt=t&q=" .. HttpService:UrlEncode(text)
    local success, response = pcall(function() return game:HttpGet(url) end)
    if success and response then
        local decoded = HttpService:JSONDecode(response)
        if decoded and decoded[1] and decoded[1][1] and decoded[1][1][1] then
            return decoded[1][1][1]
        end
    end
    return text
end

function loadCachedLanguages(fileName)
    if isfile and isfile(fileName) then
        local success, content = pcall(readfile, fileName)
        if success then 
            local decoded = HttpService:JSONDecode(content)
            if decoded then return decoded end
        end
    end
    return {}
end

function saveCachedLanguages(fileName, data)
    if writefile then 
        pcall(writefile, fileName, HttpService:JSONEncode(data)) 
    end
end

function createAmbientParticle(MainFrame)
    if not MainFrame or not MainFrame.Parent then return end
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    particle.Position = UDim2.new(math.random(), 0, 1, 0)
    particle.BackgroundColor3 = Color3.fromRGB(0, 229, 255) 
    particle.BackgroundTransparency = 0.6
    particle.BorderSizePixel = 0
    particle.ZIndex = 2
    particle.Parent = MainFrame
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    local floatTween = TweenService:Create(particle, TweenInfo.new(math.random(3, 5), Enum.EasingStyle.Linear), {
        Position = UDim2.new(particle.Position.X.Scale, 0, -0.2, 0),
        BackgroundTransparency = 1
    })
    floatTween:Play()
    floatTween.Completed:Connect(function() particle:Destroy() end)
end

function RunParticleAnimationLoop(MainFrame)
    while MainFrame and MainFrame.Parent do
        createAmbientParticle(MainFrame)
        task.wait(math.random(30, 60) / 100)
    end
end

function updateProgress(StatusLabel, BarFill, percent, text)
    if not StatusLabel or not BarFill then return end
    StatusLabel.Text = string.upper(text) .. " [" .. tostring(percent) .. "%]"
    TweenService:Create(BarFill, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.fromScale(percent / 100, 1)
    }):Play()
end

function fadeOutLoader(LoaderScreen, OuterBorder, MainFrame, InnerStroke, BlurEffect)
    local fadeTime = 0.5
    local tweenInfo = TweenInfo.new(fadeTime, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local fadeTweenInfo = TweenInfo.new(fadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(OuterBorder, tweenInfo, {Size = UDim2.fromOffset(1, 1), BackgroundTransparency = 1}):Play()
    TweenService:Create(MainFrame, fadeTweenInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(InnerStroke, fadeTweenInfo, {Transparency = 1}):Play()
    TweenService:Create(BlurEffect, fadeTweenInfo, {Size = 0}):Play()
    
    for _, child in ipairs(MainFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            TweenService:Create(child, fadeTweenInfo, {TextTransparency = 1}):Play()
        elseif child:IsA("Frame") then
            TweenService:Create(child, fadeTweenInfo, {BackgroundTransparency = 1}):Play()
            for _, subChild in ipairs(child:GetChildren()) do
                if subChild:IsA("Frame") then
                    TweenService:Create(subChild, fadeTweenInfo, {BackgroundTransparency = 1}):Play()
                end
            end
        end
    end
    task.wait(fadeTime)
    if LoaderScreen then LoaderScreen:Destroy() end
    if BlurEffect then BlurEffect:Destroy() end
end

function BuildLoaderUI()
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("HuTaoHub_Loader") then 
        playerGui["HuTaoHub_Loader"]:Destroy() 
    end

    local LoaderScreen = Instance.new("ScreenGui")
    LoaderScreen.Name = "HuTaoHub_Loader"
    LoaderScreen.ResetOnSpawn = false
    LoaderScreen.Parent = playerGui

    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 0
    BlurEffect.Parent = Lighting
    TweenService:Create(BlurEffect, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 16}):Play()

    local OuterBorder = Instance.new("Frame")
    OuterBorder.Size = UDim2.fromOffset(1, 1)
    OuterBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
    OuterBorder.AnchorPoint = Vector2.new(0.5, 0.5)
    OuterBorder.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    OuterBorder.BorderSizePixel = 0
    OuterBorder.Parent = LoaderScreen

    local OuterCorner = Instance.new("UICorner")
    OuterCorner.CornerRadius = UDim.new(0, 10)
    OuterCorner.Parent = OuterBorder

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(1, -6, 1, -6)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = OuterBorder

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = MainFrame

    local InnerStroke = Instance.new("UIStroke")
    InnerStroke.Thickness = 1
    InnerStroke.Color = Color3.fromRGB(30, 30, 35)
    InnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    InnerStroke.Parent = MainFrame

    TweenService:Create(OuterBorder, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.fromOffset(346, 146) 
    }):Play()

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 35)
    TitleLabel.Position = UDim2.new(0, 0, 0, 20)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "HUTAO HUB"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.TextSize = 18
    TitleLabel.ZIndex = 3
    TitleLabel.Parent = MainFrame

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, -50, 0, 20)
    StatusLabel.Position = UDim2.new(0, 25, 0, 55)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "INITIALIZING CORE..."
    StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 145)
    StatusLabel.Font = Enum.Font.Code
    StatusLabel.TextSize = 11
    StatusLabel.TextTruncate = Enum.TextTruncate.AtEnd
    StatusLabel.ZIndex = 3
    StatusLabel.Parent = MainFrame

    local BarBg = Instance.new("Frame")
    BarBg.Size = UDim2.new(1, -50, 0, 4)
    BarBg.Position = UDim2.new(0, 25, 0, 90)
    BarBg.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    BarBg.BorderSizePixel = 0
    BarBg.ZIndex = 3
    BarBg.Parent = MainFrame

    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.fromScale(0, 1)
    BarFill.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    BarFill.BorderSizePixel = 0
    BarFill.ZIndex = 4
    BarFill.Parent = BarBg

    local UICorner1 = Instance.new("UICorner")
    UICorner1.CornerRadius = UDim.new(1, 0)
    UICorner1.Parent = BarBg
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(1, 0)
    UICorner2.Parent = BarFill

    return LoaderScreen, OuterBorder, MainFrame, InnerStroke, BlurEffect, StatusLabel, BarFill
end

function RunTranslationProcess(StatusLabel, BarFill)
    local fileName = "HutaoHub_Data_Files.json"
    local cache = loadCachedLanguages(fileName)
    local baseKeys = {}
    
    for k in pairs(baseTranslations) do 
        table.insert(baseKeys, k) 
    end
    
    local totalWords = #baseKeys
    local totalLanguages = 0
    for _ in pairs(langMapping) do 
        totalLanguages = totalLanguages + 1 
    end

    updateProgress(StatusLabel, BarFill, 0, "STARTING ENGINE...")
    task.wait(0.5)

    local currentLangIdx = 0

    for targetLangCode, langDisplayName in pairs(langMapping) do
        currentLangIdx = currentLangIdx + 1
        if not cache[targetLangCode] then cache[targetLangCode] = {} end
        
        local processedWords = 0
        local isModified = false
        
        for _, key in ipairs(baseKeys) do
            processedWords = processedWords + 1
            local percentPerWord = math.floor((processedWords / totalWords) * 100)
            
            updateProgress(StatusLabel, BarFill, percentPerWord, "LOADING: " .. langDisplayName .. " (" .. currentLangIdx .. "/" .. totalLanguages .. ")")
            
            if not cache[targetLangCode][key] then
                if targetLangCode == "en" then
                    cache[targetLangCode][key] = baseTranslations[key]
                else
                    cache[targetLangCode][key] = translateText(baseTranslations[key], targetLangCode)
                end
                isModified = true
                task.wait(0.02)
            end
            
            finalTranslations[targetLangCode][key] = cache[targetLangCode][key]
        end
        
        if isModified then
            saveCachedLanguages(fileName, cache)
        end
    end

    updateProgress(StatusLabel, BarFill, 100, "READY TO EXECUTE")
    task.wait(0.4)
end

function StartLoaderLifecycle()
    local LoaderScreen, OuterBorder, MainFrame, InnerStroke, BlurEffect, StatusLabel, BarFill = BuildLoaderUI()

    task.spawn(RunParticleAnimationLoop, MainFrame)
    RunTranslationProcess(StatusLabel, BarFill)

    fadeOutLoader(LoaderScreen, OuterBorder, MainFrame, InnerStroke, BlurEffect)
end

StartLoaderLifecycle()

function InitializeWindUI()
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    
    WindUI:Localization({
        Enabled = true,
        Prefix = "hutaohub:",
        DefaultLanguage = targetLanguageCode,
        Translations = finalTranslations
    })

    local themes_config = {
        Dark = {Accent = "#18181b", Dialog = "#18181b", Outline = "#FFFFFF", Text = "#FFFFFF", Placeholder = "#999999", Background = "#0e0e10", Button = "#52525b", Icon = "#a1a1aa"},
        Light = {Accent = "#f4f4f5", Dialog = "#f4f4f5", Outline = "#000000", Text = "#000000", Placeholder = "#666666", Background = "#ffffff", Button = "#e4e4e7", Icon = "#52525b"},
        Gray = {Accent = "#374151", Dialog = "#374151", Outline = "#d1d5db", Text = "#f9fafb", Placeholder = "#9ca3af", Background = "#1f2937", Button = "#4b5563", Icon = "#d1d5db"},
        Blue = {Accent = "#1e40af", Dialog = "#1e3a8a", Outline = "#93c5fd", Text = "#f0f9ff", Placeholder = "#60a5fa", Background = "#1e293b", Button = "#3b82f6", Icon = "#93c5fd"},
        Green = {Accent = "#059669", Dialog = "#047857", Outline = "#6ee7b7", Text = "#ecfdf5", Placeholder = "#34d399", Background = "#064e3b", Button = "#10b981", Icon = "#6ee7b7"},
        Purple = {Accent = "#7c3aed", Dialog = "#6d28d9", Outline = "#c4b5fd", Text = "#faf5ff", Placeholder = "#a78bfa", Background = "#581c87", Button = "#8b5cf6", Icon = "#c4b5fd"}
    }

    for name, cfg in pairs(themes_config) do
        WindUI:AddTheme({
            Name = name, Accent = cfg.Accent, Dialog = cfg.Dialog, Outline = cfg.Outline, 
            Text = cfg.Text, Placeholder = cfg.Placeholder, Background = cfg.Background, 
            Button = cfg.Button, Icon = cfg.Icon
        })
    end

    WindUI:SetNotificationLower(true)

    local themes = {"Dark", "Light", "Gray", "Blue", "Green", "Purple"}
    local currentThemeIndex = 4

    if getgenv().TransparencyEnabled == nil then
        getgenv().TransparencyEnabled = true
    end

    local Window = WindUI:CreateWindow({
        Title = "Hutao Hub",
        Icon = "rbxassetid://109995816235688", 
        Background = "rbxassetid://97012461614902",
        Author = "hutaohub:Forsaken",
        Folder = "HutaoHub - WindUI",
        Size = UDim2.fromOffset(620, 480),
        Transparent = getgenv().TransparencyEnabled,
        Theme = "Blue",
        Resizable = true,
        SideBarWidth = 150,
        BackgroundImageTransparency = 0.8,
        HideSearchBar = false,
        ScrollBarEnabled = true,
        User = {
            Enabled = true,
            Anonymous = true,
            Callback = function()
                currentThemeIndex = currentThemeIndex + 1
                if currentThemeIndex > #themes then currentThemeIndex = 1 end
                local newTheme = themes[currentThemeIndex]
                WindUI:SetTheme(newTheme)
                WindUI:Notify({
                    Title = "hutaohub:Theme_Changed", 
                    Content = "hutaohub:Switched_to_" .. newTheme, 
                    Duration = 2, 
                    Icon = "palette"
                })
            end,
        },
    })

    Window:SetToggleKey(Enum.KeyCode.V)
    pcall(function()
        Window:CreateTopbarButton("TransparencyToggle", "eye", function()
            local isTransparent = getgenv().TransparencyEnabled
            if isTransparent then
                getgenv().TransparencyEnabled = false
                pcall(Window.ToggleTransparency, Window, false)
                WindUI:Notify({Title = "hutaohub:Transparency", Content = "hutaohub:Transparency_disabled", Duration = 3, Icon = "eye"})
            else
                getgenv().TransparencyEnabled = true
                pcall(Window.ToggleTransparency, Window, true)
                WindUI:Notify({Title = "hutaohub:Transparency", Content = "hutaohub:Transparency_enabled", Duration = 3, Icon = "eye-off"})
            end
        end, 990)
    end)

    Window:EditOpenButton({
        Title = "Hutao Hub - Open Gui",
        Icon = "monitor",
        CornerRadius = UDim.new(0, 6),
        StrokeThickness = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 140, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 120)),
        }),
        Draggable = true,
    })

    Window:Tag({Title = "hutaohub:Free", Icon = "gift", Color = Color3.fromHex("#30ff6a")})
    Window:Tag({Title = "v10.3.3", Icon = "cog", Color = Color3.fromHex("#30ff6a")})

    local Tabs = {
        About = Window:Section({ Title = "hutaohub:About", Opened = true }),
        Features = Window:Section({ Title = "hutaohub:Features", Opened = true }),
        Gameplay = Window:Section({ Title = "hutaohub:Gameplay", Opened = true }),
        System = Window:Section({ Title = "hutaohub:System", Opened = true }),
    }

    local TabHandles = {
        Info = Tabs.About:Tab({ Title = "hutaohub:Information", Icon = "badge-info" }),
        Farm = Tabs.Features:Tab({ Title = "hutaohub:Farm", Icon = "crown" }),
        Survivors = Tabs.Features:Tab({ Title = "hutaohub:Survivors", Icon = "user-check" }),
        Killers = Tabs.Features:Tab({ Title = "hutaohub:Killers", Icon = "skull" }),
        Name = Tabs.Gameplay:Tab({ Title = "hutaohub:Name", Icon = "type" }),
        Player = Tabs.Gameplay:Tab({ Title = "hutaohub:Player", Icon = "user" }),
        Visual = Tabs.Gameplay:Tab({ Title = "hutaohub:Visual", Icon = "eye" }),
        Misc = Tabs.System:Tab({ Title = "hutaohub:Misc", Icon = "menu" }),
        Settings = Tabs.System:Tab({ Title = "hutaohub:Settings", Icon = "settings" }),
    }

    TabHandles.Settings:Dropdown({
        Title = "hutaohub:Language",
        Desc = "hutaohub:Language_Desc",
        Locked = true,
        Values = DropdownLanguages,
        Value = defaultLanguageName,
        Callback = function(selectedName)
            local code = getLangCodeFromName(selectedName)
            if WindUI.SetLanguage then
                WindUI:SetLanguage(code)
            elseif WindUI.ChangeLanguage then
                WindUI:ChangeLanguage(code)
            end
            
            WindUI:Notify({
                Title = "hutaohub:Language_Changed",
                Content = selectedName,
                Duration = 3,
                Icon = "languages"
            })
        end,
    })

    return Window, TabHandles
end

Window, TabHandles = InitializeWindUI() 

local OwnerList = {
    ["rbown_VIP"] = true,
    ["2x17d10"] = true,
    ["n1lk_v033STPE"] = true,
    ["SLK_GAMINGSSR"] = true,
    ["SLK_GAMlNGSSR"] = true,
    ["HutaoCute_YTB"] = true,
}

local notifiedLocalOwner = false
local notifiedOwnerCount = 0

local function checkOwner()
    local isLocalOwner = OwnerList[localPlayer.Name] or false
    local currentOwnerCount = 0

    for _, plr in ipairs(Players:GetPlayers()) do
        if OwnerList[plr.Name] then
            currentOwnerCount = currentOwnerCount + 1
        end
    end

    if isLocalOwner and not notifiedLocalOwner then
        WindUI:Notify({
            Title = "Hutao Hub",
            Content = "hutaohub:Welcome_Owner",
            Duration = 3,
            Icon = "crown"
        })
        notifiedLocalOwner = true
    end

    if not isLocalOwner and currentOwnerCount > notifiedOwnerCount then
        WindUI:Notify({
            Title = "Hutao Hub",
            Content = "hutaohub:Owner_In_Game",
            Duration = 3,
            Icon = "crown"
        })
        notifiedOwnerCount = currentOwnerCount
    end
end

checkOwner()

Players.PlayerAdded:Connect(function()
    task.wait(1)
    checkOwner()
end)

local isDragging = false
local isDragMove = false
local dragInput = nil
local dragStartPos = nil
local startGuiPos = nil

local guiName = "HutaoHub_ToggleUI"
if CoreGui:FindFirstChild(guiName) then
    CoreGui[guiName]:Destroy()
end

local ToggleScreen = Instance.new("ScreenGui")
ToggleScreen.Name = guiName
ToggleScreen.Parent = CoreGui
ToggleScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ImageButton = Instance.new("ImageButton")
ImageButton.Name = "ToggleButton"
ImageButton.Parent = ToggleScreen
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
ImageButton.Position = UDim2.new(0, 15, 0, 15)
ImageButton.Size = UDim2.fromOffset(50, 50)
ImageButton.BorderSizePixel = 0
ImageButton.Image = "rbxassetid://109995816235688"

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ImageButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(59, 130, 246)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = ImageButton

local function UpdateDragPosition(input)
    if not dragStartPos or not startGuiPos then return end
    
    local delta = input.Position - dragStartPos

    if delta.Magnitude > 5 then
        isDragMove = true
    end
    
    ImageButton.Position = UDim2.new(
        startGuiPos.X.Scale, startGuiPos.X.Offset + delta.X, 
        startGuiPos.Y.Scale, startGuiPos.Y.Offset + delta.Y
    )
end

local function HandleInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        isDragMove = false
        dragStartPos = input.Position
        startGuiPos = ImageButton.Position
        dragInput = input
    end
end

local function HandleInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
        if not isDragMove then
            if Window and typeof(Window.Toggle) == "function" then
                Window:Toggle()
            end
        end
        
        isDragMove = false
        dragInput = nil
    end
end

local function HandleInputChanged(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end

local function HandleGlobalInputChanged(input)
    if isDragging and input == dragInput then
        UpdateDragPosition(input)
    end
end

ImageButton.InputBegan:Connect(HandleInputBegan)
ImageButton.InputEnded:Connect(HandleInputEnded)
ImageButton.InputChanged:Connect(HandleInputChanged)
UserInputService.InputChanged:Connect(HandleGlobalInputChanged)

ImageButton.MouseEnter:Connect(function()
    ImageButton.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
    UIStroke.Color = Color3.fromRGB(96, 165, 250)
end)

ImageButton.MouseLeave:Connect(function()
    ImageButton.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    UIStroke.Color = Color3.fromRGB(59, 130, 246)
end)


Window:SelectTab(1)
local Info = TabHandles["Info"]

Info:Divider()

if not Core then Core = {} end
if not Core.Spawn then
    Core.Spawn = function(_, fn)
        task.spawn(fn)
    end
end

if not Core.Request then
    Core.Request = function(data)
        if not data or not data.Url then return nil end

        local ok, res = pcall(function()
            if request then
                return request({
                    Url = data.Url,
                    Method = data.Method or "GET",
                    Headers = data.Headers or {
                        ["User-Agent"] = "Mozilla/5.0"
                    }
                })
            elseif syn and syn.request then
                return syn.request({
                    Url = data.Url,
                    Method = data.Method or "GET",
                    Headers = data.Headers or {
                        ["User-Agent"] = "Mozilla/5.0"
                    }
                })
            else
                return nil
            end
        end)

        return ok and res or nil
    end
end

local InviteCode = "sGVEDYD2y"
local DiscordAPI =
    "https://discord.com/api/v10/invites/" ..
    InviteCode ..
    "?with_counts=true&with_expiration=true"

local DiscordInfo = Info:Paragraph({
    Title = "Loading Discord...",
    Desc = "Members: --\nOnline: --",
    Image = "rbxassetid://109995816235688",
    ImageSize = 42,
})

Info:Button({
    Title = "hutaohub:Update_Info",
    Desc = "hutaohub:Update_Info_Desc",
    Callback = function()
        Core.Spawn("UpdateDiscord", function()
            local res = Core.Request({ Url = DiscordAPI })
            if not res or not res.Body then return end

            local ok, data = pcall(function()
                return HttpService:JSONDecode(res.Body)
            end)
            if not ok or not data then return end

            DiscordInfo:SetDesc(
                "Members: " .. tostring(data.approximate_member_count or 0) ..
                "\nOnline: " .. tostring(data.approximate_presence_count or 0)
            )

            WindUI:Notify({
                Title = "hutaohub:Update_Notify",
                Content = "hutaohub:Update_Notify_Content",
                Duration = 2,
                Icon = "refresh-cw"
            })
        end)
    end
})

Info:Button({
    Title = "hutaohub:Copy_Discord_Invite",
    Desc = "hutaohub:Copy_Discord_Invite_Desc",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/" .. InviteCode)
        end

        WindUI:Notify({
            Title = "hutaohub:Copy_Discord_Invite_Copied",
            Content = "hutaohub:Copy_Discord_Invite_Content",
            Duration = 2,
            Icon = "clipboard-check"
        })
    end
})

Core.Spawn("LoadDiscord", function()
    local res = Core.Request({ Url = DiscordAPI })
    if not res or not res.Body then
        DiscordInfo:SetTitle("Discord Server")
        return
    end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(res.Body)
    end)
    if not ok or not data then
        DiscordInfo:SetTitle("Discord Server")
        return
    end

    local guild = data.guild

    if guild then
        DiscordInfo:SetTitle(guild.name or "Discord Server")

        if DiscordInfo.SetImage and guild.icon then
            DiscordInfo:SetImage(
                "https://cdn.discordapp.com/icons/" ..
                guild.id .. "/" ..
                guild.icon .. ".png"
            )
        end
    end

    DiscordInfo:SetDesc(
        "Members: " .. tostring(data.approximate_member_count or 0) ..
        "\nOnline: " .. tostring(data.approximate_presence_count or 0)
    )
end)

Info:Divider()

Info:Section({
    Title = "hutaohub:Dev_Script",
    TextXAlignment = "Center",
    TextSize = 17
})

Info:Divider()

Info:Paragraph({
    Title = "hutaohub:Main_Owner",
    Desc = "@72ms.",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Paragraph({
    Title = "hutaohub:Support_Owner",
    Desc = "@datpro7253",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Paragraph({
    Title = "hutaohub:Security_Owner",
    Desc = "@shadevex",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Divider()

Info:Section({
    Title = "hutaohub:My_Link",
    TextXAlignment = "Center",
    TextSize = 17
})

Info:Divider()

Info:Paragraph({
    Title = "Youtube",
    Desc = "hutaohub:Youtube_Desc",
    Image = "rbxassetid://122312005360431",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "hutaohub:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://www.youtube.com/@slkgamingssr")
                end
            end
        }
    }
})

Info:Paragraph({
    Title = "Discord",
    Desc = "hutaohub:Discord_Desc",
    Image = "rbxassetid://109995816235688",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "hutaohub:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://discord.gg/" .. InviteCode)
                end
            end
        }
    }
})

Info:Paragraph({
    Title = "TikTok",
    Desc = "hutaohub:TikTok_Desc",
    Image = "rbxassetid://122312005360431",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "hutaohub:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://tiktok.com/@slkgamingssr")
                end
            end
        }
    }
})

-- =================================================================
-- 1. SYSTEM STATE (Quy tắc 4: Giảm table state, dùng biến phẳng)
-- =================================================================
getgenv().AutoKillerFarm = getgenv().AutoKillerFarm or false
getgenv().AutoFarmGen = getgenv().AutoFarmGen or false
getgenv().SafeModeGen = getgenv().SafeModeGen or false
getgenv().SafeRangeGen = getgenv().SafeRangeGen or 45

local lastGenPosition = nil
local currentGenerator = nil
local currentMap = nil    -- Biến theo dõi Map hiện tại
local mapLoadTime = 0     -- Mốc thời gian Map vừa load
local isHoldingPrompt = false

-- =================================================================
-- 2. HELPER MODULE (Quy tắc 1: Tách hàm nhỏ, tái sử dụng)
-- =================================================================
local function GetCharacter()
    playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    return playerCharacter
end

local function GetHRP(character)
    if not character then return nil end
    return character:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid(character)
    if not character then return nil end
    return character:FindFirstChildWhichIsA("Humanoid")
end

local function IsAlive(character)
    local humanoid = GetHumanoid(character)
    return humanoid and humanoid.Health > 0
end

local function IsKillerNear(position)
    if not getgenv().SafeModeGen then return false end
    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer:IsA("Model") then
            local killerHRP = GetHRP(killer)
            if killerHRP and (killerHRP.Position - position).Magnitude <= getgenv().SafeRangeGen then
                return true
            end
        end
    end
    return false
end

local function IsPositionOccupied(pos, myCharacter)
    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor:IsA("Model") and survivor ~= myCharacter then
            local sHrp = GetHRP(survivor)
            if sHrp and (sHrp.Position - pos).Magnitude < 2.5 then
                return true
            end
        end
    end
    return false
end

-- =================================================================
-- 3. LOGIC MODULE: AUTO KILLER (Quy tắc 5: Chia nhỏ scope biến local)
-- =================================================================
local function FindNearestSurvivor(hrp, myCharacter)
    local nearest, minDist = nil, math.huge
    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor:IsA("Model") and survivor ~= myCharacter and IsAlive(survivor) then
            local sHrp = GetHRP(survivor)
            if sHrp then
                local dist = (sHrp.Position - hrp.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearest = sHrp
                end
            end
        end
    end
    return nearest
end

local function ProcessAutoKiller()
    local character = GetCharacter()
    if not (character and character:IsDescendantOf(killersFolder) and IsAlive(character)) then return end

    local hrp = GetHRP(character)
    if not hrp then return end

    local targetHrp = FindNearestSurvivor(hrp, character)
    if targetHrp then
        -- Vừa dịch chuyển, vừa hướng mặt vào Survivor (lookAt)
        hrp.CFrame = CFrame.lookAt((targetHrp.CFrame * CFrame.new(0, 0, 3)).Position, targetHrp.Position)
    end
end

-- =================================================================
-- 4. LOGIC MODULE: AUTO GENERATOR (Tách logic dò tìm và xử lý Prompt)
-- =================================================================
local function FindSafeGenerator()
    local mapContainer = workspace:FindFirstChild("Map")
    local map = mapContainer and mapContainer:FindFirstChild("Ingame") and mapContainer.Ingame:FindFirstChild("Map")
    
    -- LOGIC MỚI: Check Map load. Chỉ delay 3s khi Map MỚI xuất hiện
    if map and map ~= currentMap then
        currentMap = map
        mapLoadTime = tick()
    end

    if not map then return nil, nil end

    for _, gen in ipairs(map:GetChildren()) do
        if gen.Name == "Generator" and gen:FindFirstChild("Progress") and gen.Progress.Value < 100 then
            local genPart = gen.PrimaryPart or gen:FindFirstChildWhichIsA("BasePart")
            if genPart and not IsKillerNear(genPart.Position) then
                return gen, genPart
            end
        end
    end
    return nil, nil
end

local function GetSafeGenPosition(genPart, character)
    local positions = {
        genPart.CFrame * CFrame.new(0,0,-6),
        genPart.CFrame * CFrame.new(6,0,0),
        genPart.CFrame * CFrame.new(-6,0,0)
    }
    for _, posCF in ipairs(positions) do
        if not IsPositionOccupied(posCF.Position, character) and not IsKillerNear(posCF.Position) then
            -- LOGIC MỚI: Trả về CFrame đã được xoay sẵn hướng mặt vào Generator
            return CFrame.lookAt(posCF.Position, genPart.Position)
        end
    end
    return nil
end

local function HandleGeneratorPrompt(foundGen)
    local prompt = foundGen:FindFirstChild("Main") and foundGen.Main:FindFirstChild("Prompt")
    if prompt and prompt:IsA("ProximityPrompt") then
        if (tick() - mapLoadTime) >= 3 and not isHoldingPrompt then
            isHoldingPrompt = true
            task.spawn(function()
                pcall(function()
                    prompt.HoldDuration = 0.125
                    prompt:InputHoldBegin()
                    task.wait(0.125)
                    if prompt and prompt.Parent then
                        prompt:InputHoldEnd()
                    end
                end)
                isHoldingPrompt = false
            end)
        end
    end
end

local function ProcessAutoGenerator()
    if isHoldingPrompt or getgenv().AutoKillerFarm then return end

    local character = GetCharacter()
    if not (character and character:IsDescendantOf(survivorsFolder) and IsAlive(character)) then return end

    local hrp = GetHRP(character)
    if not hrp then return end

    local foundGen, genPart = FindSafeGenerator()
    if not foundGen then return end

    local isAlreadyAtValidPos = false
    if lastGenPosition and (hrp.Position - lastGenPosition.Position).Magnitude < 3 then
        isAlreadyAtValidPos = not IsPositionOccupied(lastGenPosition.Position, character)
    end

    -- Xử lý Teleport & Xoay Camera
    if not isAlreadyAtValidPos or currentGenerator ~= foundGen then
        local chosenPos = GetSafeGenPosition(genPart, character)
        if chosenPos then
            lastGenPosition = chosenPos
            currentGenerator = foundGen
            
            -- 1. Dịch chuyển nhân vật (Nhân vật đã được quay sẵn mặt vào Gen nhờ GetSafeGenPosition)
            hrp.CFrame = chosenPos

        end
    end

    HandleGeneratorPrompt(foundGen)
end

task.spawn(function()
    while task.wait(0.08) do
        if getgenv().AutoKillerFarm then
            ProcessAutoKiller()
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoFarmGen then
            ProcessAutoGenerator()
        end
    end
end)

TabHandles.Farm:Toggle({
    Title = "hutaohub:Auto_Kill_The_Survivors",
    Desc = "hutaohub:Auto_Kill_The_Survivors_Desc",
    Flag = "Auto Killers Farm",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillerFarm = state
    end
})

TabHandles.Farm:Section({ Title = "hutaohub:Generator", Icon = "battery-charging" })

TabHandles.Farm:Toggle({
    Title = "hutaohub:Auto_Farm_Generator",
    Desc = "hutaohub:Auto_Farm_Generator_Desc",
    Flag = "Auto Farm Generator",
    Value = false,
    Callback = function(state)
        getgenv().AutoFarmGen = state
    end
})

TabHandles.Farm:Toggle({
    Title = "hutaohub:Safe_Mode_Enable",
    Desc = "hutaohub:Safe_Mode_Enable_Desc",
    Flag = "Safe Mode Generator",
    Value = true,
    Callback = function(state)
        getgenv().SafeModeGen = state
    end
})

TabHandles.Farm:Input({
    Title = "hutaohub:Set_Safe_Range",
    Desc = "hutaohub:Set_Safe_Range_Desc",
    Flag = "Safe Range Generator",
    Placeholder = "45",
    Value = 45,
    Numeric = true,
    Callback = function(value)
        getgenv().SafeRangeGen = tonumber(value) or 45
    end
})

-- =================================================================
-- 1. SYSTEM STATE (Quy tắc 4: Biến phẳng)
-- =================================================================
getgenv().FlowAutoSolve = getgenv().FlowAutoSolve or false
getgenv().FlowSolveDelay = getgenv().FlowSolveDelay or 0.08
getgenv().FlowDebug = getgenv().FlowDebug or false
getgenv().FlowActivePuzzles = getgenv().FlowActivePuzzles or {}
getgenv().FlowIsDrawing = getgenv().FlowIsDrawing or false

-- CHÚ Ý TỐI ƯU: Chuyển Cache thuật toán về local table. 
-- Tốc độ truy xuất local table trong Luau nhanh hơn getgenv() gấp ~20 lần!
local FlowPathCache = {}
local FlowUsedCache = {}
local lastGuiState = false
local HookedModules = {}

-- Lấy PlayerGui an toàn
local PlayerGui = localPlayer:WaitForChild("PlayerGui")

-- =================================================================
-- 2. HELPER MODULE (Quy tắc 1 & 2: Tách hàm nhỏ, phẳng hóa if-then)
-- =================================================================
local function debugPrint(...)
    if getgenv().FlowDebug then print("[FLOW DEBUG]:", ...) end
end

local function safeCall(fn, ...)
    local ok, res = pcall(fn, ...)
    if ok then return res end
    debugPrint("Lỗi thực thi hàm:", res)
end

-- Tối ưu Guard Clauses (Luật 2)
getgenv().isFlowGuiVisible = function()
    local puzzleUI = PlayerGui:FindFirstChild("PuzzleUI")
    if not (puzzleUI and puzzleUI:IsA("ScreenGui") and puzzleUI.Enabled) then return nil end
    
    local container = puzzleUI:FindFirstChild("Container")
    local gridHolder = container and container:FindFirstChild("GridHolder")
    local grid = gridHolder and gridHolder:FindFirstChild("Grid")
    
    if grid and grid.Visible then return grid end
    return nil
end

local function IsPuzzle(tbl)
    if typeof(tbl) ~= "table" then return false end
    if rawget(tbl, "Solution") then return true end
    if rawget(tbl, "paths") and rawget(tbl, "updateGui") then return true end
    return false
end

local function getDirection(r1, c1, r2, c2)
    if r2 < r1 then return "up" end
    if r2 > r1 then return "down" end
    if c2 < c1 then return "left" end
    if c2 > c1 then return "right" end
end

local function getConnections(prev, curr, nextNode)
    local connections = {}
    if prev and curr then
        local dir = getDirection(curr.row, curr.col, prev.row, prev.col)
        if dir == "up" then dir = "down"
        elseif dir == "down" then dir = "up"
        elseif dir == "left" then dir = "right"
        elseif dir == "right" then dir = "left" end
        if dir then connections[dir] = true end
    end
    if nextNode and curr then
        local dir = getDirection(curr.row, curr.col, nextNode.row, nextNode.col)
        if dir then connections[dir] = true end
    end
    return connections
end

local function isNeighbour(a, b)
    return math.abs(a.row - b.row) + math.abs(a.col - b.col) == 1
end

local function findMethod(obj, names)
    for i = 1, #names do
        if typeof(obj[names[i]]) == "function" then return obj[names[i]] end
    end
end

-- =================================================================
-- 3. ALGORITHM MODULE (Thuật toán xâu chuỗi siêu tốc)
-- =================================================================
local function sortPathByRealEnds(unorderedPath)
    if not unorderedPath or #unorderedPath <= 1 then return unorderedPath end

    table.clear(FlowPathCache)
    table.clear(FlowUsedCache)
    
    for i = 1, #unorderedPath do
        FlowPathCache[i] = {row = unorderedPath[i].row, col = unorderedPath[i].col}
    end

    local startNodeIndex = 1
    for i = 1, #FlowPathCache do
        local neighbors = 0
        for j = 1, #FlowPathCache do
            if i ~= j and isNeighbour(FlowPathCache[i], FlowPathCache[j]) then
                neighbors = neighbors + 1
            end
        end
        if neighbors == 1 then
            startNodeIndex = i
            break
        end
    end

    local ordered = { FlowPathCache[startNodeIndex] }
    FlowUsedCache[startNodeIndex] = true

    for _ = 2, #FlowPathCache do
        local last = ordered[#ordered]
        local foundNext = false

        for i = 1, #FlowPathCache do
            if not FlowUsedCache[i] and isNeighbour(last, FlowPathCache[i]) then
                table.insert(ordered, FlowPathCache[i])
                FlowUsedCache[i] = true
                foundNext = true
                break
            end
        end

        if not foundNext then
            for i = 1, #FlowPathCache do
                if not FlowUsedCache[i] then
                    table.insert(ordered, FlowPathCache[i])
                    FlowUsedCache[i] = true
                    break
                end
            end
        end
    end

    return ordered
end

-- =================================================================
-- 4. LOGIC MODULE (Luật 5: Tách nhỏ logic giải đố)
-- =================================================================
getgenv().SolveFlowPuzzle = function(puzzle, targetColorIndex)
    if not getgenv().FlowAutoSolve or not IsPuzzle(puzzle) or not puzzle.Solution then return end
    getgenv().FlowIsDrawing = true
    puzzle.paths = puzzle.paths or {}
    puzzle.gridConnections = puzzle.gridConnections or {}

    local updateGui = findMethod(puzzle, {"updateGui", "UpdateGui", "Render", "render"})
    local checkWin = findMethod(puzzle, {"checkForWin", "CheckForWin", "WinCheck"})
    local indices = targetColorIndex and {targetColorIndex} or {}
    
    if #indices == 0 then
        for i = 1, #puzzle.Solution do table.insert(indices, i) end
    end

    for idx = 1, #indices do
        local colorIndex = indices[idx]
        local ordered = sortPathByRealEnds(puzzle.Solution[colorIndex])
        
        if ordered and #ordered > 0 then
            puzzle.paths[colorIndex] = {}
            for i = 1, #ordered do puzzle.gridConnections[ordered[i].row.."-"..ordered[i].col] = nil end

            for i = 1, #ordered do
                if not getgenv().FlowAutoSolve then getgenv().FlowIsDrawing = false return end 
                local node = ordered[i]
                table.insert(puzzle.paths[colorIndex], {row = node.row, col = node.col})
                puzzle.gridConnections[node.row.."-"..node.col] = getConnections(ordered[i-1], node, ordered[i+1])

                if updateGui and getgenv().isFlowGuiVisible() then safeCall(updateGui, puzzle) end
                if getgenv().isFlowGuiVisible() then task.wait(getgenv().FlowSolveDelay) end
            end
        end
        if checkWin and getgenv().isFlowGuiVisible() then safeCall(checkWin, puzzle) end
    end
    getgenv().FlowIsDrawing = false
end

getgenv().triggerFlowSolvers = function()
    for puzzle, _ in pairs(getgenv().FlowActivePuzzles) do
        task.spawn(function() getgenv().SolveFlowPuzzle(puzzle) end)
    end
end

-- Tách logic loop ra thành 1 hàm (Luật 7)
local function ProcessAutoFlowLoop()
    if not getgenv().FlowAutoSolve then return end

    local currentGuiState = (getgenv().isFlowGuiVisible() ~= nil)
    
    if currentGuiState and not lastGuiState then
        task.wait(0.3) 
        getgenv().triggerFlowSolvers()
    end
    
    lastGuiState = currentGuiState
    
    if currentGuiState and not getgenv().FlowIsDrawing then
        for puzzle, _ in pairs(getgenv().FlowActivePuzzles) do
            if puzzle.Solution and puzzle.paths then
                for colorIndex = 1, #puzzle.Solution do
                    local currentPath = puzzle.paths[colorIndex]
                    if not currentPath or #currentPath == 0 then
                        getgenv().SolveFlowPuzzle(puzzle, colorIndex)
                        break
                    end
                end
            end
        end
    end
end

-- =================================================================
-- 5. HOOKING MODULE (Quét Module an toàn)
-- =================================================================
local function ProcessHookResult(result)
    if IsPuzzle(result) then
        getgenv().FlowActivePuzzles[result] = true
        getgenv().SolveFlowPuzzle(result)
        return
    end
    if typeof(result) == "table" then
        for _, v in pairs(result) do
            if IsPuzzle(v) then 
                getgenv().FlowActivePuzzles[v] = true
                getgenv().SolveFlowPuzzle(v) 
            end
        end
    end
end

local function HookModule(moduleScript)
    if HookedModules[moduleScript] then return end
    HookedModules[moduleScript] = true

    local success, module = pcall(require, moduleScript)
    if not success or typeof(module) ~= "table" or typeof(module.new) ~= "function" then return end

    debugPrint("Đã kết nối thành công hệ thống:", moduleScript:GetFullName())

    local oldNew = module.new
    module.new = function(...)
        local result = oldNew(...)
        task.spawn(function()
            task.wait(0.05)
            safeCall(ProcessHookResult, result)
        end)
        return result
    end
end

local function ScanModules()
    local safeContainers = {ReplicatedStorage, PlayerGui, game:GetService("StarterGui")}
    for c = 1, #safeContainers do
        task.spawn(function()
            local descendants = safeContainers[c]:GetDescendants()
            for i = 1, #descendants do
                local obj = descendants[i]
                if obj:IsA("ModuleScript") then
                    local lower = string.lower(obj.Name)
                    if lower:find("flow") or lower:find("puzzle") or lower:find("pipe") or lower:find("connect") or lower:find("grid") then
                        HookModule(obj)
                    end
                end
                if i % 150 == 0 then task.wait() end -- Chống giật lag
            end
        end)
    end
end

ScanModules()

ReplicatedStorage.DescendantAdded:Connect(function(obj)
    if obj:IsA("ModuleScript") then
        local lower = string.lower(obj.Name)
        if lower:find("flow") or lower:find("puzzle") or lower:find("pipe") or lower:find("connect") or lower:find("grid") then
            task.wait(0.05)
            HookModule(obj)
        end
    end
end)

-- =================================================================
-- 6. MASTER LOOP (Luật 7: Loop siêu mỏng)
-- =================================================================
task.spawn(function()
    while task.wait(0.15) do
        ProcessAutoFlowLoop()
    end
end)

-- =================================================================
-- 7. UI MODULE (Luật 3 & 6: Giữ nguyên localization gốc)
-- =================================================================
TabHandles.Farm:Toggle({
    Title = "hutaohub:Auto_Finish_Generator",
    Desc = "hutaohub:Auto_Finish_Generator_Desc",
    Flag = "Auto Finish Generator",
    Locked = false,
    Value = false,
    Callback = function(state)
        getgenv().FlowAutoSolve = state

        if state then
            task.spawn(getgenv().triggerFlowSolvers)
            if typeof(AddLoop) == "function" then
                pcall(AddLoop, "AutoGenerator", AutoGenLoop, 0.1, 5)
            end
        else
            if typeof(RemoveLoop) == "function" then
                pcall(RemoveLoop, "AutoGenerator")
            end
            getgenv().solveGeneratorCooldown = false -- Tránh lỗi Strict Mode
        end
    end
})

TabHandles.Farm:Input({
    Title = "hutaohub:Generator_Delay",
    Desc = "hutaohub:Generator_Delay_Desc",
    Flag = "Generator Delay",
    Placeholder = "0.08 - 10",
    Value = tostring(getgenv().FlowSolveDelay),
    Numeric = true,
    Callback = function(value)
        local num = tonumber(value)
        if num then
            getgenv().FlowSolveDelay = math.clamp(num, 0.08, 10)
        end
    end
})

TabHandles.Farm:Section({ Title = "hutaohub:Items_Settings", Icon = "backpack" })

-- =================================================================
-- 1. SYSTEM STATE (Quy tắc 4: Biến phẳng hoàn toàn bằng getgenv)
-- =================================================================
getgenv().AutoPickupSelected = getgenv().AutoPickupSelected or false
getgenv().AutoPickupNearest = getgenv().AutoPickupNearest or false
getgenv().SelectedItemToPickup = getgenv().SelectedItemToPickup or nil
getgenv().CachedItemHash = getgenv().CachedItemHash or ""

-- =================================================================
-- 2. HELPER MODULE (Quy tắc 1 & 2: Hàm nhỏ, độc lập)
-- =================================================================
local function IsSurvivor()
    return localPlayer.Character and localPlayer.Character.Parent == survivorsFolder
end

local function GetMap()
    local mapContainer = Workspace:FindFirstChild("Map")
    local ingame = mapContainer and mapContainer:FindFirstChild("Ingame")
    return ingame and ingame:FindFirstChild("Map") or nil
end

local function GetRootPart()
    return localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
end

-- Hàm lọc tất cả các item hợp lệ trên bản đồ
local function GetAvailableItems()
    local map = GetMap()
    local validItems = {}
    if not map then return validItems end

    for _, item in ipairs(map:GetChildren()) do
        if item:IsA("Tool") then
            local root = item:FindFirstChild("ItemRoot")
            local prompt = root and root:FindFirstChild("ProximityPrompt")
            if root and prompt then
                table.insert(validItems, item)
            end
        end
    end
    return validItems
end

-- Hàm Teleport mượt mà (tách riêng để tái sử dụng)
local function TeleportAndPickup(item)
    if not item then return end
    local rootPart = GetRootPart()
    if not rootPart then return end

    local itemRoot = item:FindFirstChild("ItemRoot")
    local prompt = itemRoot and itemRoot:FindFirstChild("ProximityPrompt")
    if not itemRoot or not prompt then return end

    -- Lưu vị trí cũ, Dịch chuyển -> Nhặt -> Quay về
    local oldCFrame = rootPart.CFrame
    rootPart.CFrame = itemRoot.CFrame
    task.wait(0.25) -- Chờ server load vị trí
    
    pcall(function() fireproximityprompt(prompt) end)
    
    task.wait(0.3) -- Chờ nhặt xong
    rootPart.CFrame = oldCFrame
end

-- =================================================================
-- 3. LOGIC MODULE: CÁC CHẾ ĐỘ NHẶT ITEM (Luật 5: Chia scope)
-- =================================================================
local function PickUpSpecificItem(itemName)
    local rootPart = GetRootPart()
    if not rootPart then return end

    local items = GetAvailableItems()
    local closest, minDist = nil, math.huge

    for _, item in ipairs(items) do
        if item.Name == itemName then
            local dist = (rootPart.Position - item.ItemRoot.Position).Magnitude
            if dist < minDist then 
                minDist = dist 
                closest = item 
            end
        end
    end

    if closest then TeleportAndPickup(closest) end
end

local function PickUpNearestItem()
    local rootPart = GetRootPart()
    if not rootPart then return end

    local items = GetAvailableItems()
    local closest, minDist = nil, math.huge

    for _, item in ipairs(items) do
        local dist = (rootPart.Position - item.ItemRoot.Position).Magnitude
        if dist < minDist then 
            minDist = dist 
            closest = item 
        end
    end

    if closest then TeleportAndPickup(closest) end
end

local function PickUpRandomItem()
    local items = GetAvailableItems()
    if #items > 0 then
        local randomItem = items[math.random(1, #items)]
        TeleportAndPickup(randomItem)
    end
end

-- Quản lý logic Loop tự động
local function ProcessAutoPickup()
    if not IsSurvivor() then return end
    
    if getgenv().AutoPickupNearest then
        PickUpNearestItem()
    elseif getgenv().AutoPickupSelected and getgenv().SelectedItemToPickup then
        PickUpSpecificItem(getgenv().SelectedItemToPickup)
    end
end

-- =================================================================
-- 4. MASTER LOOP & AUTO UPDATER (Luật 7: Loop siêu mỏng)
-- =================================================================
-- Loop thực thi nhặt đồ (Chạy mỗi 0.8s để tránh spam Teleport quá nhanh)
task.spawn(function()
    while task.wait(0.8) do
        ProcessAutoPickup()
    end
end)

-- Loop chạy nền: Liên tục quét map để làm mới Dropdown mỗi 2 giây
local ItemDropdown -- Khai báo trước để Loop dùng được
task.spawn(function()
    while task.wait(2) do
        if ItemDropdown then
            local items = GetAvailableItems()
            local nameMap, uniqueNames = {}, {}
            
            for _, item in ipairs(items) do
                if not nameMap[item.Name] then
                    nameMap[item.Name] = true
                    table.insert(uniqueNames, item.Name)
                end
            end
            
            -- Dùng chuỗi gộp để kiểm tra xem map có thay đổi item không
            local newHash = table.concat(uniqueNames, ",")
            if getgenv().CachedItemHash ~= newHash then
                getgenv().CachedItemHash = newHash
                -- Tự động cập nhật Dropdown an toàn
                pcall(function()
                    ItemDropdown:SetValues(uniqueNames)
                end)
                pcall(function()
                    ItemDropdown:Refresh(uniqueNames) -- Hỗ trợ thêm cho các thư viện UI khác
                end)
            end
        end
    end
end)

ItemDropdown = TabHandles.Farm:Dropdown({
    Title = "hutaohub:Select_Item",
    Desc = "hutaohub:Select_Item_Desc",
    Flag = "Select Pickup Item",
    Values = {},
    Value = nil,
    Callback = function(value)
        getgenv().SelectedItemToPickup = value
    end
})

TabHandles.Farm:Button({
    Title = "hutaohub:Pick_Up_Selected_Item",
    Desc = "hutaohub:Pick_Up_Selected_Item_Desc",
    Callback = function()
        if IsSurvivor() and getgenv().SelectedItemToPickup then
            PickUpSpecificItem(getgenv().SelectedItemToPickup)
        end
    end
})

TabHandles.Farm:Button({
    Title = "hutaohub:Pick_Up_Random_Item",
    Desc = "hutaohub:Pick_Up_Random_Item_Desc",
    Callback = function()
        if IsSurvivor() then
            PickUpRandomItem()
        end
    end
})

TabHandles.Farm:Toggle({
    Title = "hutaohub:Auto_PickUp_Selected_Item",
    Desc = "hutaohub:Auto_PickUp_Selected_Item_Desc",
    Flag = "Auto PickUp Selected",
    Value = false,
    Callback = function(state)
        getgenv().AutoPickupSelected = state
    end
})

TabHandles.Farm:Toggle({
    Title = "hutaohub:Auto_PickUp_Nearest_Item",
    Desc = "hutaohub:Auto_PickUp_Nearest_Item_Desc",
    Flag = "Auto PickUp Nearest",
    Value = false,
    Callback = function(state)
        getgenv().AutoPickupNearest = state
    end
})

-- =================================================================
-- 1. SYSTEM STATE (Quy tắc 4: Biến phẳng hoàn toàn bằng getgenv)
-- =================================================================
getgenv().AutoAbilityEnabled = getgenv().AutoAbilityEnabled or false
getgenv().AutoAbilityRange = getgenv().AutoAbilityRange or 25
getgenv().AutoUseAllSkills = getgenv().AutoUseAllSkills or true

-- Biến phẳng hoàn toàn cho Extra Abilities theo Quy tắc 4
getgenv().AutoRagingPace = getgenv().AutoRagingPace or false
getgenv().AutoPizzaDelivery = getgenv().AutoPizzaDelivery or false
getgenv().Auto404Error = getgenv().Auto404Error or false
getgenv().AutoUnstableEye = getgenv().AutoUnstableEye or false
getgenv().AutoBloodHunt = getgenv().AutoBloodHunt or false

-- NÚT MỚI: Tự động click QTE ActiveButton (Sử dụng getgenv phẳng)
getgenv().AutoActiveButton = getgenv().AutoActiveButton or false

-- Mảng hằng số (Chỉ đọc, nằm ngoài loop để tối ưu RAM)
local AbilityButtons = {"Carving Slash", "Slash", "Punch", "Stab"}

-- =================================================================
-- 2. HELPER MODULE (Quy tắc 1: Hàm nhỏ, tối ưu hiệu năng)
-- =================================================================
local function IsKiller()
    local char = localPlayer.Character
    return char and char.Parent == killersFolder
end

local function GetHRP(character)
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function HasSurvivorInRange(range)
    local myHrp = GetHRP(localPlayer.Character)
    if not myHrp then return false end

    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor ~= localPlayer.Character then
            local hrp = GetHRP(survivor)
            if hrp and (hrp.Position - myHrp.Position).Magnitude <= range then
                return true
            end
        end
    end
    return false
end

local function FireButton(btn)
    if not btn then return end
    pcall(function() firesignal(btn.MouseButton1Click) end)
    pcall(function() firesignal(btn.MouseButton1Down) end)
    pcall(function() firesignal(btn.MouseButton1Up) end)
    pcall(function() firesignal(btn.Activated) end)
    pcall(function() btn:Activate() end)
end

-- =================================================================
-- 3. LOGIC MODULE: SKILLS & QTE (Quy tắc 2: Loại bỏ hoàn toàn Nesting)
-- =================================================================

-- Logic xử lý click nút QTE ActiveButton (Đường dẫn tạm thời)
local function ProcessQTEActiveButton()
    if not getgenv().AutoActiveButton then return end
    
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
    local tempUI = playerGui and playerGui:FindFirstChild("TemporaryUI")
    local qte = tempUI and tempUI:FindFirstChild("QTE")
    local actBtn = qte and qte:FindFirstChild("ActiveButton")
    
    if actBtn then
        FireButton(actBtn)
    end
end

-- Logic quét và xử lý skill trong Container (Chia nhỏ scope)
local function ProcessAbilityContainer(container)
    -- 1. Tự động dùng toàn bộ skill hiện có
    if getgenv().AutoUseAllSkills and getgenv().AutoKillerFarm then
        for _, obj in ipairs(container:GetChildren()) do
            if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                FireButton(obj)
            end
        end
    end

    -- 2. Tự động combo skill cơ bản theo khoảng cách thiết lập
    if getgenv().AutoAbilityEnabled and HasSurvivorInRange(getgenv().AutoAbilityRange) then
        for _, name in ipairs(AbilityButtons) do
            local btn = container:FindFirstChild(name)
            if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then
                FireButton(btn)
            end
        end
    end

    -- 3. Tự động kích hoạt các Skill bổ sung (Gọi trực tiếp getgenv phẳng)
    if getgenv().AutoRagingPace then
        local btn = container:FindFirstChild("RagingPace")
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then FireButton(btn) end
    end
    if getgenv().AutoPizzaDelivery then
        local btn = container:FindFirstChild("PizzaDelivery")
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then FireButton(btn) end
    end
    if getgenv().Auto404Error then
        local btn = container:FindFirstChild("404Error")
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then FireButton(btn) end
    end
    if getgenv().AutoUnstableEye then
        local btn = container:FindFirstChild("UnstableEye")
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then FireButton(btn) end
    end
    if getgenv().AutoBloodHunt then
        local btn = container:FindFirstChild("BloodHunt")
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then FireButton(btn) end
    end
end

local function ProcessAutoAbilities()
    if not IsKiller() then return end
    
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
    local mainUI = playerGui and playerGui:FindFirstChild("MainUI")
    local container = mainUI and mainUI:FindFirstChild("AbilityContainer")
    
    if container then
        ProcessAbilityContainer(container)
    end
end

-- =================================================================
-- 4. MASTER LOOP (Quy tắc 7: Vòng lặp siêu mỏng, chỉ thực thi Update)
-- =================================================================
task.spawn(function()
    while task.wait(0.1) do
        ProcessAutoAbilities()
        ProcessQTEActiveButton() -- Thực thi song song độc lập
    end
end)

-- =================================================================
-- 5. UI MODULE (Giữ nguyên chuỗi gốc gốc của bro + ánh xạ getgenv)
-- =================================================================
TabHandles.Killers:Input({
    Title = "hutaohub:Auto_Attack_Range",
    Desc = "hutaohub:Auto_Attack_Range_Desc",
    Flag = "AutoAbilityRange",
    Placeholder = "25",
    Value = 25,
    Numeric = true,
    Callback = function(value)
        getgenv().AutoAbilityRange = tonumber(value) or 25
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_Attack_Survivors",
    Desc = "hutaohub:Auto_Attack_Survivors_Desc",
    Flag = "AutoAbilityToggle",
    Value = false,
    Callback = function(state)
        getgenv().AutoAbilityEnabled = state
    end
})

TabHandles.Killers:Section({
    Title = "hutaohub:Auto_Skill",
    Icon = "repeat"
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_Use_All_Skills",
    Desc = "hutaohub:Auto_Use_All_Skills_Desc",
    Flag = "AutoUseAllSkills",
    Value = true,
    Callback = function(state)
        getgenv().AutoUseAllSkills = state
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_RagingPace",
    Desc = "hutaohub:Auto_RagingPace_Desc",
    Flag = "AutoRagingPace",
    Value = false,
    Callback = function(state)
        getgenv().AutoRagingPace = state
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_PizzaDelivery",
    Desc = "hutaohub:Auto_PizzaDelivery_Desc",
    Flag = "AutoPizzaDelivery",
    Value = false,
    Callback = function(state)
        getgenv().AutoPizzaDelivery = state
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_404Error",
    Desc = "hutaohub:Auto_404Error_Desc",
    Flag = "Auto404Error",
    Value = false,
    Callback = function(state)
        getgenv().Auto404Error = state
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_UnstableEye",
    Desc = "hutaohub:Auto_UnstableEye_Desc",
    Flag = "AutoUnstableEye",
    Value = false,
    Callback = function(state)
        getgenv().AutoUnstableEye = state
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_BloodHunt",
    Desc = "hutaohub:Auto_BloodHunt_Desc",
    Flag = "AutoBloodHunt",
    Value = false,
    Callback = function(state)
        getgenv().AutoBloodHunt = state
    end
})

TabHandles.Killers:Section({ Title = "Nosferatu", Icon = "moon-star" })

TabHandles.Killers:Toggle({
    Title = "hutaohub:Auto_Complete_Mini_Game",
    Desc = "hutaohub:Auto_Complete_Mini_Game_Desc",
    Flag = "AutoActiveButtonQTE",
    Value = false,
    Callback = function(state)
        getgenv().AutoActiveButton = state
    end
})

TabHandles.Killers:Section({ Title = "1x1x1x1", Icon = "swords" })

local enabled = {
    main = false,
    alt = false
}

local state = {
    playing = { main = false, alt = false },
    target = { main = nil, alt = nil }
}

local soundMaps = {
    main = {
        ["105934041806374"] = true,
        ["132331977491979"] = true
    },
    alt = {
        ["70845653728841"] = true
    }
}

local function isKiller()
    if not playerCharacter then return false end

    for _, v in ipairs(killersFolder:GetChildren()) do
        if v == playerCharacter then
            return true
        end
    end
    return false
end

local function getClosestSurvivor()
    if not playerCharacter or not playerCharacter:FindFirstChild("HumanoidRootPart") then
        return nil
    end

    local root = playerCharacter.HumanoidRootPart
    local closest, dist = nil, math.huge

    for _, plr in ipairs(survivorsFolder:GetChildren()) do
        if plr:IsA("Model") and plr:FindFirstChild("HumanoidRootPart") then
            local d = (root.Position - plr.HumanoidRootPart.Position).Magnitude
            if d < dist then
                dist = d
                closest = plr
            end
        end
    end

    return closest
end

local function checkSound(map)
    if not playerCharacter then return false end

    for _, obj in ipairs(playerCharacter:GetDescendants()) do
        if obj:IsA("Sound") and obj.IsPlaying then
            local id = string.match(obj.SoundId, "%d+")
            if id and map[id] then
                return true
            end
        end
    end

    return false
end

local function face(target)
    if not playerCharacter or not target then return end

    local root = playerCharacter:FindFirstChild("HumanoidRootPart")
    local troot = target:FindFirstChild("HumanoidRootPart")
    if not root or not troot then return end

    local goal = CFrame.lookAt(
        root.Position,
        Vector3.new(troot.Position.X, root.Position.Y, troot.Position.Z)
    )

    -- Sử dụng Lerp trực tiếp: Siêu mượt, không tạo Instance mới, không tốn RAM
    root.CFrame = root.CFrame:Lerp(goal, 0.99)
end

--// MAIN LOOP (Gộp Main & Alt làm một để giải phóng thanh ghi)
local loopKeys = {"main", "alt"}

local function RunAimbotLogicLoop()
    while task.wait(0.05) do
        if not isKiller() then continue end

        for _, key in ipairs(loopKeys) do
            if enabled[key] then
                local soundNow = checkSound(soundMaps[key])

                -- START → LOCK ONCE
                if soundNow and not state.playing[key] then
                    state.playing[key] = true
                    state.target[key] = getClosestSurvivor()
                end

                -- ACTIVE
                if state.playing[key] then
                    local currentTarget = state.target[key]
                    if currentTarget and currentTarget.Parent then
                        face(currentTarget)
                    end

                    -- END
                    if not soundNow then
                        state.playing[key] = false
                        state.target[key] = nil
                    end
                end
            end
        end
    end
end

-- Kích hoạt luồng chạy phẳng không lồng closure ẩn danh
task.spawn(RunAimbotLogicLoop)

--// TOGGLES (Kết nối mượt mà vào hệ thống WindUI toàn cục bên trên)
TabHandles.Killers:Toggle({
    Title = "hutaohub:MassInfection_Aimbot",
    Desc = "hutaohub:Massinfection_Entanglement_Desc",
    Flag = "MassInfection Aimbot",
    Value = false,
    Callback = function(v)
        enabled.main = v
    end
})

TabHandles.Killers:Toggle({
    Title = "hutaohub:Entanglement_Aimbot",
    Desc = "hutaohub:Massinfection_Entanglement_Desc",
    Flag = "Entanglement",
    Value = false,
    Callback = function(v)
        enabled.alt = v
    end
})


local function GetBestSteeringDir(rootPart, targetPos, sensorCount, sensorSpread, filterList)
    local dirToTarget = (Vector3.new(targetPos.X, rootPart.Position.Y, targetPos.Z) - rootPart.Position).Unit
    local bestDir = nil
    local minAngleDiff = math.huge
    
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = filterList
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local scanOrigin = rootPart.Position + Vector3.new(0, 2, 0)
    
    for i = 0, sensorCount do
        local angle = (i / sensorCount) * sensorSpread
        local rotation = CFrame.Angles(0, math.rad(angle), 0)
        local checkDir = (rootPart.CFrame * rotation).LookVector
        local hit = Workspace:Raycast(scanOrigin, checkDir * 12, rayParams)
        
        if not hit then
            local angleDiff = math.abs(math.acos(math.clamp(checkDir:Dot(dirToTarget), -1, 1)))
            if angleDiff < minAngleDiff then
                minAngleDiff = angleDiff
                bestDir = checkDir
            end
        end
    end
    return bestDir
end

local VoidRushController = {}
VoidRushController.Toggle = false
VoidRushController.IsActive = false
VoidRushController.Aimbot = false
VoidRushController.WallCheck = false
VoidRushController.OriginalDashSpeed = 60
VoidRushController.DefaultWalkSpeed = 16
VoidRushController.AimSpeed = 0.9
VoidRushController.SensorCount = 16
VoidRushController.SensorSpread = 360
VoidRushController.DashConnection = nil
VoidRushController.LogicConnection = nil
VoidRushController.AimbotConnection = nil

function VoidRushController:RotateTo(targetPart)
    local root = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
    local humanoid = playerCharacter and playerCharacter:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end
    
    -- FIX FLING: Nếu nhân vật đang bị game khóa vật lý (Animation kết liễu), dừng ngay việc ép CFrame
    local state = humanoid:GetState()
    if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.PlatformStanding then 
        return 
    end
    
    if self.WallCheck then
        local filterList = {playerCharacter}
        for _, s in ipairs(survivorsFolder:GetChildren()) do table.insert(filterList, s) end
        local bestDir = GetBestSteeringDir(root, targetPart.Position, self.SensorCount, self.SensorSpread, filterList)
        
        if bestDir then
            local steerCF = CFrame.lookAt(root.Position, root.Position + Vector3.new(bestDir.X, 0, bestDir.Z))
            root.CFrame = root.CFrame:Lerp(steerCF, self.AimSpeed * 0.8)
        else
            local targetCF = CFrame.lookAt(root.Position, Vector3.new(targetPart.Position.X, root.Position.Y, targetPart.Position.Z))
            root.CFrame = root.CFrame:Lerp(targetCF, self.AimSpeed)
        end
    else
        local lookAt = CFrame.lookAt(root.Position, Vector3.new(targetPart.Position.X, root.Position.Y, targetPart.Position.Z))
        root.CFrame = root.CFrame:Lerp(lookAt, self.AimSpeed)
    end
end

function VoidRushController:GetNearestSurvivor()
    local nearest = nil
    local minDist = math.huge
    local myRoot = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor ~= playerCharacter then
            local hrp = survivor:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - myRoot.Position).Magnitude
                if dist < minDist then minDist = dist nearest = survivor end
            end
        end
    end
    return nearest
end

function VoidRushController:Start()
    if self.IsActive then return end
    local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
    local rootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end
    self.IsActive = true
    self.DashConnection = RunService.RenderStepped:Connect(function()
        if not self.IsActive then return end
        humanoid.WalkSpeed = self.OriginalDashSpeed
        humanoid.AutoRotate = false
        local look = rootPart.CFrame.LookVector
        local dir = Vector3.new(look.X, 0, look.Z)
        if dir.Magnitude > 0 then humanoid:Move(dir.Unit, false) end
    end)
end

function VoidRushController:Stop()
    if not self.IsActive then return end
    self.IsActive = false
    if self.DashConnection then self.DashConnection:Disconnect() self.DashConnection = nil end
    local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.WalkSpeed = self.DefaultWalkSpeed humanoid.AutoRotate = true humanoid:Move(Vector3.zero, false) end
end

function VoidRushController:EnableLogic()
    self.LogicConnection = RunService.Heartbeat:Connect(function()
        if not self.Toggle then return end
        local noliKiller = nil
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:GetAttribute("Username") == localPlayer.Name and killer:GetAttribute("ActorDisplayName") == "Noli" then
                noliKiller = killer break
            end
        end
        if noliKiller then
            local state = noliKiller:GetAttribute("VoidRushState")
            if state == "Dashing" then self:Start() else self:Stop() end
        else self:Stop() end
    end)
    self.AimbotConnection = RunService.RenderStepped:Connect(function()
        if self.Aimbot and self.IsActive then
            local target = self:GetNearestSurvivor()
            if target and target:FindFirstChild("HumanoidRootPart") then self:RotateTo(target.HumanoidRootPart) end
        end
    end)
end

function VoidRushController:FullCleanup()
    self.Toggle = false self.Aimbot = false self.WallCheck = false self:Stop()
    if self.LogicConnection then self.LogicConnection:Disconnect() self.LogicConnection = nil end
    if self.AimbotConnection then self.AimbotConnection:Disconnect() self.AimbotConnection = nil end
end

TabHandles.Killers:Section({ Title = "Noli", Icon = "sparkles" })

TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Void_Rush_Controller",
    Desc = "hutaohub:Void_Rush_Controller_Desc",
    Flag = "Void Rush Controller",
    Value = false,
    Callback = function(s) 
        VoidRushController.Toggle = s 
        if s then 
            VoidRushController:EnableLogic() 
        else 
            VoidRushController:FullCleanup() 
        end 
    end 
})

TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Void_Rush_Aimbot",
    Desc = "hutaohub:Void_Rush_Aimbot_Desc",
    Flag = "Void Rush Aimbot",
    Value = false,
    Callback = function(s) VoidRushController.Aimbot = s end 
})

TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Void_Rush_Wall_Check",
    Desc = "hutaohub:Void_Rush_Wall_Check_Desc",
    Flag = "Void Rush Wall Check",
    Value = false,
    Callback = function(s) VoidRushController.WallCheck = s end 
})


local WALK_SPEED = 100
local AIM_RANGE = 120
local AIM_SPEED = 0.99
local SENSOR_COUNT = 16 
local SENSOR_SPREAD = 360 
local wallCheck = false
local enabled = false
local aimEnabled = false
local validValues = {Timeout = true, Collide = true, Hit = true}

local function attachResultWatcher(character, stopFlag)
    local function check(result) if result and result:IsA("StringValue") and validValues[result.Value] then stopFlag.value = true end end
    local result = character:FindFirstChild("Result") if result then check(result) end
    character.ChildAdded:Connect(function(child) if child.Name == "Result" then check(child) end end)
end

local function getNearestSurvivor()
    local myRoot = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local closestTarget = nil
    local closestDist = AIM_RANGE
    for _, char in ipairs(survivorsFolder:GetChildren()) do
        if char:IsA("Model") and char ~= playerCharacter then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local dist = (hrp.Position - myRoot.Position).Magnitude
                if dist < closestDist then closestDist = dist closestTarget = hrp end
            end
        end
    end
    return closestTarget
end

RunService.Heartbeat:Connect(function()
    if not enabled or not playerCharacter or playerCharacter.Name ~= "c00lkidd" then return end
    local rootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
    local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
    if not rootPart or not humanoid then return end
    local lv = rootPart:FindFirstChild("LinearVelocity")
    if not lv then return end
    local stopMovement = {value = false}
    attachResultWatcher(playerCharacter, stopMovement)
    lv.VectorVelocity = Vector3.new(math.huge, math.huge, math.huge)
    lv.Enabled = false
    if stopMovement.value then return end
    if aimEnabled then
        humanoid.AutoRotate = false
        local targetHRP = getNearestSurvivor()
        if targetHRP then
            if wallCheck then
                local filterList = {playerCharacter}
                for _, s in ipairs(survivorsFolder:GetChildren()) do table.insert(filterList, s) end
                local bestDir = GetBestSteeringDir(rootPart, targetHRP.Position, SENSOR_COUNT, SENSOR_SPREAD, filterList)
                if bestDir then
                    local targetCFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + Vector3.new(bestDir.X, 0, bestDir.Z))
                    rootPart.CFrame = rootPart.CFrame:Lerp(targetCFrame, AIM_SPEED * 0.8)
                else
                    local targetCF = CFrame.lookAt(rootPart.Position, Vector3.new(targetHRP.Position.X, rootPart.Position.Y, targetHRP.Position.Z))
                    rootPart.CFrame = rootPart.CFrame:Lerp(targetCF, AIM_SPEED)
                end
            else
                local targetCF = CFrame.lookAt(rootPart.Position, Vector3.new(targetHRP.Position.X, rootPart.Position.Y, targetHRP.Position.Z))
                rootPart.CFrame = rootPart.CFrame:Lerp(targetCF, AIM_SPEED)
            end
        end
    else humanoid.AutoRotate = true end
    local dir = rootPart.CFrame.LookVector
    dir = Vector3.new(dir.X, 0, dir.Z).Unit
    rootPart.AssemblyLinearVelocity = Vector3.new(dir.X * WALK_SPEED, rootPart.AssemblyLinearVelocity.Y, dir.Z * WALK_SPEED)
end)

TabHandles.Killers:Section({ Title = "c00lkidd", Icon = "flame" })

-- Toggle đầu tiên
TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Walkspeed_Override_Controller",
    Desc = "hutaohub:Walkspeed_Override_Controller_Desc",
    Flag = "Walkspeed Override Controller",
    Value = false,
    Callback = function(s) enabled = s end 
})

-- Toggle thứ hai
TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Walkspeed_Override_Aimbot",
    Desc = "hutaohub:Walkspeed_Override_Aimbot_Desc",
    Flag = "Walk Speed Override Aimbot",
    Value = false,
    Callback = function(s) aimEnabled = s end 
})

TabHandles.Killers:Toggle({ 
    Title = "hutaohub:Radar_360_Wall_Check",
    Desc = "hutaohub:Radar_360_Wall_Check_Desc",
    Flag = "Redar wall check",
    Value = false,
    Callback = function(s) wallCheck = s end 
})


TabHandles.Name:Section({
    Title = "You Name",
    Icon = "user-check"
})

local fakeName = ""
local enabled = false
local originalTexts = {}

local FakeNameThread = nil

local function getPlayerGui()
    return localPlayer:FindFirstChildOfClass("PlayerGui")
end

local function getTargetGuis()
    local pg = getPlayerGui()

    if not pg then
        return {}
    end

    local targets = {}

    local tempUI = pg:FindFirstChild("TemporaryUI", true)

    if tempUI then
        local playerInfo = tempUI:FindFirstChild("PlayerInfo", true)

        if playerInfo then
            table.insert(targets, playerInfo)
        end
    end

    local mainUI = pg:FindFirstChild("MainUI", true)

    if mainUI then
        local playerList = mainUI:FindFirstChild("PlayerListHolder", true)

        if playerList then
            table.insert(targets, playerList)
        end
    end

    return targets
end

local function applyToObject(obj)
    if not (
        obj:IsA("TextLabel")
        or obj:IsA("TextButton")
        or obj:IsA("TextBox")
    ) then
        return
    end

    local text = obj.Text

    if not text or text == "" then
        return
    end

    if not originalTexts[obj] then
        if string.find(text, localPlayer.Name) then
            originalTexts[obj] = text
        else
            return
        end
    end

    if enabled and fakeName ~= "" then
        obj.Text = string.gsub(
            originalTexts[obj],
            localPlayer.Name,
            fakeName
        )
    else
        obj.Text = originalTexts[obj]
    end
end

local function applyFakeName()
    for _, gui in ipairs(getTargetGuis()) do
        if gui.Name == "PlayerListHolder" then
            local label = gui:FindFirstChild("Username", true)

            if label then
                applyToObject(label)
            end
        else
            for _, obj in ipairs(gui:GetDescendants()) do
                applyToObject(obj)
            end
        end
    end
end

local function startFakeNameLoop()
    if FakeNameThread then
        return
    end

    FakeNameThread = task.spawn(function()
        while enabled do
            pcall(applyFakeName)
            task.wait(0.3)
        end

        FakeNameThread = nil
    end)
end

local function stopFakeNameLoop()
    enabled = false

    -- Restore text gốc
    for obj, text in pairs(originalTexts) do
        if obj and obj.Parent then
            obj.Text = text
        end
    end
end

TabHandles.Name:Input({
    Title = "hutaohub:Custom_Name",
    Desc = "hutaohub:Custom_Name_Desc",
    Flag = "Custom Name",
    Value = "",
    Placeholder = "Enter Fake Name",
    Callback = function(v)
        fakeName = tostring(v or "")

        if enabled then
            applyFakeName()
        end
    end
})

TabHandles.Name:Toggle({
    Title = "hutaohub:Fake_Name",
    Desc = "hutaohub:Fake_Name_Desc",
    Flag = "Fake Name",
    Value = false,
    Callback = function(state)
        enabled = state

        if state then
            startFakeNameLoop()
            applyFakeName()
        else
            stopFakeNameLoop()
        end
    end
})

-- Quản lý trạng thái cho Anti-Stun
local AntiStunState = {
    Active = false,
    Connection = nil,
    AnimationBlock = false,
    LastStun = false,
    ControlBlocked = false,
    MovementConnection = nil,
    HiddenGuis = {}
}

local BLOCK_ACTION_NAME = "hutaohub_BlockMovement"

-- Hàm tìm joystick/mobile controls
local function SetTouchControlsVisible(visible)
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")

    if not playerGui then
        return
    end

    for _, gui in ipairs(playerGui:GetDescendants()) do
        if gui:IsA("GuiObject") then
            local name = gui.Name:lower()

            -- Các tên joystick/control phổ biến Roblox
            if name:find("joystick")
            or name:find("thumbstick")
            or name:find("move")
            then
                if visible then
                    if AntiStunState.HiddenGuis[gui] ~= nil then
                        gui.Visible = AntiStunState.HiddenGuis[gui]
                    end
                else
                    AntiStunState.HiddenGuis[gui] = gui.Visible
                    gui.Visible = false
                end
            end
        end
    end
end

-- Hàm tạm thời vô hiệu input điều khiển
local function DisableCharacterControl(duration)
    if AntiStunState.ControlBlocked then
        return
    end

    AntiStunState.ControlBlocked = true

    local humanoid = playerCharacter and playerCharacter:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        AntiStunState.ControlBlocked = false
        return
    end

    -- Ẩn joystick/mobile controls
    SetTouchControlsVisible(false)

    -- Chặn toàn bộ movement input
    ContextActionService:BindAction(
        BLOCK_ACTION_NAME,
        function()
            return Enum.ContextActionResult.Sink
        end,
        false,
        Enum.PlayerActions.CharacterForward,
        Enum.PlayerActions.CharacterBackward,
        Enum.PlayerActions.CharacterLeft,
        Enum.PlayerActions.CharacterRight,
        Enum.PlayerActions.CharacterJump
    )

    -- Force đứng yên liên tục
    if AntiStunState.MovementConnection then
        AntiStunState.MovementConnection:Disconnect()
        AntiStunState.MovementConnection = nil
    end

    AntiStunState.MovementConnection = RunService.RenderStepped:Connect(function()
        if humanoid and humanoid.Parent then
            humanoid:Move(Vector3.zero, true)

            -- Reset velocity để chắc chắn đứng yên
            local rootPart = humanoid.RootPart

            if rootPart then
                rootPart.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end)

    task.delay(duration or 0.2, function()
        -- Cleanup movement force
        if AntiStunState.MovementConnection then
            AntiStunState.MovementConnection:Disconnect()
            AntiStunState.MovementConnection = nil
        end

        -- Mở lại input
        ContextActionService:UnbindAction(BLOCK_ACTION_NAME)

        -- Hiện lại joystick/mobile controls
        SetTouchControlsVisible(true)

        local currentHumanoid = playerCharacter and playerCharacter:FindFirstChildOfClass("Humanoid")

        if currentHumanoid then
            task.wait()

            -- Refresh movement state
            currentHumanoid:Move(currentHumanoid.MoveDirection, true)
        end

        AntiStunState.ControlBlocked = false
    end)
end

-- Hàm chặn animation stun tạm thời
local function BlockAnimations(character, duration)
    if AntiStunState.AnimationBlock then
        return
    end

    AntiStunState.AnimationBlock = true

    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        -- Stop toàn bộ animation hiện tại
        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end

        -- Force reset movement state
        DisableCharacterControl(0.1)
    end

    task.delay(duration or 0.1, function()
        AntiStunState.AnimationBlock = false
    end)
end

-- Hàm thực thi chính
local function ToggleAntiStun(enabled)
    AntiStunState.Active = enabled
    
    if enabled then
        if not AntiStunState.Connection then
            AntiStunState.Connection = RunService.Heartbeat:Connect(function()
                if not AntiStunState.Active then
                    return
                end
                
                local char = playerCharacter

                if not char then
                    return
                end

                local multipliers = char:FindFirstChild("SpeedMultipliers")

                if not multipliers then
                    return
                end
                    
                local stunned = multipliers:FindFirstChild("Stunned")

                local isStunned = stunned and stunned.Value < 1
                
                -- Trigger 1 lần mỗi lần bị stun
                if isStunned and not AntiStunState.LastStun then
                    -- Chặn animation stun
                    BlockAnimations(char, 0.1)

                    -- Xóa stun
                    stunned.Value = 1
                end

                AntiStunState.LastStun = isStunned
            end)
        end
    else
        -- Cleanup Heartbeat
        if AntiStunState.Connection then
            AntiStunState.Connection:Disconnect()
            AntiStunState.Connection = nil
        end

        -- Cleanup movement force
        if AntiStunState.MovementConnection then
            AntiStunState.MovementConnection:Disconnect()
            AntiStunState.MovementConnection = nil
        end

        -- Cleanup input block
        ContextActionService:UnbindAction(BLOCK_ACTION_NAME)

        -- Restore joystick
        SetTouchControlsVisible(true)

        -- Reset trạng thái
        AntiStunState.AnimationBlock = false
        AntiStunState.LastStun = false
        AntiStunState.ControlBlocked = false
    end
end

-- UI Setup
TabHandles.Player:Section({
    Title = "hutaohub:Anti_CC",
    Icon = "shield-alert"
})

TabHandles.Player:Toggle({
    Title = "hutaohub:Anti_Stun",
    Desc = "hutaohub:Anti_Stun_Desc",
    Flag = "Anti-Stun",
    Value = false,
    Callback = function(enabled)
        ToggleAntiStun(enabled)
    end
})

-- Character respawn support
localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

TabHandles.Player:Section({
    Title = "hutaohub:Stamina",
    Icon = "wind"
})

-- Module path
local StaminaModulePath = ReplicatedStorage
    :WaitForChild("Systems")
    :WaitForChild("Character")
    :WaitForChild("Game")
    :WaitForChild("Sprinting")

local StaminaModule
local originalMax, originalRegen, originalDrain

-- States
local settings = {
    InfStamina = false,

    Max = {
        Enabled = false,
        Value = 100
    },

    Regen = {
        Enabled = false,
        Value = 1
    },

    Drain = {
        Enabled = false,
        Value = 1
    }
}

-- Internal cache
local staminaLoopStarted = false
local forceDelay = 0.2
local lastForce = 0

-- Safe module loader
local function LoadStaminaModule()
    if StaminaModule then
        return true
    end

    local success, mod = pcall(require, StaminaModulePath)

    if success and mod then
        StaminaModule = mod

        originalMax = tonumber(mod.MaxStamina) or 100
        originalRegen = tonumber(mod.StaminaGain) or 1
        originalDrain = tonumber(mod.StaminaLoss) or 1

        return true
    end

    return false
end

-- Universal stamina setter
local function SetStamina(val)
    if not StaminaModule then
        return
    end

    val = tonumber(val) or 0

    pcall(function()
        if type(StaminaModule.SetStamina) == "function" then
            StaminaModule:SetStamina(val)

        elseif type(StaminaModule.UpdateStamina) == "function" then
            StaminaModule:UpdateStamina(val)

        elseif type(StaminaModule.ChangeStamina) == "function" then
            StaminaModule:ChangeStamina(val)

        else
            StaminaModule.Stamina = val
        end
    end)

    pcall(function()
        StaminaModule.Stamina = val
    end)
end

-- Get current stamina
local function GetCurrentStamina()
    if not StaminaModule then
        return 0
    end

    local current = tonumber(StaminaModule.Stamina)

    return current or 0
end

-- Apply stats safely
local function ApplyStats()
    if not LoadStaminaModule() then
        return
    end

    local maxValue = settings.Max.Enabled
        and settings.Max.Value
        or originalMax

    local regenValue = settings.Regen.Enabled
        and settings.Regen.Value
        or originalRegen

    local drainValue = settings.Drain.Enabled
        and settings.Drain.Value
        or originalDrain

    -- hard apply
    pcall(function()
        StaminaModule.MaxStamina = maxValue
    end)

    pcall(function()
        StaminaModule.StaminaGain = regenValue
    end)

    pcall(function()
        StaminaModule.StaminaLoss = drainValue
    end)

    -- lowercase support
    pcall(function()
        StaminaModule.maxStamina = maxValue
    end)

    pcall(function()
        StaminaModule.staminaGain = regenValue
    end)

    pcall(function()
        StaminaModule.staminaLoss = drainValue
    end)

    local current = GetCurrentStamina()

    -- only fix stamina stuck
    if settings.Max.Enabled then
        if current > maxValue then
            SetStamina(maxValue)

        elseif current <= originalMax and tick() - lastForce >= forceDelay then
            lastForce = tick()

            -- only force once when stuck at original max
            SetStamina(math.clamp(current, 0, maxValue))
        end
    end

    -- infinite stamina only when enabled
    if settings.InfStamina then
        if current < maxValue then
            SetStamina(maxValue)
        end
    end
end

-- Main loop
local function StartStaminaLoop()
    if staminaLoopStarted then
        return
    end

    staminaLoopStarted = true

    task.spawn(function()
        while true do
            task.wait(0.1)

            local ok = pcall(function()
                ApplyStats()
            end)

            if not ok then
                StaminaModule = nil
            end
        end
    end)
end

StartStaminaLoop()

-- Respawn reload support
localPlayer.CharacterAdded:Connect(function()
    task.wait(1)

    StaminaModule = nil

    if LoadStaminaModule() then
        ApplyStats()

        if settings.Max.Enabled then
            local current = GetCurrentStamina()

            if current < settings.Max.Value then
                SetStamina(settings.Max.Value)
            end
        end
    end
end)

-- UI

TabHandles.Player:Button({
    Title = "hutaohub:Full_Stamina",
    Desc = "hutaohub:Full_Stamina_Desc",

    Callback = function()
        if LoadStaminaModule() then
            local maxValue = settings.Max.Enabled
                and settings.Max.Value
                or (tonumber(StaminaModule.MaxStamina) or originalMax)

            SetStamina(maxValue)
        end
    end
})

TabHandles.Player:Toggle({
    Title = "hutaohub:Infinite_Stamina",
    Desc = "hutaohub:Infinite_Stamina_Desc",
    Flag = "Inf Stamina",

    Callback = function(v)
        settings.InfStamina = v

        if v and LoadStaminaModule() then
            local maxValue = settings.Max.Enabled
                and settings.Max.Value
                or (tonumber(StaminaModule.MaxStamina) or originalMax)

            SetStamina(maxValue)
        end
    end
})

-- Max Stamina

TabHandles.Player:Input({
    Title = "hutaohub:Max_Stamina_Value",
    Desc = "hutaohub:Max_Stamina_Value_Desc",
    Flag = "Max Stamina Value",
    Placeholder = "100",
    Value = 100,
    Numeric = true,

    Callback = function(txt)
        local num = tonumber(txt)

        if not num then
            num = 100
        end

        num = math.clamp(num, 1, 999999)

        settings.Max.Value = num

        if settings.Max.Enabled then
            ApplyStats()
        end
    end
})

TabHandles.Player:Toggle({
    Title = "hutaohub:Apply_Max_Stamina",
    Desc = "hutaohub:Apply_Max_Stamina_Desc",
    Flag = "Apply Max Stamina",

    Callback = function(v)
        settings.Max.Enabled = v

        ApplyStats()

        if v then
            local current = GetCurrentStamina()

            if current < settings.Max.Value then
                SetStamina(settings.Max.Value)
            end
        else
            SetStamina(originalMax)

            pcall(function()
                StaminaModule.MaxStamina = originalMax
                StaminaModule.maxStamina = originalMax
            end)
        end
    end
})

-- Regen

TabHandles.Player:Input({
    Title = "hutaohub:Regen_Value",
    Desc = "hutaohub:Regen_Value_Desc",
    Flag = "Regen Value",
    Placeholder = "1",
    Value = 1,
    Numeric = true,

    Callback = function(txt)
        local num = tonumber(txt)

        if not num then
            num = 1
        end

        settings.Regen.Value = num

        if settings.Regen.Enabled then
            ApplyStats()
        end
    end
})

TabHandles.Player:Toggle({
    Title = "hutaohub:Apply_Regen",
    Desc = "hutaohub:Apply_Regen_Desc",
    Flag = "Apply Regen",

    Callback = function(v)
        settings.Regen.Enabled = v

        ApplyStats()

        if not v and StaminaModule then
            pcall(function()
                StaminaModule.StaminaGain = originalRegen
                StaminaModule.staminaGain = originalRegen
            end)
        end
    end
})

-- Drain

TabHandles.Player:Input({
    Title = "hutaohub:Drain_Value",
    Desc = "hutaohub:Drain_Value_Desc",
    Flag = "Drain Value",
    Placeholder = "1",
    Value = 1,
    Numeric = true,

    Callback = function(txt)
        local num = tonumber(txt)

        if not num then
            num = 1
        end

        settings.Drain.Value = num

        if settings.Drain.Enabled then
            ApplyStats()
        end
    end
})

TabHandles.Player:Toggle({
    Title = "hutaohub:Apply_Drain",
    Desc = "hutaohub:Apply_Drain_Desc",
    Flag = "Apply Drain",

    Callback = function(v)
        settings.Drain.Enabled = v

        ApplyStats()

        if not v and StaminaModule then
            pcall(function()
                StaminaModule.StaminaLoss = originalDrain
                StaminaModule.staminaLoss = originalDrain
            end)
        end
    end
})

local genFolder = nil
-- ==========================================
-- MAIN ESP SYSTEM CONFIGURATION
-- ==========================================
local ESP = {
    System = {
        Enabled = {},
        Objects = {},
        Connections = {},
        UpdateLoop = nil,
        GlobalScanLoop = nil,
        LogicScanLoop = nil, 
        LastUpdate = 0
    },
    ConfigsMap = {},

    Config = {
        FONT_SIZE = 12,
        HEARTBEAT_RATE = 0.1,
        DISTANCE_RATE = 0.1,
        GENERATOR_DUPLICATE_RADIUS = 10,
        CLONE_IGNORE_POSITION = Vector3.new(-3552.90, 11.88, 267.95),
        CLONE_IGNORE_RADIUS = 500
    },

    Names = {
        Survivors = {
            Eliot = true, Shedletsky = true, Chance = true, ["007n7"] = true,
            Builderman = true, Veeronica = true, JaneDoe = true, Taph = true,
            Guest1337 = true, TwoTime = true, Noob = true, Dusekkar = true
        },
        Killers = {
            Slasher = true, c00lkidd = true, Noli = true, ["1x1x1x1"] = true,
            ["John Doe"] = true, Sixer = true, Nosferatu = true
        }
    },

    Utils = {},
    Validators = {}
}

local ESPSystem = ESP.System
local ESPUtils = ESP.Utils
local ESPValidators = ESP.Validators
local ESPConfig = ESP.Config

local EXCLUDED_NPC_KEYWORDS = {
    "taphtripwire",
    "subspacetripmine",
    "buildermandispenser",
    "buildermansentry",
    "pray"
}

local EXCLUDED_MODELS = {
    ["rig"] = true,
    ["bowrig"] = true,
}

-- ==========================================
-- UTILS FUNCTIONS
-- ==========================================
function ESPUtils.getCharacter()
    return localPlayer.Character
end

function ESPUtils.getRoot(model)
    if not model then return nil end
    if model:IsA("BasePart") then return model end

    return model.PrimaryPart
        or model:FindFirstChild("HumanoidRootPart")
        or model:FindFirstChildWhichIsA("BasePart")
end

function ESPUtils.getHumanoid(model)
    if not model then return nil end
    return model:FindFirstChildWhichIsA("Humanoid")
end

function ESPUtils.isAlive(model)
    local h = ESPUtils.getHumanoid(model)
    return h and h.Health > 0
end

function ESPUtils.isLocalCharacter(model)
    local character = ESPUtils.getCharacter()
    if not character or not model then return false end

    return model == character
        or model:IsDescendantOf(character)
        or character:IsDescendantOf(model)
end

local CachedRoot

RunService.Heartbeat:Connect(function()
    local char = ESPUtils.getCharacter()
    CachedRoot = char and ESPUtils.getRoot(char)
end)

function ESPUtils.getDistance(part)
    if not CachedRoot or not part then
        return 0
    end
    return math.floor((CachedRoot.Position - part.Position).Magnitude)
end

function ESPUtils.isSurvivor(obj)
    return obj
        and obj:IsA("Model")
        and (
            ESP.Names.Survivors[obj.Name]
            or (survivorsFolder and obj:IsDescendantOf(survivorsFolder))
            or obj.Parent == survivorsFolder
        )
end

function ESPUtils.isKiller(obj)
    return obj
        and obj:IsA("Model")
        and (
            ESP.Names.Killers[obj.Name]
            or (killersFolder and obj:IsDescendantOf(killersFolder))
            or obj.Parent == killersFolder
        )
end

function ESPUtils.isIgnoredClonePosition(root)
    if not root then return false end
    return (root.Position - ESPConfig.CLONE_IGNORE_POSITION).Magnitude <= ESPConfig.CLONE_IGNORE_RADIUS
end

function ESPUtils.isExcluded(name)
    local lower = name:lower()
    for _, keyword in ipairs(EXCLUDED_NPC_KEYWORDS) do
        if lower:find(keyword) then
            return true
        end
    end
    return false
end

function ESPUtils.getModelVolume(model)
    local minPos, maxPos

    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("BasePart") then
            local pos = v.Position
            if not minPos then
                minPos = pos
                maxPos = pos
            else
                minPos = Vector3.new(
                    math.min(minPos.X, pos.X),
                    math.min(minPos.Y, pos.Y),
                    math.min(minPos.Z, pos.Z)
                )
                maxPos = Vector3.new(
                    math.max(maxPos.X, pos.X),
                    math.max(maxPos.Y, pos.Y),
                    math.max(maxPos.Z, pos.Z)
                )
            end
        end
    end

    if not minPos or not maxPos then return 0 end
    local size = maxPos - minPos
    return size.X * size.Y * size.Z
end

local function removeESP(id, object)
    local cache = ESPSystem.Objects[id]
    if not cache then return end

    local data = cache[object]
    if not data then return end

    if data.Connections then
        for _, connection in ipairs(data.Connections) do
            pcall(function() connection:Disconnect() end)
        end
    end

    cache[object] = nil

    if data.Highlight then pcall(function() data.Highlight:Destroy() end) end
    if data.Billboard then pcall(function() data.Billboard:Destroy() end) end
end

local function cleanupEmptyESP()
    for id, objects in pairs(ESPSystem.Objects) do
        for object in pairs(objects) do
            if typeof(object) ~= "Instance" or object.Parent == nil then
                objects[object] = nil
            end
        end
    end
end

local function createProtectedHighlight(object, color, transparency)
    local h = Instance.new("Highlight")
    h.Name = "HutaoESPHighlight"
    h.FillColor = color
    h.OutlineColor = Color3.new(1,1,1)
    h.FillTransparency = transparency or 0.5
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Adornee = object
    h.Enabled = true
    h.Parent = CoreGui
    return h
end

local function createProtectedBillboard(root, color)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "HutaoESP"
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0
    billboard.ResetOnSpawn = false
    billboard.MaxDistance = math.huge
    billboard.Size = UDim2.new(0, 220, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Adornee = root

    local text = Instance.new("TextLabel")
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(1,0,1,0)
    text.Font = Enum.Font.GothamBold
    text.TextColor3 = color
    text.TextStrokeTransparency = 0
    text.TextStrokeColor3 = Color3.new(0,0,0)
    text.TextSize = ESPConfig.FONT_SIZE
    text.TextScaled = false
    text.RichText = false
    text.Parent = billboard

    billboard.Parent = CoreGui
    return billboard, text
end

local function createESP(id, object, config)
    if not ESPSystem.Enabled[id] then return end
    if not object or not object.Parent or ESPUtils.isLocalCharacter(object) then return end

    ESPSystem.Objects[id] = ESPSystem.Objects[id] or {}
    local cache = ESPSystem.Objects[id]
    if cache and cache[object] then
        return
    end

    local root = ESPUtils.getRoot(object)
    if not root then return end

    local billboard, text = createProtectedBillboard(root, config.Color)
    local highlight = createProtectedHighlight(object, config.Color, config.FillTransparency)

    local data = {
        Object = object,
        Billboard = billboard,
        Text = text,
        Highlight = highlight,
        Config = config,
        CachedText = "",
        Volume = ESPUtils.getModelVolume(object),
        LastDistanceUpdate = 0,
        Connections = {}
    }

    table.insert(data.Connections, object.AncestryChanged:Connect(function(_, parent)
        if not parent then removeESP(id, object) end
    end))

    table.insert(data.Connections, billboard.AncestryChanged:Connect(function(_, parent)
        if not parent and object.Parent and ESPSystem.Objects[id][object] then
            billboard.Parent = CoreGui
        end
    end))

    table.insert(data.Connections, data.Highlight.AncestryChanged:Connect(function(_, parent)
        if not parent and object.Parent and ESPSystem.Objects[id][object] then
            data.Highlight = createProtectedHighlight(object, config.Color, config.FillTransparency)
            data.Highlight.Enabled = ESPSystem.Enabled[id] or false
        end
    end))

    ESPSystem.Objects[id][object] = data
end

local function validateAndCreate(id, obj, config)
    if not ESPSystem.Enabled[id] then return end
    if not obj or not obj.Parent or ESPUtils.isLocalCharacter(obj) then return end

    if obj:IsA("Model") then
        local name = obj.Name:lower()
        if EXCLUDED_MODELS[name] then return end
    end

    local success, valid = pcall(config.Validator, obj)
    if success and valid then
        createESP(id, obj, config)
    end
end

-- ==========================================
-- HỆ THỐNG VÒNG LẶP TỔNG (GLOBAL SCAN LOOP)
-- ==========================================
if ESPSystem.GlobalScanLoop then task.cancel(ESPSystem.GlobalScanLoop) end
ESPSystem.GlobalScanLoop = task.spawn(function()
    while true do
        task.wait(10)
        local descendants = Workspace:GetDescendants()
        for i = 1, #descendants do
            local obj = descendants[i]
            if obj:IsA("Model") or obj:IsA("Tool") then
                for id, config in pairs(ESP.ConfigsMap) do
                    if id == "Item" then continue end
                    if ESPSystem.Enabled[id] then
                       validateAndCreate(id, obj, config)
                    end
                end
            end
            if i % 500 == 0 then task.wait() end
        end
    end
end)

Workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Tool") then
        local itemRoot = obj:FindFirstChild("ItemRoot")
        if itemRoot and itemRoot:FindFirstChild("ProximityPrompt") and ESPSystem.Enabled["Item"] then
            local itemConfig = ESP.ConfigsMap["Item"]
            if itemConfig then validateAndCreate("Item", obj, itemConfig) end
        end
        return
    end

    if not obj:IsA("Model") then return end

    task.defer(function()
        if not obj.Parent then return end
        for id, config in pairs(ESP.ConfigsMap) do
            if id == "Item" then continue end
            if ESPSystem.Enabled[id] then
                validateAndCreate(id, obj, config)
            end
        end
    end)
end)

Workspace.DescendantRemoving:Connect(function(obj)
    for id in pairs(ESPSystem.Objects) do
        removeESP(id, obj)
    end
end)

local function registerESP(config)
    local id = config.Id
    ESP.ConfigsMap[id] = config
    ESPSystem.Objects[id] = ESPSystem.Objects[id] or {}

    if config.WatchFolder then
        table.insert(ESPSystem.Connections, config.WatchFolder.ChildAdded:Connect(function(obj)
            task.defer(function() validateAndCreate(id, obj, config) end)
        end))
    end

    -- ĐÃ FIX BOMB: Lỗi thiếu 'else' và thừa 'end' làm bể ngoặc UI
    TabHandles.Visual:Toggle({
        Title = config.Title,
        Desc = config.Desc,
        Flag = "ESP_" .. id,
        Locked = false,
        Value = false,
        Callback = function(state)
            ESPSystem.Enabled[id] = state

            if state then
                task.spawn(function()
                    if id == "Item" and config.WatchFolder then
                        local descendants = config.WatchFolder:GetDescendants()
                        for _, obj in ipairs(descendants) do
                            if obj:IsA("Tool") then
                                validateAndCreate(id, obj, config)
                            end
                        end
                    else
                        local descendants = Workspace:GetDescendants()
                        for i, obj in ipairs(descendants) do
                            if obj:IsA("Model") or obj:IsA("Tool") then
                                validateAndCreate(id, obj, config)
                            end
                            if i % 1000 == 0 then task.wait() end
                        end
                        if config.WatchFolder then
                            for _, obj in ipairs(config.WatchFolder:GetChildren()) do
                                validateAndCreate(id, obj, config)
                            end
                        end
                    end
                end)
            else
                -- FIX: Thêm Else đàng hoàng để tắt ESP thay vì rớt ra ngoài hàm
                if ESPSystem.Objects[id] then
                    for obj, data in pairs(ESPSystem.Objects[id]) do
                        if data.Highlight and data.Highlight.Enabled then data.Highlight.Enabled = false end
                        if data.Billboard and data.Billboard.Enabled then data.Billboard.Enabled = false end
                    end
                end
            end
        end
    })
end

if ESPSystem.LogicScanLoop then task.cancel(ESPSystem.LogicScanLoop) end
local cleanupTick = 0

ESPSystem.LogicScanLoop = task.spawn(function()
    while true do
        task.wait(1) 
        
        cleanupTick += 1
        if cleanupTick >= 20 then
           cleanupTick = 0
           cleanupEmptyESP()
        end
        
        for id, objects in pairs(ESPSystem.Objects) do
            local isEnabled = ESPSystem.Enabled[id]
            if not isEnabled then continue end

            for object, data in pairs(objects) do
                if not object or not object.Parent or ESPUtils.isLocalCharacter(object) then
                    removeESP(id, object)
                    continue
                end

                if object.Name == "Rig" then
                    removeESP(id, object)
                    continue
                end

                if ESPUtils.isExcluded(object.Name) then
                    local special = (id == "Trap" or id == "Sentry" or id == "Dispenser" or id == "Subspace" or id == "JohnDoeTrap")
                    if not special then
                        removeESP(id, object)
                        continue
                    end
                end

                local root = ESPUtils.getRoot(object)
                if not root or not root.Parent then
                    removeESP(id, object)
                    continue
                end

                if id == "Clone" then
                    local h = ESPUtils.getHumanoid(object)
                    if not h or h.Health <= 0 or ESPUtils.isSurvivor(object) or ESPUtils.isKiller(object) or ESPUtils.isIgnoredClonePosition(root) then
                        removeESP(id, object)
                        continue
                    end
                end

                if data.Config.Living and not ESPUtils.isAlive(object) then
                    removeESP(id, object)
                    continue
                end

                if data.Config.Generator then
                    local p = object:FindFirstChild("Progress", true)
                    if p and p:IsA("NumberValue") and p.Value >= 100 then
                        removeESP(id, object)
                        continue
                    end

                    local myRoot = root
                    for otherObject, otherData in pairs(objects) do
                        if otherObject ~= object and otherData and otherData.Config and otherData.Config.Generator then
                            local otherRoot = ESPUtils.getRoot(otherObject)
                            if otherRoot then
                                local magnitude = (myRoot.Position - otherRoot.Position).Magnitude
                                if magnitude <= ESPConfig.GENERATOR_DUPLICATE_RADIUS then
                                    local myY = myRoot.Position.Y
                                    local otherY = otherRoot.Position.Y

                                    if myY < otherY then
                                        removeESP(id, object)
                                        break
                                    elseif math.abs(myY - otherY) <= 2 then
                                        if data.Volume < (otherData.Volume or 0) then
                                            removeESP(id, object)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                if data.Config.Item then
                  local itemRoot = object:FindFirstChild("ItemRoot")
                  if not object.Parent or not itemRoot or not itemRoot:FindFirstChild("ProximityPrompt") then
                   removeESP(id, object)
                   continue
                  end
                end
            end
        end
    end
end)

-- ==========================================
-- LUỒNG RENDER UI BẰNG HEARTBEAT SIÊU NHẸ
-- ==========================================
if ESPSystem.UpdateLoop then ESPSystem.UpdateLoop:Disconnect() end
ESPSystem.UpdateLoop = RunService.Heartbeat:Connect(function(delta)
    ESPSystem.LastUpdate += delta
    if ESPSystem.LastUpdate < ESPConfig.HEARTBEAT_RATE then return end
    ESPSystem.LastUpdate = 0

    local now = tick()
    for id, objects in pairs(ESPSystem.Objects) do
        if not ESPSystem.Enabled[id] then continue end

        for object, data in pairs(objects) do
            local root = ESPUtils.getRoot(object)
            if not root then continue end

            local dist = ESPUtils.getDistance(root)
            local withinRange = (dist <= 500)

            -- ĐÃ FIX BOMB: Đóng mở If cho LastProtectionCheck cẩn thận, không nuốt code ở dưới
            if now - (data.LastProtectionCheck or 0) >= 2 then
                data.LastProtectionCheck = now
                if not data.Highlight or not data.Highlight.Parent then
                   data.Highlight = createProtectedHighlight(object, data.Config.Color, data.Config.FillTransparency)
                end
                if not data.Billboard or not data.Billboard.Parent then
                   data.Billboard, data.Text = createProtectedBillboard(root, data.Config.Color)
                end
            end

            if data.Highlight.Adornee ~= object then data.Highlight.Adornee = object end
            if data.Highlight.Enabled ~= withinRange then data.Highlight.Enabled = withinRange end
            
            if data.Billboard.Adornee ~= root then data.Billboard.Adornee = root end
            if data.Billboard.Enabled ~= withinRange then data.Billboard.Enabled = withinRange end

            if withinRange and (now - data.LastDistanceUpdate >= ESPConfig.DISTANCE_RATE) then
                data.LastDistanceUpdate = now
                local text

                if id == "JohnDoeTrap" then
                    text = "Digital Trap [" .. dist .. "m]"
                else
                    if data.Config.ShowHealth then
                        local h = ESPUtils.getHumanoid(object)
                        if h then
                            text = string.format("%s [%sm] [HP : %d/%d]", object.Name, dist, math.floor(h.Health), math.floor(h.MaxHealth))
                        else
                            text = string.format("%s [%sm]", object.Name, dist)
                        end
                    else
                        text = string.format("%s [%sm]", object.Name, dist)
                    end
                end

                if data.CachedText ~= text then
                    data.CachedText = text
                    if data.Text then data.Text.Text = text end
                end
            end
        end
    end
end)

-- ==========================================
-- BỘ VALIDATOR (GIỮ NGUYÊN 100% - DỌN RÁC BIẾN)
-- ==========================================
function ESPValidators.Clone(obj)
    if not obj or not obj:IsA("Model") or ESPUtils.isLocalCharacter(obj) then return false end
    if ESPUtils.isExcluded(obj.Name) then return false end
    
    if obj.Name == "Rig" then return false end
    if ESPUtils.isSurvivor(obj) or ESPUtils.isKiller(obj) then return false end

    local h = ESPUtils.getHumanoid(obj)
    local root = ESPUtils.getRoot(obj)

    return h and h.Health > 0 and root and not ESPUtils.isIgnoredClonePosition(root)
end

function ESPValidators.Model(obj)
    return obj and obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.Survivor(obj)
    local h = ESPUtils.getHumanoid(obj)
    return obj and obj:IsA("Model") and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj) and h and h.Health > 0 and ESPUtils.isSurvivor(obj)
end

function ESPValidators.Killer(obj)
    local h = ESPUtils.getHumanoid(obj)
    return obj and obj:IsA("Model") and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj) and h and h.Health > 0 and ESPUtils.isKiller(obj)
end

function ESPValidators.Generator(obj)
    if not obj or not obj:IsA("Model") then return false end
    if obj.Name ~= "Generator" then return false end

    local mapContainer = Workspace:FindFirstChild("Map")
    local ingame = mapContainer and mapContainer:FindFirstChild("Ingame")
    local map = ingame and ingame:FindFirstChild("Map")
    
    if not map or not obj:IsDescendantOf(map) then return false end

    local root = ESPUtils.getRoot(obj)
    if not root then return false end

    local parent = obj.Parent
    if parent and parent:IsA("Model") and parent.Name:lower():find("generator") then return false end

    local p = obj:FindFirstChild("Progress", true)
    if p and p:IsA("NumberValue") and p.Value >= 100 then return false end

    local myVolume = ESPUtils.getModelVolume(obj)

    for _, other in ipairs(map:GetChildren()) do
        if other ~= obj and other:IsA("Model") and other.Name:lower():find("generator") then
            local otherRoot = ESPUtils.getRoot(other)
            if otherRoot then
                local magnitude = (root.Position - otherRoot.Position).Magnitude
                if magnitude <= ESPConfig.GENERATOR_DUPLICATE_RADIUS then
                    local otherVolume = ESPUtils.getModelVolume(other)
                    if otherVolume > myVolume then return false end
                end
            end
        end
    end
    return true
end

function ESPValidators.Item(obj)
    if not obj or not obj:IsA("Tool") then return false end
    local itemRoot = obj:FindFirstChild("ItemRoot")
    if not itemRoot or not itemRoot:FindFirstChild("ProximityPrompt") then return false end
    return true
end

function ESPValidators.Dispenser(obj)
    return obj and obj:IsA("Model") and obj.Name:lower():find("dispenser") and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.Sentry(obj)
    return obj and obj:IsA("Model") and obj.Name:lower():find("sentry") and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.Trap(obj)
    return obj and obj:IsA("Model") and obj.Name:find("TaphTripwire") and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.Subspace(obj)
    return obj and obj:IsA("Model") and obj.Name == "SubspaceTripmine" and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.JohnDoeTrap(obj)
    local n = obj.Name:lower()
    return obj and (n == "shadow" or n:find("shadow")) and not ESPUtils.isLocalCharacter(obj) and ESPUtils.getRoot(obj)
end

function ESPValidators.FakeGenerator(obj)
    if not obj or not obj:IsA("Model") then return false end
    if obj.Name ~= "FakeGenerator" then return false end

    local mapContainer = Workspace:FindFirstChild("Map")
    local ingame = mapContainer and mapContainer:FindFirstChild("Ingame")
    local map = ingame and ingame:FindFirstChild("Map")

    return map and obj:IsDescendantOf(map) and ESPUtils.getRoot(obj)
end

-- ==========================================
-- ĐĂNG KÝ GIAO DIỆN
-- ==========================================
TabHandles.Visual:Section({ Title = "Clone", Icon = "copy" })
registerESP({
    Id = "Clone",
    Title = "hutaohub:Clone_ESP",
    Desc = "hutaohub:Clone_ESP_Desc",
    Color = Color3.fromRGB(0,255,0),
    ShowHealth = true,
    Living = true,
    WorkspaceOnly = true,
    Validator = ESPValidators.Clone
})

TabHandles.Visual:Section({ Title = "Model", Icon = "box" })
registerESP({
    Id = "Model",
    Title = "hutaohub:Model_ESP",
    Desc = "hutaohub:Model_ESP_Desc",
    Color = Color3.fromRGB(255,170,0),
    Validator = ESPValidators.Model
})

TabHandles.Visual:Section({ Title = "Player", Icon = "user" })
registerESP({
    Id = "Survivor",
    Title = "hutaohub:Survivors_ESP",
    Desc = "hutaohub:Survivors_ESP_Desc",
    Color = Color3.fromRGB(255,255,255),
    ShowHealth = true,
    Living = true,
    WatchFolder = survivorsFolder,
    WorkspaceOnly = true,
    Validator = ESPValidators.Survivor
})

registerESP({
    Id = "Killer",
    Title = "hutaohub:Killers_ESP",
    Desc = "hutaohub:Killers_ESP_Desc",
    Color = Color3.fromRGB(255,0,0),
    ShowHealth = true,
    Living = true,
    WatchFolder = killersFolder,
    WorkspaceOnly = true,
    Validator = ESPValidators.Killer
})

TabHandles.Visual:Section({ Title = "Other", Icon = "layers" })
local mapContainer = Workspace:FindFirstChild("Map")
local ingame = mapContainer and mapContainer:FindFirstChild("Ingame")
local map = ingame and ingame:FindFirstChild("Map")

registerESP({
    Id = "Generator",
    Title = "hutaohub:Generator_ESP",
    Desc = "hutaohub:Generator_ESP_Desc",
    Color = Color3.fromRGB(0,255,255),
    Generator = true,
    WatchFolder = map,
    WorkspaceOnly = not genFolder,
    Validator = ESPValidators.Generator
})

registerESP({
    Id = "FakeGenerator",
    Title = "hutaohub:FakeGenerator_ESP",
    Desc = "hutaohub:FakeGenerator_ESP_Desc",
    Color = Color3.fromRGB(170, 0, 255),
    WatchFolder = map,
    Validator = ESPValidators.FakeGenerator
})

registerESP({
    Id = "Item",
    Title = "hutaohub:Items_ESP",
    Desc = "hutaohub:Items_ESP_Desc",
    Color = Color3.fromRGB(255,215,0),
    Item = true,
    WatchFolder = map,
    Validator = ESPValidators.Item
})

TabHandles.Visual:Section({ Title = "Builderman", Icon = "pen-tool" })
registerESP({
    Id = "Dispenser",
    Title = "hutaohub:Dispenser_ESP",
    Desc = "hutaohub:Dispenser_ESP_Desc",
    Color = Color3.fromRGB(0,162,255),
    Validator = ESPValidators.Dispenser
})

registerESP({
    Id = "Sentry",
    Title = "hutaohub:Sentry_ESP",
    Desc = "hutaohub:Sentry_ESP_Desc",
    Color = Color3.fromRGB(128,128,128),
    Validator = ESPValidators.Sentry
})

TabHandles.Visual:Section({ Title = "Trap / Tapt", Icon = "triangle-alert" })
registerESP({
    Id = "Trap",
    Title = "hutaohub:Tripwire_ESP",
    Desc = "hutaohub:Tripwire_ESP_Desc",
    Color = Color3.fromRGB(255,85,0),
    Validator = ESPValidators.Trap
})

registerESP({
    Id = "Subspace",
    Title = "hutaohub:Subspace_ESP",
    Desc = "hutaohub:Subspace_ESP_Desc",
    Color = Color3.fromRGB(160,32,240),
    Validator = ESPValidators.Subspace
})

TabHandles.Visual:Section({ Title = "John Doe", Icon = "donut" })
registerESP({
    Id = "JohnDoeTrap",
    Title = "hutaohub:Digital_Trap_ESP",
    Desc = "hutaohub:Digital_Trap_ESP_Desc",
    Color = Color3.fromRGB(255,0,0),
    FillTransparency = 0.2,
    Validator = ESPValidators.JohnDoeTrap
})

local function ServerHop()
    local placeId = game.PlaceId
    print("[ServerHop] Đang rời server hiện tại...")

    local success, err = pcall(function()
        TeleportService:Teleport(placeId, localPlayer)
    end)

    if success then
        WindUI:Notify({
            Title = "hutaohub:Rejoin_Starting",
            Content = "hutaohub:Rejoin_Starting_Content1",
            Duration = 3,
            Icon = "info"
        })
    else
        warn("[ServerHop] Lỗi khi Teleport:", err)
        WindUI:Notify({
            Title = "hutaohub:Teleport_Error",
            Content = tostring(err),
            Duration = 4,
            Icon = "alert"
        })
    end
end

TabHandles.Misc:Button({
    Title = "hutaohub:Rejoin_To_Fix_Lag",
    Desc = "hutaohub:Rejoin_To_Fix_Lag_Desc",
    Callback = function()
        WindUI:Notify({
            Title = "hutaohub:Rejoin_Settings",
            Content = "hutaohub:Rejoin_Settings_Content2",
            Duration = 2,
            Icon = "info"
        })

        task.wait(0.3)
        ServerHop()
    end
})

TabHandles.Misc:Section({
    Title = "hutaohub:Camera",
    Icon = "camera"
})

local MiscState = {
    FullBright = false,
    Fog = false,
    InfiniteZoom = false,
    AntiSlow = false,
    ShowChat = false,
    RemoveNPCNoli = false,
    AntiAFK = false
}

local DEFAULT_CAMERA = {
    Max = 128,
    Min = 0.5
}

local EFFECT_NAMES = {
    BlurEffect = true,
    ColorCorrectionEffect = true,
    BloomEffect = true,
    SunRaysEffect = true,
    DepthOfFieldEffect = true,
    ScreenFlash = true,
    HitEffect = true,
    DamageOverlay = true,
    BloodEffect = true,
    Vignette = true,
    BlackScreen = true,
    WhiteScreen = true,
    ShockEffect = true,
    Darkness = true,
    JumpScare = true,
    LowHealthOverlay = true,
    Flashbang = true,
    FadeEffect = true
}

local EFFECT_CLASSES = {
    BlurEffect = true,
    BloomEffect = true,
    SunRaysEffect = true,
    DepthOfFieldEffect = true,
    ColorCorrectionEffect = true
}

local AntiSlowConfigs = {
    {
        "SlowedStatus"
    },
    {
        "StunningKiller",
        "EatFriedChicken",
        "GuestBlocking",
        "PunchAbility",
        "SubspaceTripmine",
        "TaphTripwire",
        "PlasmaBeam",
        "SpawnProtection",
        "c00lgui",
        "ShootingGun",
        "TwoTimeStab",
        "TwoTimeCrouching",
        "DrinkingCola",
        "DrinkingSlateskin",
        "SlateskinStatus",
        "EatingGhostburger"
    },
    {
        "BloxyColaItem",
        "Medkit"
    },
    {
        "Emoting"
    },
    {
        "DispenserConstruction",
        "SentryConstruction"
    }
}

local EffectConnections = {}
local antiAFKCons = {}
local antiAFKConnection

local TextChatService = game:GetService("TextChatService")
local chatWindow = TextChatService:FindFirstChild("ChatWindowConfiguration")

local function ApplyVisuals()
    if MiscState.FullBright then
        Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        Lighting.Brightness = 4
        Lighting.GlobalShadows = false
    end

    if MiscState.Fog then
        Lighting.FogStart = 0
        Lighting.FogEnd = 999999

        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

        if atmosphere then
            atmosphere.Density = 0
            atmosphere.Haze = 0
        end
    end

    if MiscState.InfiniteZoom then
        localPlayer.CameraMaxZoomDistance = math.huge
        localPlayer.CameraMinZoomDistance = DEFAULT_CAMERA.Min
    end
end

local function ResetFullBright()
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
    Lighting.Brightness = 1
    Lighting.GlobalShadows = true
end

local function ResetFog()
    Lighting.FogStart = 200
    Lighting.FogEnd = 1000

    local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

    if atmosphere then
        atmosphere.Density = 0.3
        atmosphere.Haze = 0.5
    end
end

local function ResetZoom()
    localPlayer.CameraMaxZoomDistance = DEFAULT_CAMERA.Max
    localPlayer.CameraMinZoomDistance = DEFAULT_CAMERA.Min
end

task.spawn(function()
    while true do
        if MiscState.FullBright
        or MiscState.Fog
        or MiscState.InfiniteZoom then
            ApplyVisuals()
        end

        if MiscState.AntiSlow and playerCharacter then
            local speedFolder = playerCharacter:FindFirstChild("SpeedMultipliers")

            if speedFolder then
                for _, group in ipairs(AntiSlowConfigs) do
                    for i = 1, #group do
                        local obj = speedFolder:FindFirstChild(group[i])

                        if obj
                        and obj:IsA("NumberValue")
                        and obj.Value ~= 1 then
                            obj.Value = 1
                        end
                    end
                end
            end

            local pg = localPlayer:FindFirstChild("PlayerGui")

            if pg then
                local mainUI = pg:FindFirstChild("MainUI")

                if mainUI then
                    local status = mainUI:FindFirstChild("StatusContainer")

                    if status then
                        local slowUI = status:FindFirstChild("Slowness")

                        if slowUI then
                            slowUI.Visible = false
                        end
                    end
                end
            end
        end

        if MiscState.RemoveNPCNoli then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Model")
                and v.Name == "Noli"
                and not Players:GetPlayerFromCharacter(v) then

                    local hum = v:FindFirstChildOfClass("Humanoid")

                    if hum then
                        pcall(v.Destroy, v)
                    end
                end
            end
        end

        task.wait(0.5)
    end
end)

TabHandles.Misc:Toggle({
    Title = "hutaohub:Full_Bright",
    Desc = "hutaohub:Full_Bright_Desc",
    Flag = "FullBright",
    Value = false,
    Callback = function(state)
        MiscState.FullBright = state

        if state then
            ApplyVisuals()
        else
            ResetFullBright()
        end
    end
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Remove_Fog",
    Desc = "hutaohub:Remove_Fog_Desc",
    Flag = "RemoveFog",
    Value = false,
    Callback = function(state)
        MiscState.Fog = state

        if state then
            ApplyVisuals()
        else
            ResetFog()
        end
    end
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Infinite_Zoom",
    Desc = "hutaohub:Infinite_Zoom_Desc",
    Flag = "Infinite Zoom",
    Value = false,
    Callback = function(state)
        MiscState.InfiniteZoom = state

        if not state then
            ResetZoom()
        end
    end
})

TabHandles.Misc:Section({
    Title = "hutaohub:Game_Play",
    Icon = "joystick"
})

local function TryRemoveEffect(obj)
    if not MiscState.RemoveEffects then
        return
    end

    if not obj or not obj.Parent then
        return
    end

    local remove =
        EFFECT_NAMES[obj.Name]
        or EFFECT_CLASSES[obj.ClassName]

    if not remove
    and (
        obj:IsA("ScreenGui")
        or obj:IsA("BillboardGui")
        or obj:IsA("SurfaceGui")
    ) then
        local lname = string.lower(obj.Name)

        remove =
            string.find(lname, "overlay")
            or string.find(lname, "effect")
    end

    if remove then
        pcall(obj.Destroy, obj)
    end
end

TabHandles.Misc:Toggle({
    Title = "hutaohub:Remove_Effects",
    Desc = "hutaohub:Remove_Effects_Desc",
    Flag = "RemoveAllBadEffects",
    Value = false,
    Callback = function(state)
        MiscState.RemoveEffects = state

        for i = 1, #EffectConnections do
            EffectConnections[i]:Disconnect()
        end

        table.clear(EffectConnections)

        if not state then
            return
        end

        local pg = localPlayer:FindFirstChild("PlayerGui")

        if pg then
            for _, obj in ipairs(pg:GetDescendants()) do
                TryRemoveEffect(obj)
            end

            EffectConnections[#EffectConnections + 1] =
                pg.DescendantAdded:Connect(TryRemoveEffect)
        end

        for _, obj in ipairs(Lighting:GetDescendants()) do
            TryRemoveEffect(obj)
        end

        EffectConnections[#EffectConnections + 1] =
            Lighting.DescendantAdded:Connect(TryRemoveEffect)
    end
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Anti_Slow",
    Desc = "hutaohub:Anti_Slow_Desc",
    Flag = "Anti Slow",
    Value = false,
    Callback = function(state)
        MiscState.AntiSlow = state
    end
})

if chatWindow then
    chatWindow:GetPropertyChangedSignal("Enabled"):Connect(function()
        if chatWindow.Enabled ~= MiscState.ShowChat then
            chatWindow.Enabled = MiscState.ShowChat
        end
    end)
end

TabHandles.Misc:Toggle({
    Title = "hutaohub:Show_Chat",
    Desc = "hutaohub:Show_Chat_Desc",
    Flag = "ShowChat",
    Value = false,
    Callback = function(state)
        MiscState.ShowChat = state

        if chatWindow then
            chatWindow.Enabled = state
        end
    end
})

TabHandles.Misc:Section({
    Title = "hutaohub:Protect",
    Icon = "shield-alert"
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Anti_Screen_Recording",
    Desc = "hutaohub:Anti_Screen_Recording",
    Flag = "Anti Screen Recording",
    Value = true,
    Callback = function(state)
        if type(setfflag) ~= "function" then
            return
        end

        pcall(function()
            setfflag(
                "AbuseReportScreenshot",
                state and "False" or "True"
            )

            setfflag(
                "AbuseReportScreenshotPercentage",
                state and "0" or "100"
            )
        end)
    end
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Remove_Fake_Noli",
    Desc = "hutaohub:Remove_Fake_Noli_Desc",
    Flag = "Remove Fake Noli",
    Value = true,
    Callback = function(state)
        MiscState.RemoveNPCNoli = state
    end
})

TabHandles.Misc:Toggle({
    Title = "hutaohub:Anti_AFK_Roblox",
    Desc = "hutaohub:Anti_AFK_Roblox_Desc",
    Flag = "Anti AFK",
    Value = true,
    Callback = function(state)
        MiscState.AntiAFK = state

        if not getconnections then
            return
        end

        local idleCons = getconnections(localPlayer.Idled)

        if state then
            for _, c in ipairs(idleCons) do
                antiAFKCons[c] = true

                pcall(function()
                    c:Disable()
                end)
            end

            if antiAFKConnection then
                antiAFKConnection:Disconnect()
            end

            antiAFKConnection = localPlayer.Idled:Connect(function()
                pcall(function()
                    VirtualUser:CaptureController()

                    VirtualUser:Button2Down(
                        Vector2.new(0, 0),
                        Workspace.CurrentCamera.CFrame
                    )

                    task.wait(0.1)

                    VirtualUser:Button2Up(
                        Vector2.new(0, 0),
                        Workspace.CurrentCamera.CFrame
                    )
                end)
            end)
        else
            for c in pairs(antiAFKCons) do
                if c and c.Enable then
                    pcall(function()
                        c:Enable()
                    end)
                end
            end

            antiAFKCons = {}

            if antiAFKConnection then
                antiAFKConnection:Disconnect()
                antiAFKConnection = nil
            end
        end
    end
})

-- ==========================================
-- 1. STATE MANAGEMENT (Luật 4: Biến phẳng, không lồng sâu)
-- ==========================================
local ConfigManager = Window.ConfigManager
local AUTOLOAD_FILE = "saveconfigv2.txt"
local AUTOLOAD_CLONE = "saveconfigv2_clone.txt"

local ConfigState = {
    Name = "",
    Selected = nil,
    CurrentObject = nil,
    AutoLoad = false,
    InitLoop = nil,
    AutoSaveLoop = nil
}

-- Biến toàn cục trong scope này để lưu trữ instance UI sau khi tạo
local ConfigDropdownElement = nil

-- ==========================================
-- 2. UTILS & UI NOTIFY (Luật 1: Hàm nhỏ, đơn nhiệm)
-- ==========================================
local function Notify(title, content, icon)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = 3,
        Icon = icon
    })
end

local function GetConfigs()
    return ConfigManager:AllConfigs()
end

-- SỬA LỖI TẠI ĐÂY: Thay SetValue bằng Set (Hỗ trợ fallback an toàn)
local function RefreshDropdown(dropdown)
    if not dropdown then return end
    
    local configs = GetConfigs()
    dropdown:Refresh(configs)
    
    local targetValue = ConfigState.Selected
    if dropdown.Set then
        dropdown:Set(targetValue)
    elseif dropdown.SetValue then
        dropdown:SetValue(targetValue)
    end
end

local function ConfigExists(name)
    if not name or name == "" then return false end
    
    local list = GetConfigs()
    for i = 1, #list do
        if list[i] == name then
            return true
        end
    end
    return false
end

-- ==========================================
-- 3. FILE LOGIC MODULE (Tách biệt logic xử lý file)
-- ==========================================
local function SaveAutoLoad(configName, state)
    if not writefile then return end
    
    local dataString = string.format("%s|%s", configName or "", state and "1" or "0")
    writefile(AUTOLOAD_FILE, dataString)

    if state and isfile and isfile(AUTOLOAD_CLONE) then
        delfile(AUTOLOAD_CLONE)
    end
end

local function CreateCloneFile()
    if writefile then
        writefile(AUTOLOAD_CLONE, "")
    end
end

local function LoadAutoLoad()
    if isfile and isfile(AUTOLOAD_CLONE) then
        return "", false
    end

    if not (readfile and isfile and isfile(AUTOLOAD_FILE)) then
        return "", false
    end

    local success, result = pcall(readfile, AUTOLOAD_FILE)
    if not success then
        return "", false
    end

    local name, toggle = tostring(result):match("^(.-)|?(%d?)$")
    return name or "", toggle == "1"
end

-- ==========================================
-- 4. CONFIG CORE LOGIC (Tách biệt logic cấu hình)
-- ==========================================
local function GetConfigObject(name)
    local success, cfg = pcall(function()
        return ConfigManager:CreateConfig(name)
    end)
    if success then return cfg end
end

local function SaveConfig(name)
    local cfg = GetConfigObject(name)
    if not cfg then return false end

    local success = pcall(function() cfg:Save() end)
    if success then
        ConfigState.CurrentObject = cfg
        Window.CurrentConfig = cfg
    end
    return success
end

local function LoadConfig(name)
    local cfg = GetConfigObject(name)
    if not cfg then return false end

    local success = pcall(function() cfg:Load() end)
    if success then
        ConfigState.CurrentObject = cfg
        Window.CurrentConfig = cfg
    end
    return success
end

-- ==========================================
-- 5. LOOP MODULE (Luật 7: Vòng lặp mỏng, cô lập hành vi)
-- ==========================================
local function StopLoops()
    if ConfigState.InitLoop then
        task.cancel(ConfigState.InitLoop)
        ConfigState.InitLoop = nil
    end
    if ConfigState.AutoSaveLoop then
        task.cancel(ConfigState.AutoSaveLoop)
        ConfigState.AutoSaveLoop = nil
    end
end

local function ExecuteAutoSaveTick()
    if not ConfigState.AutoLoad then return end
    local selected = ConfigState.Selected
    if selected and ConfigExists(selected) then
        SaveConfig(selected)
    end
end

local function StartAutoSaveLoop()
    ConfigState.AutoSaveLoop = task.spawn(function()
        while ConfigState.AutoLoad do
            task.wait(5)
            ExecuteAutoSaveTick()
        end
    end)
end

local function StartAutoSave()
    StopLoops()

    ConfigState.InitLoop = task.spawn(function()
        for _ = 1, 3 do
            if not ConfigState.AutoLoad then return end
            task.wait(1)
            
            local selected = ConfigState.Selected
            if selected and ConfigExists(selected) then
                SaveConfig(selected)
                LoadConfig(selected)
            end
        end

        if not ConfigState.AutoLoad then return end
        StartAutoSaveLoop()

        Notify("hutaohub:Auto_Load", "hutaohub:Config_Content13", "refresh-cw")
    end)
end

-- ==========================================
-- 6. UI CALLBACK HANDLERS (Luật 2, 6: Hàm phẳng làm callback)
-- ==========================================
local function OnConfigNameChanged(v)
    ConfigState.Name = tostring(v or "")
end

local function OnConfigSelected(v)
    ConfigState.Selected = v
end

local function OnMakeConfigPressed()
    local name = ConfigState.Name
    if name == "" then
        Notify("hutaohub:Config", "hutaohub:Config_Content", "circle-alert")
        return
    end

    if ConfigExists(name) then
        Notify("hutaohub:Config", "hutaohub:Config_Content1", "circle-alert")
        return
    end

    if not SaveConfig(name) then
        Notify("hutaohub:Config", "Failed to create config", "circle-alert")
        return
    end

    ConfigState.Selected = name
    RefreshDropdown(ConfigDropdownElement)
    Notify("hutaohub:Config", "hutaohub:Config_Content2", "check")
end

local function OnUpdateConfigPressed()
    local selected = ConfigState.Selected
    if not selected then
        Notify("hutaohub:Config", "hutaohub:Config_Content3", "circle-alert")
        return
    end

    if not ConfigExists(selected) then
        Notify("hutaohub:Config", "hutaohub:Config_Content4", "circle-alert")
        return
    end

    if SaveConfig(selected) then
        Notify("hutaohub:Config", "hutaohub:Config_Content5", "refresh-cw")
    end
end

local function OnLoadConfigPressed()
    local selected = ConfigState.Selected
    if not selected then
        Notify("hutaohub:Config", "hutaohub:Config_Content6", "circle-alert")
        return
    end

    if not ConfigExists(selected) then
        Notify("hutaohub:Config", "hutaohub:Config_Content7", "circle-alert")
        return
    end

    if LoadConfig(selected) then
        Notify("hutaohub:Config", "hutaohub:Config_Content8", "check")
    end
end

local function OnDeleteConfigPressed()
    local selected = ConfigState.Selected
    if not selected then
        Notify("hutaohub:Config", "hutaohub:Config_Content9", "circle-alert")
        return
    end

    if not ConfigExists(selected) then
        Notify("hutaohub:Config", "hutaohub:Config_Content10", "circle-alert")
        return
    end

    local cfg = GetConfigObject(selected)
    if cfg then
        pcall(function() cfg:Delete() end)
    end

    ConfigState.Selected = nil
    ConfigState.CurrentObject = nil
    RefreshDropdown(ConfigDropdownElement)
    Notify("hutaohub:Config", "hutaohub:Config_Content11", "trash")
end

local function OnAutoLoadToggled(state)
    ConfigState.AutoLoad = state
    StopLoops()

    if not state then
        CreateCloneFile()
        Notify("hutaohub:Auto_Load", "hutaohub:Disabled", "x")
        return
    end

    local selected = ConfigState.Selected
    if not selected then
        ConfigState.AutoLoad = false
        Notify("hutaohub:Auto_Load", "hutaohub:Config_Content12", "circle-alert")
        return
    end

    SaveAutoLoad(selected, true)
    Notify("hutaohub:Auto_Load", "Enabled: " .. selected, "check")
    StartAutoSave()
end

-- ==========================================
-- 7. UI GENERATION (Luật 3, 8: Chỉ khởi tạo UI và gán hàm)
-- ==========================================
TabHandles.Settings:Input({
    Title = "hutaohub:Config_Name",
    Desc = "hutaohub:Config_Name_Desc",
    Flag = "Config Name",
    Placeholder = "Enter new config name",
    Value = "",
    Callback = OnConfigNameChanged
})

ConfigDropdownElement = TabHandles.Settings:Dropdown({
    Title = "hutaohub:Config_List",
    Desc = "hutaohub:Config_List_Desc",
    Flag = "Config List",
    Values = GetConfigs(),
    Value = nil,
    Callback = OnConfigSelected
})

TabHandles.Settings:Button({
    Title = "hutaohub:Make_Config",
    Desc = "hutaohub:Make_Config_Desc",
    Callback = OnMakeConfigPressed
})

TabHandles.Settings:Button({
    Title = "hutaohub:Update_Config",
    Desc = "hutaohub:Update_Config_Content",
    Callback = OnUpdateConfigPressed
})

TabHandles.Settings:Button({
    Title = "hutaohub:Load_Config",
    Desc = "hutaohub:Load_Config_Desc",
    Callback = OnLoadConfigPressed
})

TabHandles.Settings:Button({
    Title = "hutaohub:Delete_Config",
    Desc = "hutaohub:Delete_Config_Desc",
    Callback = OnDeleteConfigPressed
})

TabHandles.Settings:Toggle({
    Title = "hutaohub:Auto_Load_Config",
    Desc = "hutaohub:Auto_Load_Config_Desc",
    Flag = "Auto Load Config v2",
    Value = false,
    Callback = OnAutoLoadToggled
})

-- ==========================================
-- 8. INITIALIZATION DEFERRED RUN
-- ==========================================
task.delay(1, function()
    local saved, enabled = LoadAutoLoad()
    if saved == "" or not ConfigExists(saved) then return end

    ConfigState.Selected = saved
    ConfigState.AutoLoad = enabled

    LoadConfig(saved)
    RefreshDropdown(ConfigDropdownElement)

    if enabled then
        StartAutoSave()
        Notify("hutaohub:Auto_Load", "Loaded: " .. saved .. " (enabled)", "check")
    else
        Notify("hutaohub:Auto_Load", "Loaded: " .. saved .. " (disabled)", "circle-alert")
    end
end)


getgenv().showpingandfps = getgenv().showpingandfps ~= false

if getgenv().showpingandfps then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SLK-GAMING-MOD/Open-soure/refs/heads/main/fps%2Bping.luau"))()
end
