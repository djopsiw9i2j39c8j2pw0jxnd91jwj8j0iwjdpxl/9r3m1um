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
ServerScriptService = game:GetService("ServerScriptService")

MapFolder = Workspace:WaitForChild("Map")
IngameFolder = MapFolder:WaitForChild("Ingame")
killersFolder = Workspace:WaitForChild("Players"):WaitForChild("Killers")
survivorsFolder = Workspace:WaitForChild("Players"):WaitForChild("Survivors")
localPlayer = Players.LocalPlayer
PlayerGui = localPlayer:WaitForChild("PlayerGui", 10)
playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()

localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

Camera = Workspace.CurrentCamera

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
    ["Auto_Kill_Sections"] = "All functions to help auto kill all survivors.",
    ["Generator_Sections"] = "All functions that allow you to automatically fix the generator.",
    ["Items_Sections"] = "All functions that make picking up and finding items easier.",
    ["Eliot_Sections"] = "Features that will help you become a pro when using Eliot.",
    ["007n7_Sections"] = "Contains functions that allow you to become invisible.",
    ["Shedletsky_Sections"] = "This will help you use Sethtsky more easily.",
    ["TwoTime_Sections"] = "You will become a pro player every time you use a skill.",
    ["Dusekkar_Sections"] = "It will adjust your energy beam each time you use a skill.",
    ["Veeronica_Sections"] = "These are the functions and skills of the character Veronica.",
    ["Guest1337_Sections"] = "This is the feature that will help you become a pro using guest1337.",
    ["Chance_Sections"] = "All these functions will help you each time you use a skill.",
    ["AutoSkill_Sections"] = "This will help you utilize all of your ultimate skills.",
    ["AutoAttack_Sections"] = "This will help you use M1 skills.",
    ["is1x1x1x1_Sections"] = "This section contains the functions of 1x1x1x1.",
    ["Nosferatu_Sections"] = "This section contains the functions of the Nosferatu killers.",
    ["Noli_Sections"] = "This is of the functions related to killers Noli.",
    ["c00lkidd_Sections"] = "This is of the functions related to killers c00lkidd",
    ["YouName_Sections"] = "This section allows you to change your name when entering the game.",
    ["AntiCC_Sections"] = "This part provides immunity to stun.",
    ["Camlock_Sections"] = "Camlock bypass functions are here.",
    ["Stamina_Sections"] = "Settings for your stamina metrics.",
    ["Esp_Sections"] = "Enhance visibility with ESP features.",
    ["Hitbox_Sections"] = "These functions will interfere with the hitbox.",
    ["FixLag_Sections"] = "Reduce lag, improve FPS, and optimize game performance.",
    ["Camera_Sections"] = "Improve visibility with brightness, fog, and zoom settings.",
    ["GamePlay_Sections"] = "Enhance movement and gameplay experience.",
    ["Protect_Sections"] = "Various protection features for a safer gameplay experience.",
    ["Language_Sections"] = "Customize the script language and localization settings.",
    ["Config_Sections"] = "Create, save, load, and organize configurations.",
    ["Silent_Aim"] = "Silent Aim",
    ["SilentAim_Sections"] = "Improve target acquisition and aiming accuracy.",
    ["Dusekkar_Aim"] = "Dusekkar Aim",
    ["Dusekkar_Aim_Desc"] = "Immediately redirect the Plasma Beam skill.",
    ["Normal_Aim_Style"] = "Normal Aim Style",
    ["Normal_Aim_Style_Desc"] = "Choose a custom mobile or PC aim recovery type.",
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
    ["Auto_Kill"] = "Auto Kill",
    ["Change_Target"] = "Change Target",
    ["Change_Target_Desc"] = "Switch to the next nearest survivor",
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
    ["Pizza_Aimbot"] = "Pizza Aimbot",
    ["Pizza_Aimbot_Desc"] = "Auto aim at survivors with the lowest HP when throwing pizzas.",
    ["Aim_Distance"] = "Aim Distance",
    ["Aim_Distance_Eliot"] = "Distance to find and locate survivors with the least amount of health.",
    ["Aim_Offset"] = "Aim Offset",
    ["Aim_Offset_Desc"] = "Adjust the offset slightly so that when aiming, the pizza will always hit the survivors.",
    ["Aim_Duration_Eliot"] = "Maximum time to aim each time you use the Pizza skill.",
    ["Auto_Eat_Pizza"] = "Auto Eat Pizza",
    ["Auto_Eat_Pizza_Desc"] = "Auto find pizza on the map and teleport there to eat pizza.",
    ["HP_Threshold_Eliot"] = "Adjust the amount of blood required to activate automatic pizza eating.",
    ["Instant_Invisible"] = "Instant Invisible",
    ["Instant_Invisible_Desc"] = "Instant invisibility when the function is activated.",
    ["Invisible_If_Cloned"] = "Invisible If Cloned",
    ["Invisible_If_Cloned_Desc"] = "Activate the stealth function every time you use a skill.",
    ["Auto_Slash"] = "Auto Slash",
    ["Auto_Slash_Desc"] = "Auto use skills when killers are detected nearby.",
    ["Slash_Radius"] = "Slash Radius",
    ["Slash_Radius_Desc"] = "Killer detection range for using skills",
    ["Set_Slash_Delay"] = "Set Slash Delay",
    ["Set_Slash_Delay_Desc"] = "Check if the killers are still within range during the time you select.",
    ["Aim_Plasma_Beam"] = "Aim Plasma Beam",
    ["Aim_Plasma_Beam_Desc"] = "Activate the aim function for the skill.",
    ["Aim_Plasma_Beam_Mode"] = "Aim Plasma Beam Mode",
    ["Aim_Plasma_Beam_Mode_Desc"] = "Select the aim mode for the skill.",
    ["Auto_Eat_Chicken"] = "Auto Eat Chicken",
    ["Auto_Eat_Chicken_Desc"] = "Auto use skills to heal if you still have skills available.",
    ["HP_Threshold"] = "HP Threshold",
    ["HP_Threshold_Desc"] = "Adjusting the required HP will activate the chicken eating skill.",
    ["Safe_Distance"] = "Safe Distance",
    ["Safe_Distance_Desc"] = "Adjust your safe distance when using skills to avoid nearby killers.",
    ["Sk8_Control"] = "Sk8 Control",
    ["Sk8_Control_Desc"] = "It helps you glide on your skateboard extremely smoothly without slowing down.",
    ["Auto_Trick_V4"] = "Auto Trick V4",
    ["Auto_Trick_V4_Desc"] = "Auto activate the trick button to jump when there's a glowing border around you.",
    ["Auto_Dagger"] = "Auto Dagger",
    ["Auto_Dagger_Desc"] = "Automatically attack killers according to the selected mode.",
    ["Aim_Dagger"] = "Aim Dagger",
    ["Aim_Dagger_Desc"] = "Auto aim at killers according to the selected mode.",
    ["Aim_Dagger_Mode"] = "Aim Dagger Mode",
    ["Aim_Dagger_Mode_Desc"] = "Select the attack mode for the function.",
    ["Dagger_Radius"] = "Dagger Radius",
    ["Dagger_Radius_Desc"] = "Distance allows skill activation and aiming.",
    ["Dash_After_Dagger"] = "Dash After Dagger",
    ["Dash_After_Dagger_Desc"] = "Auto dash straight towards killers every time a skill is used.",
    ["Dash_Speed"] = "Dash Speed",
    ["Dash_Speed_Desc"] = "Set the best dash speed you want.",
    ["Block_Mode"] = "Block Mode",
    ["Block_Mode_Desc"] = "Choose the blocking mode you want to use.",
    ["Pro_Block_Cooldown"] = "Pro Block Cooldown",
    ["Pro_Block_Cooldown_Desc"] = "Blocking continuously when sound is present helps reduce lag.",
    ["Pro_Sound_Threshold"] = "Pro Sound Threshold",
    ["Pro_Sound_Threshold_Desc"] = "Prevents block activation when the skill has ended but the sound is still on.",
    ["Wall_Check"] = "Wall Check",
    ["Wall_Check_Desc"] = "Prevent killers from accidentally blocking attacks from behind walls.",
    ["Show_Hit_Circle"] = "Show Hit Circle",
    ["Show_Hit_Circle_Desc"] = "Shows the killers' true attack area.",
    ["Auto_Block_Beta"] = "Auto Block [Beta]",
    ["Auto_Block_Beta_Desc"] = "Auto activates skill block extremely quickly when the conditions are met.",
    ["Range_Check"] = "Range Check",
    ["Range_Check_Desc"] = "Adjust the inspection area for the Show Circle button.",
    ["Elevation_Range_Check"] = "Elevation Range Check",
    ["Elevation_Range_Check_Desc"] = "Adjust the height difference to avoid blocks.",
    ["Range_Hit_Circle"] = "Range Hit Circle",
    ["Range_Hit_Circle_Desc"] = "Adjust the killers' strike detection area.",
    ["Show_Circle"] = "Show Circle",
    ["Show_Circle_Desc"] = "Displays the area where block triggers may occur.",
    ["Elevation_Check"] = "Elevation Check",
    ["Elevation_Check_Desc"] = "Check for height differences to avoid blocking the wrong person.",
    ["Punch_Aim_Mode"] = "Punch Aim Mode",
    ["Punch_Aim_Mode_Desc"] = "Select aim mode when using the punch skill.",
    ["Auto_Punch_Beta"] = "Auto Punch [Beta]",
    ["Auto_Punch_Beta_Desc"] = "Auto uses the punch skill whenever a block is successful.",
    ["Aimbot_Punch"] = "Aimbot Punch",
    ["Aimbot_Punch_Desc"] = "Auto aim your attacks at the nearest killers using your chosen mode.",
    ["Dash_Punch"] = "Dash Punch",
    ["Dash_Punch_Desc"] = "When you activate the punch skill, it will push you closer to the killers.",
    ["Distance_Check"] = "Distance Check",
    ["Distance_Check_Desc"] = "Test distance killers to trigger punch",
    ["Punch_Distance"] = "Punch Distance",
    ["Punch_Distance_Desc"] = "Turn on the distance check function.",
    ["Mode_Delay"] = "Mode Delay",
    ["Mode_Delay_Desc"] = "Adjust the delay when you select character delay mode.",
    ["Dash_Range"] = "Dash Range",
    ["Dash_Range_Desc"] = "The distance will dash to killers when killers are detected nearby.",
    ["Dash_Speed"] = "Dash Speed",
    ["Dash_Speed_Desc"] = "Adjust the dash speed to get closer to the killers.",
    ["Dash_Delay"] = "Dash Delay",
    ["Dash_Delay_Desc"] = "The waiting time before the hitbox punch appears",
    ["Aim_Duration"] = "Aim Duration",
    ["Aim_Duration_Desc"] = "Set the continuous aim time when activating the punch skill.",
    ["Camera_Aim_Speed"] = "Camera Aim Speed",
    ["Camera_Aim_Speed_Desc"] = "Adjust the camera rotation speed each time you activate aim.",
    ["Prediction_Mode"] = "Prediction Mode",
    ["Prediction_Mode_Desc"] = "Choose the prediction style each time aim is activated.",
    ["Aim_Mode"] = "Aim Mode",
    ["Aim_Mode_Desc"] = "Choose the aiming mode you want to use.",
    ["Auto_Aim_Shoot"] = "Auto Aim Shoot",
    ["Auto_Aim_Shoot_Desc"] = "Auto find killers and aim flintlock at them when shooting.",
    ["Enable_Offset"] = "Enable Offset",
    ["Enable_Offset_Desc"] = "Add offset when starting to aim (only enable this if your network is really lag).",
    ["Auto_Coin_Flip"] = "Auto Coin Flip",
    ["Auto_Coin_Flip_Desc"] = "Automatically use the CoinFlip skill until the selected points are reached.",
    ["Coinflip_Target"] = "Coinflip Target",
    ["Coinflip_Target_Desc"] = "Choose the number of successful coin toss points you want.",
    ["Safe_Coinflip"] = "Safe Coinflip",
    ["Safe_Coinflip_Desc"] = "Auto stop using skills when killers are nearby.",
    ["Safe_Coinflip_Distance"] = "Safe Coinflip Distance",
    ["Safe_Coinflip_Distance_Desc"] = "Entering a safe distance into the input field helps detect nearby killers.",
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
    ["Bloodhook_Aimbot"] = "Bloodhook Aimbot",
    ["Bloodhook_Aimbot_Desc"] = "Auto detect the nearest survivors and attack.",
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
    ["You_Name"] = "You Name",
    ["Fake_Name"] = "Fake Name",
    ["Fake_Name_Desc"] = "Enter the name you want to fake.",
    ["Anti_CC"] = "Anti-CC",
    ["Anti_Stun"] = "Anti-Stun",
    ["Anti_Stun_Desc"] = "Prevents you from being stunned.",
    ["Camlock"] = "Camlock",
    ["Camlock_Survivor"] = "Camlock Survivor",
    ["Camlock_Survivor_Desc"] = "auto camlock nearest survivor isn't blocked by anti cheat",
    ["Show_Quick_Button"] = "Show Quick Button",
    ["Show_Quick_Button_Desc"] = "This button will create a GUI so you can quickly toggle aimlock on and off.",
    ["Camera_Height"] = "Camera Height",
    ["Camera_Height_Desc"] = "This will help me adjust the camera's height so it's not hard to see.",
    ["Aim_Part"] = "Aim Part",
    ["Aim_Part_Desc"] = "Select the target body part when beginning the target lock.",
    ["Switch_Target"] = "Switch Target",
    ["Switch_Target_Desc"] = "Change to a different target that's closer to you.",
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
    ["Hitbox_Angel"] = "Hitbox Angel",
    ["Hitbox_Angel_Desc"] = "Activating the super hitbox attack prevents character from flying away.",
    ["Hitbox_Range"] = "Hitbox Range",
    ["Hitbox_Range_Desc"] = "Adjust the hitbox distance to the maximum teleportation range. (1-300)",
    ["Game_Play"] = "Game Play",
    ["Remove_Effects"] = "Remove Effects",
    ["Remove_Effects_Desc"] = "Detele all bad effects for you.",
    ["Remove_BlackScreen"] = "Remove BlackScreen",
    ["Remove_BlackScreen_Desc"] = "Remove black screen that the game intentionally leaves unremoved.",
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
    ["Rejoin_Settings_Content2"] = "Reducing Lag on Servers...",
    ["Teleport_Error"] = "Teleport Error",
    ["Rejoin_To_Fix_Lag"] = "Rejoin To Fix Lag",
    ["Rejoin_To_Fix_Lag_Desc"] = "Press to activate the server lag reduction function.",
    ["Anti_Admin_Forsaken"] = "Anti Admin [Forsaken]",
    ["Anti_Admin_Forsaken_Desc"] = "Auto switch servers as soon as an administrator is detected on the server.",
    ["Anti_Admin_Forsaken_Content"] = "Warning! An admin on this server has been detected, preparing to switch servers!!",
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

-- ================= LOADER ANIMATION UI =================
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

-- ================= CORE TRANSLATION ENGINE (OPTIMIZED) =================
function RunTranslationProcess(StatusLabel, BarFill)
    local fileName = "HutaoHub_Data_Files.json"
    local cache = loadCachedLanguages(fileName)
    
    local totalLanguages = 0
    for _ in pairs(langMapping) do totalLanguages = totalLanguages + 1 end

    updateProgress(StatusLabel, BarFill, 0, "STARTING TRANSLATION ENGINE...")
    task.wait(0.3)

    local currentLangIdx = 0
    local globalCacheModified = false

    for targetLangCode, langDisplayName in pairs(langMapping) do
        currentLangIdx = currentLangIdx + 1
        local progressPercent = math.floor((currentLangIdx / totalLanguages) * 100)
        updateProgress(StatusLabel, BarFill, progressPercent, "PROCESSING: " .. langDisplayName)

        if not cache[targetLangCode] then cache[targetLangCode] = {} end
        local langCache = cache[targetLangCode]

        -- Dọn dẹp cache thừa: Xóa các key không còn tồn tại trong baseTranslations
        for cachedKey in pairs(langCache) do
            if not baseTranslations[cachedKey] then
                langCache[cachedKey] = nil
                globalCacheModified = true
            end
        end

        local keysToTranslate = {}
        local textsToTranslate = {}

        -- KIỂM TRA SỰ THAY ĐỔI CỦA TEXT GỐC (FIX LỖI CŨ CỦA BRO)
        for key, srcText in pairs(baseTranslations) do
            if targetLangCode == "en" then
                -- Tiếng Anh thì giữ nguyên luôn, không cần dịch
                langCache[key] = { src = srcText, tr = srcText }
                finalTranslations[targetLangCode][key] = srcText
            else
                local cachedData = langCache[key]
                local needsTranslate = false

                if not cachedData then
                    needsTranslate = true
                elseif type(cachedData) ~= "table" then
                    -- Hỗ trợ tương thích ngược nếu file cache cũ lưu dạng String thường
                    needsTranslate = true
                elseif cachedData.src ~= srcText then
                    -- PHÁT HIỆN THAY ĐỔI TEXT GỐC: Ví dụ từ "Kill" đổi sang "Killers"
                    needsTranslate = true
                end

                if needsTranslate then
                    table.insert(keysToTranslate, key)
                    table.insert(textsToTranslate, srcText)
                else
                    -- Cache trùng khớp hoàn toàn, sử dụng luôn bản dịch cũ
                    finalTranslations[targetLangCode][key] = cachedData.tr
                end
            end
        end

        -- GỬI FULL TEXT DỊCH BATCH THEO TỪNG NGÔN NGỮ (TĂNG TỐC ĐỘ)
        if #keysToTranslate > 0 and targetLangCode ~= "en" then
            -- Ghép toàn bộ cụm từ cần dịch lại bằng dấu xuống dòng \n
            local combinedText = table.concat(textsToTranslate, "\n")
            local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=" .. targetLangCode .. "&dt=t&q=" .. HttpService:UrlEncode(combinedText)
            
            local success, response = pcall(function() return game:HttpGet(url) end)
            
            if success and response then
                local decoded = HttpService:JSONDecode(response)
                if decoded and decoded[1] then
                    -- Gom các chunk dữ liệu trả về từ Google thành một chuỗi lớn thống nhất
                    local translatedChunks = {}
                    for _, chunk in ipairs(decoded[1]) do
                        if chunk and chunk[1] then
                            table.insert(translatedChunks, chunk[1])
                        end
                    end
                    
                    local fullTranslatedText = table.concat(translatedChunks, "")
                    -- Tách ngược lại thành từng dòng kết quả tương ứng
                    local translatedLines = string.split(fullTranslatedText, "\n")

                    for idx, key in ipairs(keysToTranslate) do
                        local translatedValue = translatedLines[idx]
                        if translatedValue then
                            -- Xóa khoảng trắng thừa ở 2 đầu chuỗi
                            translatedValue = string.gsub(translatedValue, "^%s*(.-)%s*$", "%1")
                        else
                            -- Fallback phòng hờ lỗi mạng ngoài ý muốn
                            translatedValue = baseTranslations[key] 
                        end

                        -- Cập nhật cấu trúc cache mới chống xung đột dữ liệu cũ/mới
                        langCache[key] = {
                            src = baseTranslations[key],
                            tr = translatedValue
                        }
                        finalTranslations[targetLangCode][key] = translatedValue
                    end
                    globalCacheModified = true
                end
            else
                -- Fallback an toàn nếu API bị sập hoàn toàn
                for _, key in ipairs(keysToTranslate) do
                    langCache[key] = { src = baseTranslations[key], tr = baseTranslations[key] }
                    finalTranslations[targetLangCode][key] = baseTranslations[key]
                end
            end
            task.wait(0.05) -- Delay siêu nhỏ giữa các ngôn ngữ để tránh spam API
        end
    end

    -- Lưu lại file cache nếu có sự thay đổi
    if globalCacheModified then
        saveCachedLanguages(fileName, cache)
    end

    updateProgress(StatusLabel, BarFill, 100, "ALL LANGUAGES LOADED SUCCESSFULLY!")
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
        Title = "Open Script",
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
    Window:Tag({Title = "v10.8.6", Icon = "cog", Color = Color3.fromHex("#30ff6a")})

    local Tabs = {
        About = Window:Section({ Title = "hutaohub:About", Opened = true }),
        Features = Window:Section({ Title = "hutaohub:Features", Opened = true }),
        Gameplay = Window:Section({ Title = "hutaohub:Gameplay", Opened = true }),
        System = Window:Section({ Title = "hutaohub:System", Opened = true }),
    }

    local TabHandles = {
        Info = Tabs.About:Tab({ Title = "hutaohub:Information", Icon = "badge-info", ShowTabTitle = true, }),
        Farm = Tabs.Features:Tab({ Title = "hutaohub:Farm", Icon = "crown", ShowTabTitle = true, }),
        Survivors = Tabs.Features:Tab({ Title = "hutaohub:Survivors", Icon = "user-check", ShowTabTitle = true, }),
        Killers = Tabs.Features:Tab({ Title = "hutaohub:Killers", Icon = "skull", ShowTabTitle = true, }),
        Name = Tabs.Gameplay:Tab({ Title = "hutaohub:Name", Icon = "type", ShowTabTitle = true, }),
        Player = Tabs.Gameplay:Tab({ Title = "hutaohub:Player", Icon = "user", ShowTabTitle = true, }),
        Visual = Tabs.Gameplay:Tab({ Title = "hutaohub:Visual", Icon = "eye", ShowTabTitle = true, }),
        Misc = Tabs.System:Tab({ Title = "hutaohub:Misc", Icon = "menu", ShowTabTitle = true, }),
        Settings = Tabs.System:Tab({ Title = "hutaohub:Settings", Icon = "settings", ShowTabTitle = true, }),
    }
    
    return Window, TabHandles
end

Window, TabHandles = InitializeWindUI()
    
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
    
    local baseUrl = "https://raw.githubusercontent.com/djopsiw9i2j39c8j2pw0jxnd91jwj8j0iwjdpxl/50ur3-c0d3/refs/heads/main/"
    local Visual = loadstring(game:HttpGet(baseUrl .. "Visual.luau"))()
    
    
local Sections = {
    AutoKill = TabHandles.Farm:Section({ Title = "hutaohub:Auto_Kill", Desc = "hutaohub:Auto_Kill_Sections", Icon = "skull", Opened = false, Box = true, BoxBorder = true }),
    Generator = TabHandles.Farm:Section({ Title = "hutaohub:Generator", Desc = "hutaohub:Generator_Sections", Icon = "battery-charging", Opened = false, Box = true, BoxBorder = true }),
    Items = TabHandles.Farm:Section({ Title = "hutaohub:Items_Settings", Desc = "hutaohub:Items_Sections", Icon = "backpack", Opened = false, Box = true, BoxBorder = true }),
    SilentAim = TabHandles.Survivors:Section({ Title = "hutaohub:Silent_Aim", Desc = "hutaohub:SilentAim_Sections", Icon = "target", Opened = false, Box = true, BoxBorder = true }),
    Eliot = TabHandles.Survivors:Section({ Title = "Eliot", Desc = "hutaohub:Eliot_Sections", Icon = "pizza", Opened = false, Box = true, BoxBorder = true }),
    Clone007n7 = TabHandles.Survivors:Section({ Title = "007n7", Desc = "hutaohub:007n7_Sections", Icon = "ghost", Opened = false, Box = true, BoxBorder = true }),
    Shedletsky = TabHandles.Survivors:Section({ Title = "Shedletskey", Desc = "hutaohub:Shedletsky_Sections", Icon = "sword", Opened = false, Box = true, BoxBorder = true }),
    TwoTime = TabHandles.Survivors:Section({ Title = "Two Time", Desc = "hutaohub:TwoTime_Sections", Icon = "shuffle", Opened = false, Box = true, BoxBorder = true }),
    Dusekkar = TabHandles.Survivors:Section({ Title = "Dusekkar", Desc = "hutaohub:Dusekkar_Sections", Icon = "bolt", Opened = false, Box = true, BoxBorder = true }),
    Veeronica = TabHandles.Survivors:Section({ Title = "Veeronica", Desc = "hutaohub:Veeronica_Sections", Icon = "wind", Opened = false, Box = true, BoxBorder = true }),
    Guest1337 = TabHandles.Survivors:Section({ Title = "Guest1337", Desc = "hutaohub:Guest1337_Sections", Icon = "shield-check", Opened = false, Box = true, BoxBorder = true }),
    Chance = TabHandles.Survivors:Section({ Title = "Chance", Desc = "hutaohub:Chance_Sections", Icon = "bitcoin", Opened = false, Box = true, BoxBorder = true }),
    AutoAttack = TabHandles.Killers:Section({ Title = "Auto Attack", Desc = "hutaohub:AutoAttack_Sections", Icon = "sword", Opened = false, Box = true, BoxBorder = true }),
    AutoSkill = TabHandles.Killers:Section({ Title = "Auto Skill", Desc = "hutaohub:AutoSkill_Sections", Icon = "repeat", Opened = false, Box = true, BoxBorder = true }),
    Nosferatu = TabHandles.Killers:Section({ Title = "Nosferatu", Desc = "hutaohub:Nosferatu_Sections", Icon = "moon-star", Opened = false, Box = true, BoxBorder = true }),
    is1x1x1x1 = TabHandles.Killers:Section({ Title = "1x1x1x1", Desc = "hutaohub:is1x1x1x1_Sections", Icon = "bug", Opened = false, Box = true, BoxBorder = true }),
    Noli = TabHandles.Killers:Section({ Title = "Noli", Desc = "hutaohub:Noli_Sections", Icon = "sparkles", Opened = false, Box = true, BoxBorder = true }),
    c00lkidd = TabHandles.Killers:Section({ Title = "c00lkidd", Desc = "hutaohub:c00lkidd_Sections", Icon = "flame", Opened = false, Box = true, BoxBorder = true }),
    JohnDoe = TabHandles.Killers:Section({ Title = "John Doe", Desc = "hutaohub:JohnDoe_Sections", Icon = "binary", Opened = false, Box = true, BoxBorder = true }),
    YouName = TabHandles.Name:Section({ Title = "hutaohub:You_Name", Desc = "hutaohub:YouName_Sections", Icon = "user-check", Opened = false, Box = true, BoxBorder = true }),
    AntiCC = TabHandles.Player:Section({ Title = "hutaohub:Anti_CC", Desc = "hutaohub:AntiCC_Sections", Icon = "shield-alert", Opened = false, Box = true, BoxBorder = true }),
    Camlock = TabHandles.Player:Section({ Title = "hutaohub:Camlock", Desc = "hutaohub:Camlock_Sections", Icon = "crosshair", Opened = false, Box = true, BoxBorder = true }),
    Stamina = TabHandles.Player:Section({ Title = "hutaohub:Stamina", Desc = "hutaohub:Stamina_Sections", Icon = "wind", Opened = false, Box = true, BoxBorder = true }),
    Hitbox = TabHandles.Player:Section({ Title = "Hitbox", Desc = "hutaohub:Hitbox_Sections", Icon = "box", Opened = false, Box = true, BoxBorder = true }),
    Esp = TabHandles.Visual:Section({ Title = "Visual ESP", Desc = "hutaohub:Esp_Sections", Icon = "radar", Opened = false, Box = true, BoxBorder = true }),
    FixLag = TabHandles.Misc:Section({ Title = "Fix Lag", Desc = "hutaohub:FixLag_Sections", Icon = "cpu", Opened = false, Box = true, BoxBorder = true }),
    Camera = TabHandles.Misc:Section({ Title = "hutaohub:Camera", Desc = "hutaohub:Camera_Sections", Icon = "camera", Opened = false, Box = true, BoxBorder = true }),
    GamePlay = TabHandles.Misc:Section({ Title = "hutaohub:Game_Play", Desc = "hutaohub:GamePlay_Sections", Icon = "joystick", Opened = false, Box = true, BoxBorder = true }),
    Protect = TabHandles.Misc:Section({ Title = "hutaohub:Protect", Desc = "hutaohub:Protect_Sections", Icon = "shield-alert", Opened = false, Box = true, BoxBorder = true }),
    Language = TabHandles.Settings:Section({ Title = "Language Settings", Desc = "hutaohub:Language_Sections", Icon = "languages", Opened = false, Box = true, BoxBorder = true }),
    Config = TabHandles.Settings:Section({ Title = "Config Settings", Desc = "hutaohub:Config_Sections", Icon = "folder", Opened = false, Box = true, BoxBorder = true }),
}
    
    Sections.Language:Dropdown({
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

getgenv().AutoKillerFarm = getgenv().AutoKillerFarm or false
getgenv().AutoFarmGen = getgenv().AutoFarmGen or false
getgenv().SafeModeGen = getgenv().SafeModeGen or false
getgenv().SafeRangeGen = getgenv().SafeRangeGen or 45
getgenv().AutoKillerTarget = nil 

local lastGenPosition = nil
local currentGenerator = nil
local currentMap = nil
local mapLoadTime = 0
local isHoldingPrompt = false

-- FIX 1: Bỏ :Wait() để tránh bị kẹt thread (treo vòng lặp) khi chuyển round
local function GetCharacter()
    return localPlayer.Character
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

local function FindNearestSurvivorExcept(hrp, myCharacter, excludeHRP)
    local nearest, minDist = nil, math.huge
    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor:IsA("Model") and survivor ~= myCharacter and IsAlive(survivor) then
            local sHrp = GetHRP(survivor)
            if sHrp and sHrp ~= excludeHRP then
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

local function ChangeTarget()
    local character = GetCharacter()
    if not character then return end
    local hrp = GetHRP(character)
    if not hrp then return end

    local oldTarget = getgenv().AutoKillerTarget
    local newTarget = FindNearestSurvivorExcept(hrp, character, oldTarget)
    
    -- ĐÃ FIX: Kiểm tra mục tiêu cũ phải còn trong survivorsFolder
    if not newTarget and oldTarget and oldTarget.Parent and oldTarget:IsDescendantOf(survivorsFolder) and IsAlive(oldTarget.Parent) then
        return
    end
    if not newTarget then
        newTarget = FindNearestSurvivor(hrp, character)
    end
    getgenv().AutoKillerTarget = newTarget
end

local function ProcessAutoKiller()
    local character = GetCharacter()
    -- Nó sẽ tự kiểm tra xem bro có đang nằm trong killersFolder hay không
    if not (character and character:IsDescendantOf(killersFolder) and IsAlive(character)) then
        getgenv().AutoKillerTarget = nil 
        return
    end

    local hrp = GetHRP(character)
    if not hrp then return end

    local targetHrp = getgenv().AutoKillerTarget
    
    -- ĐÃ FIX: Thêm điều kiện targetHrp:IsDescendantOf(survivorsFolder)
    -- Nếu mục tiêu teleport lỗi/thoát game làm mất nhân vật khỏi folder, script tự động nhảy target ngay lập tức
    if targetHrp and targetHrp.Parent and targetHrp.Parent:IsA("Model") and targetHrp:IsDescendantOf(survivorsFolder) and IsAlive(targetHrp.Parent) then
        -- giữ nguyên target
    else
        targetHrp = FindNearestSurvivor(hrp, character)
        getgenv().AutoKillerTarget = targetHrp
    end

    if targetHrp then
        hrp.CFrame = CFrame.lookAt((targetHrp.CFrame * CFrame.new(0, 0, 3)).Position, targetHrp.Position)
    end
end

local function FindSafeGenerator()
    local mapContainer = workspace:FindFirstChild("Map")
    local map = mapContainer and mapContainer:FindFirstChild("Ingame") and mapContainer.Ingame:FindFirstChild("Map")
    
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
    -- FIX 2: Bỏ 'or getgenv().AutoKillerFarm' ở đây để không bị xung đột khi bật cả 2 nút
    if isHoldingPrompt then return end

    local character = GetCharacter()
    
    -- Nếu không phải Survivor, tự động reset data gen và return (không làm farm gen)
    if not (character and character:IsDescendantOf(survivorsFolder) and IsAlive(character)) then 
        lastGenPosition = nil
        currentGenerator = nil
        return 
    end

    local hrp = GetHRP(character)
    if not hrp then return end

    local foundGen, genPart = FindSafeGenerator()
    if not foundGen then return end

    local isAlreadyAtValidPos = false
    if lastGenPosition and (hrp.Position - lastGenPosition.Position).Magnitude < 3 then
        isAlreadyAtValidPos = not IsPositionOccupied(lastGenPosition.Position, character)
    end

    if not isAlreadyAtValidPos or currentGenerator ~= foundGen then
        local chosenPos = GetSafeGenPosition(genPart, character)
        if chosenPos then
            lastGenPosition = chosenPos
            currentGenerator = foundGen
            hrp.CFrame = chosenPos
        end
    end

    HandleGeneratorPrompt(foundGen)
end

-- ================= VÒNG LẶP =================
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

Sections.AutoKill:Button({
    Title = "hutaohub:Change_Target",
    Desc = "hutaohub:Change_Target_Desc",
    Callback = function()
        if getgenv().AutoKillerFarm then
            ChangeTarget()
        end
    end
})

-- ================= UI =================
Sections.AutoKill:Toggle({
    Title = "hutaohub:Auto_Kill_The_Survivors",
    Desc = "hutaohub:Auto_Kill_The_Survivors_Desc",
    Flag = "Auto Killers Farm",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillerFarm = state
        if not state then
            getgenv().AutoKillerTarget = nil 
        end
    end
})

Sections.Generator:Toggle({
    Title = "hutaohub:Auto_Farm_Generator",
    Desc = "hutaohub:Auto_Farm_Generator_Desc",
    Flag = "Auto Farm Generator",
    Value = false,
    Callback = function(state)
        getgenv().AutoFarmGen = state
    end
})

Sections.Generator:Toggle({
    Title = "hutaohub:Safe_Mode_Enable",
    Desc = "hutaohub:Safe_Mode_Enable_Desc",
    Flag = "Safe Mode Generator",
    Value = true,
    Callback = function(state)
        getgenv().SafeModeGen = state
    end
})

Sections.Generator:Input({
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

local function onToggleFarmState(state)
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
        getgenv().solveGeneratorCooldown = false
    end
end

local function onDelayInputChange(value)
    local num = tonumber(value)
    if num then
        getgenv().FlowSolveDelay = math.clamp(num, 0.01, 10)
    end
end

Sections.Generator:Toggle({
    Title = "hutaohub:Auto_Finish_Generator",
    Desc = "hutaohub:Auto_Finish_Generator_Desc",
    Flag = "Auto Finish Generator",
    Locked = false,
    Value = getgenv().FlowAutoSolve or false,
    Callback = onToggleFarmState
})

Sections.Generator:Input({
    Title = "hutaohub:Generator_Delay",
    Desc = "hutaohub:Generator_Delay_Desc",
    Flag = "Generator Delay",
    Placeholder = "0.08 - 10",
    Value = tostring(getgenv().FlowSolveDelay or 0.08),
    Numeric = true,
    Callback = onDelayInputChange
})

getgenv().AutoPickupSelected = getgenv().AutoPickupSelected or false
getgenv().AutoPickupNearest = getgenv().AutoPickupNearest or false
getgenv().SelectedItemToPickup = getgenv().SelectedItemToPickup or nil
getgenv().CachedItemHash = getgenv().CachedItemHash or ""
getgenv().LiveItemCache = getgenv().LiveItemCache or {}

local function IsSurvivor()
    return playerCharacter and playerCharacter.Parent == survivorsFolder
end

local function GetRootPart()
    return playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
end

local function InspectAndCacheObject(obj)
    if not obj:IsA("ProximityPrompt") then return end
    
    local itemRoot = obj.Parent
    if not itemRoot or itemRoot.Name ~= "ItemRoot" then return end
    
    local item = itemRoot.Parent
    if not item or item:FindFirstChild("Humanoid") then return end

    getgenv().LiveItemCache[item] = obj
end

Workspace.DescendantAdded:Connect(function(descendant)
    task.delay(0.1, function() InspectAndCacheObject(descendant) end)
end)

task.spawn(function()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        InspectAndCacheObject(obj)
    end
end)

local function GetAvailableItems()
    local validItems = {}
    
    for item, prompt in pairs(getgenv().LiveItemCache) do
        if item and item.Parent and prompt and prompt.Parent and prompt.Enabled then
            table.insert(validItems, item)
        else
            getgenv().LiveItemCache[item] = nil
        end
    end
    
    return validItems
end

local function TeleportAndPickup(item)
    if not item then return end
    local rootPart = GetRootPart()
    if not rootPart then return end

    local prompt = getgenv().LiveItemCache[item]
    local itemRoot = item:FindFirstChild("ItemRoot")
    if not itemRoot or not prompt then return end

    local oldCFrame = rootPart.CFrame
    rootPart.CFrame = itemRoot.CFrame
    task.wait(0.25)
    
    pcall(function() 
        local oldLOS = prompt.RequiresLineOfSight
        prompt.RequiresLineOfSight = false
        fireproximityprompt(prompt) 
        
        task.delay(0.1, function()
            if prompt and prompt.Parent then prompt.RequiresLineOfSight = oldLOS end
        end)
    end)
    
    task.wait(0.3)
    rootPart.CFrame = oldCFrame
end

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

local function ProcessAutoPickup()
    if not IsSurvivor() then return end
    
    if getgenv().AutoPickupNearest then
        PickUpNearestItem()
    elseif getgenv().AutoPickupSelected and getgenv().SelectedItemToPickup then
        PickUpSpecificItem(getgenv().SelectedItemToPickup)
    end
end

task.spawn(function()
    while task.wait(0.8) do
        ProcessAutoPickup()
    end
end)

local ItemDropdown 
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
            
            local newHash = table.concat(uniqueNames, ",")
            if getgenv().CachedItemHash ~= newHash then
                getgenv().CachedItemHash = newHash
                
                pcall(function() ItemDropdown:SetValues(uniqueNames) end)
                pcall(function() ItemDropdown:Refresh(uniqueNames) end)
            end
        end
    end
end)

ItemDropdown = Sections.Items:Dropdown({
    Title = "hutaohub:Select_Item",
    Desc = "hutaohub:Select_Item_Desc",
    Flag = "Select Pickup Item",
    Values = {},
    Value = nil,
    Callback = function(value)
        getgenv().SelectedItemToPickup = value
    end
})

Sections.Items:Button({
    Title = "hutaohub:Pick_Up_Selected_Item",
    Desc = "hutaohub:Pick_Up_Selected_Item_Desc",
    Callback = function()
        if IsSurvivor() and getgenv().SelectedItemToPickup then
            PickUpSpecificItem(getgenv().SelectedItemToPickup)
        end
    end
})

Sections.Items:Button({
    Title = "hutaohub:Pick_Up_Random_Item",
    Desc = "hutaohub:Pick_Up_Random_Item_Desc",
    Callback = function()
        if IsSurvivor() then
            PickUpRandomItem()
        end
    end
})

Sections.Items:Toggle({
    Title = "hutaohub:Auto_PickUp_Selected_Item",
    Desc = "hutaohub:Auto_PickUp_Selected_Item_Desc",
    Flag = "Auto PickUp Selected",
    Value = false,
    Callback = function(state)
        getgenv().AutoPickupSelected = state
    end
})

Sections.Items:Toggle({
    Title = "hutaohub:Auto_PickUp_Nearest_Item",
    Desc = "hutaohub:Auto_PickUp_Nearest_Item_Desc",
    Flag = "Auto PickUp Nearest",
    Value = false,
    Callback = function(state)
        getgenv().AutoPickupNearest = state
    end
})

_G.SilentAimEnabled = false
_G.SilentAimOffMode = "Mouse"   -- Mặc định: "Mouse" hoặc "Center"

-- Dropdown chọn chế độ khi tắt Silent Aim
local offModes = {"Mouse", "Center"}
Sections.SilentAim:Dropdown({
    Title = "hutaohub:Normal_Aim_Style",
    Desc = "hutaohub:Normal_Aim_Style_Desc",
    Flag = "NormalAimStyle",
    Values = offModes,
    Value = "Mouse",
    Callback = function(selected)
        _G.SilentAimOffMode = selected
    end
})

Sections.SilentAim:Toggle({
    Title = "hutaohub:Dusekkar_Aim",
    Desc = "hutaohub:Dusekkar_Aim_Desc",
    Flag = "DusekkarAimDesc",
    Default = false,
    Callback = function(State)
        _G.SilentAimEnabled = State
    end
})

-- ============== CORE LOGIC MỚI (KẾT HỢP TINH HOA CODE 1) ==============

-- Hàm tìm đầu kẻ địch gần tâm nhất dựa trên GÓC THỰC (FOV ~30°) - Pro chuẩn Code 1
local function getClosestEnemyHeadByFOV()
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    
    local viewportSize = cam.ViewportSize
    if viewportSize.X <= 0 or viewportSize.Y <= 0 then return nil end
    
    local ray = cam:ViewportPointToRay(viewportSize.X / 2, viewportSize.Y / 2, 0)
    local rayOrigin = ray.Origin
    local rayDirection = ray.Direction * 999
    
    local closestPlayerPos = nil
    local shortestDistance = math.huge
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer then
            local character = plr.Character
            if character then
                local head = character:FindFirstChild("Head")
                local hum = character:FindFirstChild("Humanoid")
                if head and hum and hum.Health > 0 then
                    local headPos = head.Position
                    local distance = (headPos - rayOrigin).Magnitude
                    local direction = (headPos - rayOrigin).Unit
                    local angle = math.acos(math.clamp(direction:Dot(rayDirection.Unit), -1, 1))
                    
                    -- FOV giới hạn 0.5 rad (~28.6°) - bắn cực chặt, không hút láo
                    if angle < 0.5 and distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayerPos = headPos
                    end
                end
            end
        end
    end
    
    return closestPlayerPos
end

-- Hàm lấy vị trí ngắm từ giữa màn hình (dùng cho chế độ Center khi tắt Silent Aim)
local function getCenterScreenPosition()
    local cam = workspace.CurrentCamera
    if cam and cam.CFrame then
        return cam.CFrame.Position + cam.CFrame.LookVector * 100
    end
    -- Fallback vào vị trí nhân vật
    local char = localPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart
        return root.Position + root.CFrame.LookVector * 10
    end
    return Vector3.new(0, 10, 0)
end

-- Hook trực tiếp vào module GetPlayerMousePosition (không cần pcall, không cần _alreadyPatched)
local function applySilentAimHook()
    local path = ReplicatedStorage:FindFirstChild("Systems")
        and ReplicatedStorage.Systems:FindFirstChild("Player")
        and ReplicatedStorage.Systems.Player:FindFirstChild("Miscellaneous")
        and ReplicatedStorage.Systems.Player.Miscellaneous:FindFirstChild("GetPlayerMousePosition")
    if not path then return end
    
    local module = require(path)
    local originalGetMousePos = module.GetMousePos
    if not originalGetMousePos then return end
    
    -- Bảo vệ hook chỉ gắn một lần (dùng cờ nhẹ)
    if module.__silentAimHooked then return end
    module.__silentAimHooked = true
    
    hookfunction(originalGetMousePos, function(...)
        if _G.SilentAimEnabled then
            local targetHead = getClosestEnemyHeadByFOV()
            if targetHead then
                return targetHead
            end
            -- Nếu không có mục tiêu trong FOV, trả về vị trí gốc (giữ nguyên tâm hoặc chuột)
        end
        
        if not _G.SilentAimEnabled then
            if _G.SilentAimOffMode == "Center" then
                return getCenterScreenPosition()
            else -- "Mouse"
                return originalGetMousePos(...)
            end
        end
        
        -- Trường hợp bật nhưng không có target -> gọi hàm gốc
        return originalGetMousePos(...)
    end)
end

-- Kích hoạt hook ngay lập tức
applySilentAimHook()

-- Dự phòng: nếu nhân vật chết/respawn, module có thể load lại, ta hook lại một lần duy nhất sau 1 giây
localPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    applySilentAimHook()
end)

if not getgenv().EliotSettings then
    getgenv().EliotSettings = {
        PizzaAimbotEnabled = false,
        AimDistance = 100,
        AimOffset = 2,
        AutoEatPizzaEnabled = false,
        EatPizzaHPThreshold = 30,
        AimDuration = 0.8,
    }
end

local Cfg = getgenv().EliotSettings
local API = getgenv().EliotAPI or {}

Sections.Eliot:Toggle({
    Title = "hutaohub:Pizza_Aimbot",
    Desc = "hutaohub:Pizza_Aimbot_Desc",
    Flag = "PizzaAimbot",
    Value = Cfg.PizzaAimbotEnabled,
    Callback = function(v)
        Cfg.PizzaAimbotEnabled = v
        if API.SetPizzaAimbot then API.SetPizzaAimbot(v) end
    end
})

Sections.Eliot:Input({
    Title = "hutaohub:Aim_Distance",
    Desc = "hutaohub:Aim_Distance_Eliot",
    Flag = "PizzaAimDistance",
    Value = Cfg.AimDistance,
    Callback = function(v)
        local num = tonumber(v)
        if num then
            Cfg.AimDistance = num
            if API.SetAimDistance then API.SetAimDistance(num) end
        end
    end
})

Sections.Eliot:Input({
    Title = "hutaohub:Aim_Offset",
    Desc = "hutaohub:Aim_Offset_Desc",
    Flag = "PizzaAimOffset",
    Value = Cfg.AimOffset,
    Callback = function(v)
        local num = tonumber(v)
        if num then
            Cfg.AimOffset = num
            if API.SetAimOffset then API.SetAimOffset(num) end
        end
    end
})

Sections.Eliot:Input({
    Title = "hutaohub:Aim_Duration",
    Desc = "hutaohub:Aim_Duration_Eliot",
    Flag = "PizzaAimDuration",
    Value = Cfg.AimDuration,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.AimDuration = num
            if API.SetAimDuration then API.SetAimDuration(num) end
        end
    end
})

Sections.Eliot:Toggle({
    Title = "hutaohub:Auto_Eat_Pizza",
    Desc = "hutaohub:Auto_Eat_Pizza_Desc",
    Flag = "AutoEatPizza",
    Value = Cfg.AutoEatPizzaEnabled,
    Callback = function(v)
        Cfg.AutoEatPizzaEnabled = v
        if API.SetAutoEatPizza then API.SetAutoEatPizza(v) end
    end
})

Sections.Eliot:Input({
    Title = "hutaohub:HP_Threshold",
    Desc = "hutaohub:HP_Threshold_Eliot",
    Flag = "EatPizzaHP",
    Value = Cfg.EatPizzaHPThreshold,
    Callback = function(v)
        local num = tonumber(v)
        if num then
            Cfg.EatPizzaHPThreshold = num
            if API.SetHPThreshold then API.SetHPThreshold(num) end
        end
    end
})

if not getgenv().InvisSettings then
    getgenv().InvisSettings = {
        InstantEnabled = false,
        CloneEnabled = false
    }
end

local Cfg = getgenv().InvisSettings
local API = getgenv().InvisAPI or {}

Sections.Clone007n7:Toggle({
    Title = "hutaohub:Instant_Invisible",
    Desc = "hutaohub:Instant_Invisible_Desc",
    Flag = "Instant Invisible",
    Value = Cfg.InstantEnabled,
    Callback = function(val)
        Cfg.InstantEnabled = val
        if API.SetInstant then API.SetInstant(val) end
    end
})

Sections.Clone007n7:Toggle({
    Title = "hutaohub:Invisible_If_Cloned",
    Desc = "hutaohub:Invisible_If_Cloned_Desc",
    Flag = "Invisible If Cloned",
    Value = Cfg.CloneEnabled,
    Callback = function(val)
        Cfg.CloneEnabled = val
        if API.SetClone then API.SetClone(val) end
    end
})

-- Đảm bảo getgenv().ShedletskySettings tồn tại
if not getgenv().ShedletskySettings then
    getgenv().ShedletskySettings = {
        AutoSlashEnabled = false,
        SlashRadius = 10,
        SetSlashTime = 1,
        AutoChickenEnabled = false,
        ChickenHPThreshold = 40,
        ChickenDistance = 100,
    }
end

local Cfg = getgenv().ShedletskySettings
local API = getgenv().ShedletskyAPI or {}

Sections.Shedletsky:Toggle({
    Title = "hutaohub:Auto_Slash",
    Desc = "hutaohub:Auto_Slash_Desc",
    Flag = "AutoSlash",
    Value = Cfg.AutoSlashEnabled,
    Callback = function(state)
        Cfg.AutoSlashEnabled = state
        if API.SetAutoSlash then API.SetAutoSlash(state) end
    end
})

Sections.Shedletsky:Input({
    Title = "hutaohub:Slash_Radius",
    Desc = "hutaohub:Slash_Radius_Desc",
    Flag = "SlashRadius",
    Value = Cfg.SlashRadius,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.SlashRadius = num
            if API.SetSlashRadius then API.SetSlashRadius(num) end
        end
    end
})

Sections.Shedletsky:Input({
    Title = "hutaohub:Set_Slash_Delay",
    Desc = "hutaohub:Set_Slash_Delay_Desc",
    Flag = "SetSlashTime",
    Value = Cfg.SetSlashTime,
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 0 then
            Cfg.SetSlashTime = num
            if API.SetSlashTime then API.SetSlashTime(num) end
        end
    end
})

Sections.Shedletsky:Toggle({
    Title = "hutaohub:Auto_Eat_Chicken",
    Desc = "hutaohub:Auto_Eat_Chicken_Desc",
    Flag = "AutoEatChicken",
    Value = Cfg.AutoChickenEnabled,
    Callback = function(state)
        Cfg.AutoChickenEnabled = state
        if API.SetAutoChicken then API.SetAutoChicken(state) end
    end
})

Sections.Shedletsky:Input({
    Title = "hutaohub:HP_Threshold",
    Desc = "hutaohub:HP_Threshold_Desc",
    Flag = "ChickenHPThreshold",
    Value = Cfg.ChickenHPThreshold,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.ChickenHPThreshold = num
            if API.SetChickenHP then API.SetChickenHP(num) end
        end
    end
})

Sections.Shedletsky:Input({
    Title = "hutaohub:Safe_Distance",
    Desc = "hutaohub:Safe_Distance_Desc",
    Flag = "ChickenDistance",
    Value = Cfg.ChickenDistance,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.ChickenDistance = num
            if API.SetChickenDistance then API.SetChickenDistance(num) end
        end
    end
})

-- Đảm bảo getgenv().TwoTimeDaggerSettings tồn tại
if not getgenv().TwoTimeDaggerSettings then
    getgenv().TwoTimeDaggerSettings = {
        AutoDaggerEnabled = false,
        AimDaggerEnabled = false,
        AimDaggerMode = "LookVector",
        DaggerRadius = 4,
        DashEnabled = false,
        DashSpeed = 50
    }
end

local Cfg = getgenv().TwoTimeDaggerSettings
local API = getgenv().TwoTimeDaggerAPI or {}

Sections.TwoTime:Toggle({
    Title = "hutaohub:Auto_Dagger",
    Desc = "hutaohub:Auto_Dagger_Desc",
    Flag = "AutoDagger",
    Value = Cfg.AutoDaggerEnabled,
    Callback = function(state)
        Cfg.AutoDaggerEnabled = state
        if API.SetAutoDagger then API.SetAutoDagger(state) end
    end
})

Sections.TwoTime:Toggle({
    Title = "hutaohub:Aim_Dagger",
    Desc = "hutaohub:Aim_Dagger_Desc",
    Flag = "AimDagger",
    Value = Cfg.AimDaggerEnabled,
    Callback = function(state)
        Cfg.AimDaggerEnabled = state
        if API.SetAimDagger then API.SetAimDagger(state) end
    end
})

Sections.TwoTime:Dropdown({
    Title = "hutaohub:Aim_Dagger_Mode",
    Desc = "hutaohub:Aim_Dagger_Mode_Desc",
    Flag = "AimDaggerMode",
    Values = {"LookVector", "TPBack"},
    Value = Cfg.AimDaggerMode,
    Callback = function(value)
        Cfg.AimDaggerMode = value
        if API.SetAimMode then API.SetAimMode(value) end
    end
})

Sections.TwoTime:Input({
    Title = "hutaohub:Dagger_Radius",
    Desc = "hutaohub:Dagger_Radius_Desc",
    Flag = "DaggerRadius",
    Value = Cfg.DaggerRadius,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.DaggerRadius = num
            if API.SetRadius then API.SetRadius(num) end
        end
    end
})

Sections.TwoTime:Toggle({
    Title = "hutaohub:Dash_After_Dagger",
    Desc = "hutaohub:Dash_After_Dagger_Desc",
    Flag = "DashDagger",
    Value = Cfg.DashEnabled,
    Callback = function(state)
        Cfg.DashEnabled = state
        if API.SetDash then API.SetDash(state) end
    end
})

Sections.TwoTime:Input({
    Title = "hutaohub:Dash_Speed",
    Desc = "hutaohub:Dash_Speed_Desc",
    Flag = "DashDaggerSpeed",
    Value = Cfg.DashSpeed,
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            Cfg.DashSpeed = num
            if API.SetDashSpeed then API.SetDashSpeed(num) end
        end
    end
})

local dusekkarAimbotEnabled = false
local dusekkarAimMode = "Survivor"
local dusekkarAiming = false
local dusekkarHumanoid = nil
local dusekkarAimConnection = nil
local dusekkarAimDelay = 0.5
local dusekkarAnimIds = {"77894750279891", "118933622288262"}
local dusekkarHealthPenalty = 1000

local function getTargetFromFolder(folder, hrp, char)
    local bestTarget = nil
    local bestScore = math.huge

    for _, obj in ipairs(folder:GetChildren()) do
        if obj:IsA("Model") and obj ~= char then
            local targetHRP = obj:FindFirstChild("HumanoidRootPart")
            local targetHum = obj:FindFirstChildOfClass("Humanoid")
            if targetHRP and targetHum and targetHum.Health > 0 then
                local distSq = (targetHRP.Position - hrp.Position).Magnitude^2
                local healthRatio = targetHum.Health / math.max(targetHum.MaxHealth, 1)
                local score = distSq + dusekkarHealthPenalty * healthRatio
                if score < bestScore then
                    bestScore = score
                    bestTarget = targetHRP
                end
            end
        end
    end
    return bestTarget
end

local function dusekkarGetNearestTarget()
    local char = localPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    if dusekkarAimMode == "Survivor" then
        return getTargetFromFolder(survivorsFolder, hrp, char)
    elseif dusekkarAimMode == "Killer" then
        return getTargetFromFolder(killersFolder, hrp, char)
    else
        local t1 = getTargetFromFolder(survivorsFolder, hrp, char)
        local t2 = getTargetFromFolder(killersFolder, hrp, char)
        return t1 or t2
    end
end

local function handleAnimationTrack(track)
    local animId = track.Animation.AnimationId:match("%d+")
    if table.find(dusekkarAnimIds, animId) then
        task.delay(dusekkarAimDelay, function()
            if dusekkarAimbotEnabled then dusekkarAiming = true end
        end)
        track.Stopped:Once(function() dusekkarAiming = false end)
    end
end

local function disconnectAim()
    if dusekkarAimConnection then
        pcall(function() dusekkarAimConnection:Disconnect() end)
        dusekkarAimConnection = nil
    end
end

local function setupCharacter(char)
    local humanoid = char:WaitForChild("Humanoid", 5)
    if not humanoid then return end
    dusekkarHumanoid = humanoid
    disconnectAim()

    if dusekkarAimbotEnabled then
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            dusekkarAimConnection = animator.AnimationPlayed:Connect(handleAnimationTrack)
        end
    end
end

RunService.RenderStepped:Connect(function()
    if not dusekkarAimbotEnabled or not dusekkarAiming or not dusekkarHumanoid then return end
    local targetHRP = dusekkarGetNearestTarget()
    if targetHRP then
        Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, targetHRP.Position)
    end
end)

Sections.Dusekkar:Dropdown({
    Title = "hutaohub:Aim_Plasma_Beam_Mode",
    Desc = "hutaohub:Aim_Plasma_Beam_Mode_Desc",
    Values = {"Survivor", "Killer", "Random"},
    Value = "Survivor",
    Callback = function(val) dusekkarAimMode = val end
})

Sections.Dusekkar:Toggle({
    Title = "hutaohub:Aim_Plasma_Beam",
    Desc = "hutaohub:Aim_Plasma_Beam_Desc",
    Value = false,
    Callback = function(state)
        dusekkarAimbotEnabled = state
        if not state then
            dusekkarAiming = false
            disconnectAim()
        elseif localPlayer.Character then
            setupCharacter(localPlayer.Character)
        end
    end
})

localPlayer.CharacterAdded:Connect(function(char)
    task.delay(1, setupCharacter, char)
end)

if not getgenv().VeeronicaSettings then
    getgenv().VeeronicaSettings = {
        Sk8ControlEnabled = false,
        AutoTrickEnabled = false,
    }
end

local S = getgenv().VeeronicaSettings
local API = getgenv().VeeronicaAPI or {}

Sections.Veeronica:Toggle({
    Title = "hutaohub:Sk8_Control",
    Desc = "hutaohub:Sk8_Control_Desc",
    Flag = "Sk8Control",
    Value = S.Sk8ControlEnabled,
    Callback = function(state)
        S.Sk8ControlEnabled = state
        if API.SetSk8Control then API.SetSk8Control(state) end
    end
})

Sections.Veeronica:Toggle({
    Title = "hutaohub:Auto_Trick_V4",
    Desc = "hutaohub:Auto_Trick_V4_Desc",
    Flag = "AutoTrickV3",
    Value = S.AutoTrickEnabled,
    Callback = function(state)
        S.AutoTrickEnabled = state
        if API.SetAutoTrick then API.SetAutoTrick(state) end
    end
})

Sections.Guest1337:Dropdown({
    Title = "hutaohub:Block_Mode",
    Desc = "hutaohub:Block_Mode_Desc",
    Flag = "Block Mode",
    Locked = false,
    Values = {"Default", "Pro"},
    Value = getgenv().BlockMode,
    Callback = function(value)
        getgenv().BlockMode = value
        -- Reset Pro state
        for player, data in pairs(activeAttackers) do
            for _, conn in pairs(data.endedConns) do conn:Disconnect() end
        end
        activeAttackers = {}
        lastProBlockTime = 0
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Auto_Block_Beta",
    Desc = "hutaohub:Auto_Block_Beta_Desc",
    Flag = "Auto Block",
    Value = getgenv().AutoBlock,
    Callback = function(v)
        getgenv().AutoBlock = v
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Range_Check",
    Desc = "hutaohub:Range_Check_Desc",
    Flag = "Range Check",
    Value = tostring(getgenv().RangeCheck),
    Callback = function(v)
        getgenv().RangeCheck = tonumber(v) or getgenv().RangeCheck
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Elevation_Range_Check",
    Desc = "hutaohub:Elevation_Range_Check_Desc",
    Flag = "Elevation Range Check",
    Value = tostring(getgenv().StubCheck),
    Callback = function(v)
        getgenv().StubCheck = tonumber(v) or getgenv().StubCheck
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Range_Hit_Circle",
    Desc = "hutaohub:Range_Hit_Circle_Desc",
    Flag = "Range Hit Circle",
    Value = tostring(getgenv().HitRange),
    Callback = function(v)
        getgenv().HitRange = tonumber(v) or getgenv().HitRange
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Pro_Block_Cooldown",
    Desc = "hutaohub:Pro_Block_Cooldown_Desc",
    Flag = "Pro Cooldown",
    Value = tostring(getgenv().ProBlockCooldown),
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 0 then
            getgenv().ProBlockCooldown = num
        end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Pro_Sound_Threshold",
    Desc = "hutaohub:Pro_Sound_Threshold_Desc",
    Flag = "Pro Sound Threshold",
    Value = tostring(getgenv().ProSoundThreshold),
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 0 and num <= 1 then
            getgenv().ProSoundThreshold = num
        end
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Wall_Check",
    Desc = "hutaohub:Wall_Check_Desc",
    Flag = "Wall Check",
    Value = getgenv().WallCheck,
    Callback = function(v)
        getgenv().WallCheck = v
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Show_Hit_Circle",
    Desc = "hutaohub:Show_Hit_Circle_Desc",
    Flag = "Hit Circle",
    Value = getgenv().UseHitCircle,
    Callback = function(v)
        getgenv().UseHitCircle = v
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Show_Circle",
    Desc = "hutaohub:Show_Circle_Desc",
    Flag = "Show Circle",
    Value = getgenv().ShowCircle,
    Callback = function(v)
        getgenv().ShowCircle = v
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Elevation_Check",
    Desc = "hutaohub:Elevation_Check_Desc",
    Flag = "Elevation Check",
    Value = getgenv().StubCheckEnabled,
    Callback = function(v)
        getgenv().StubCheckEnabled = v
    end
})

if not getgenv().AutoPunchSettings then
    getgenv().AutoPunchSettings = {
        AimMode = "Character",
        AutoPunchEnabled = false,
        AimbotPunchEnabled = true,
        UseDistanceCheck = false,
        PunchDistance = 30,
        DelayTime = 1,
        AimDuration = 1,
        CameraAimSpeed = 10,
        DashPunchEnabled = false,
        DashRange = 30,
        DashSpeed = 100,
        DashDelay = 0.8,
    }
end

local S = getgenv().AutoPunchSettings
local API = getgenv().AutoPunchAPI or {}  -- Sẽ có nếu logic đã load

Sections.Guest1337:Dropdown({
    Title = "hutaohub:Punch_Aim_Mode",
    Desc = "hutaohub:Punch_Aim_Mode_Desc",
    Flag = "PunchAimMode",
    Values = {"Character", "Camera", "CharacterDelay"},
    Value = S.AimMode,
    Callback = function(v)
        S.AimMode = v
        if API.SetAimMode then API.SetAimMode(v) end
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Auto_Punch_Beta",
    Desc = "hutaohub:Auto_Punch_Beta_Desc",
    Flag = "AutoPunch",
    Value = S.AutoPunchEnabled,
    Callback = function(val)
        S.AutoPunchEnabled = val
        if API.SetAutoPunch then API.SetAutoPunch(val) end
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Aimbot_Punch",
    Desc = "hutaohub:Aimbot_Punch_Desc",
    Flag = "AimbotPunch",
    Value = S.AimbotPunchEnabled,
    Callback = function(val)
        S.AimbotPunchEnabled = val
        if API.SetAimbot then API.SetAimbot(val) end
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Dash_Punch",
    Desc = "hutaohub:Dash_Punch_Desc",
    Flag = "DashPunch",
    Value = S.DashPunchEnabled,
    Callback = function(val)
        S.DashPunchEnabled = val
        if API.SetDashPunch then API.SetDashPunch(val) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Dash_Range",
    Desc = "hutaohub:Dash_Range_Desc",
    Flag = "DashRange",
    Value = S.DashRange,
    Callback = function(v)
        S.DashRange = tonumber(v) or 30
        if API.SetDashRange then API.SetDashRange(v) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Dash_Speed",
    Desc = "hutaohub:Dash_Speed_Desc",
    Flag = "DashSpeed",
    Value = S.DashSpeed,
    Callback = function(v)
        S.DashSpeed = tonumber(v) or 50
        if API.SetDashSpeed then API.SetDashSpeed(v) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Dash_Delay",
    Desc = "hutaohub:Dash_Delay_Desc",
    Flag = "DashDelay",
    Value = S.DashDelay,
    Callback = function(v)
        S.DashDelay = tonumber(v) or 0.1
        if API.SetDashDelay then API.SetDashDelay(v) end
    end
})

Sections.Guest1337:Toggle({
    Title = "hutaohub:Distance_Check",
    Desc = "hutaohub:Distance_Check_Desc",
    Flag = "UseDistanceCheck",
    Value = S.UseDistanceCheck,
    Callback = function(val)
        S.UseDistanceCheck = val
        if API.SetUseDistanceCheck then API.SetUseDistanceCheck(val) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Punch_Distance",
    Desc = "hutaohub:Punch_Distance_Desc",
    Flag = "PunchDistance",
    Value = S.PunchDistance,
    Callback = function(v)
        S.PunchDistance = tonumber(v) or 10
        if API.SetPunchDistance then API.SetPunchDistance(v) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Mode_Delay",
    Desc = "hutaohub:Mode_Delay_Desc",
    Flag = "DelayTime",
    Value = S.DelayTime,
    Callback = function(v)
        S.DelayTime = tonumber(v) or 0.5
        if API.SetDelayTime then API.SetDelayTime(v) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Aim_Duration",
    Desc = "hutaohub:Aim_Duration_Desc",
    Flag = "AimDuration",
    Value = S.AimDuration,
    Callback = function(v)
        S.AimDuration = tonumber(v) or 1
        if API.SetAimDuration then API.SetAimDuration(v) end
    end
})

Sections.Guest1337:Input({
    Title = "hutaohub:Camera_Aim_Speed",
    Desc = "hutaohub:Camera_Aim_Speed_Desc",
    Flag = "CameraAimSpeed",
    Value = S.CameraAimSpeed,
    Callback = function(v)
        S.CameraAimSpeed = tonumber(v) or 8
        if API.SetCameraAimSpeed then API.SetCameraAimSpeed(v) end
    end
})

if not getgenv().ChanceSettings then
    getgenv().ChanceSettings = {
        AimbotActive = false,
        AimUseOffset = false,
        PredictionMode = "Speed",
        AimMode = "Normal",
        AimDuration = 1.7,
        AimFasterDuration = 1.5,
        AimSpinDuration = 0.5,
        AutoCoinflip = false,
        CoinflipTargetCharge = 3,
        CoinflipBlockWhenClose = true,
        CoinflipBlockDist = 50,
    }
end

local Cfg = getgenv().ChanceSettings
local API = getgenv().ChanceAPI or {}

Sections.Chance:Toggle({
    Title = "hutaohub:Auto_Aim_Shoot",
    Desc = "hutaohub:Auto_Aim_Shoot_Desc",
    Flag = "AutoAimShoot",
    Value = Cfg.AimbotActive,
    Callback = function(v)
        Cfg.AimbotActive = v
        if API.SetAimbot then API.SetAimbot(v) end
    end
})

Sections.Chance:Dropdown({
    Title = "hutaohub:Aim_Mode",
    Desc = "hutaohub:Aim_Mode_Desc",
    Flag = "AimModeChance",
    Values = {"Normal", "Faster", "Reflex"},
    Value = Cfg.AimMode,
    Callback = function(v)
        Cfg.AimMode = v
        if API.SetAimMode then API.SetAimMode(v) end
    end
})

Sections.Chance:Dropdown({
    Title = "hutaohub:Prediction_Mode",
    Desc = "hutaohub:Prediction_Mode_Desc",
    Flag = "PredictionMode",
    Values = {"Speed", "Ping", "front", "No Lag"},
    Value = Cfg.PredictionMode,
    Callback = function(v)
        Cfg.PredictionMode = v
        if API.SetPrediction then API.SetPrediction(v) end
    end
})

Sections.Chance:Toggle({
    Title = "hutaohub:Enable_Offset",
    Desc = "hutaohub:Enable_Offset_Desc",
    Flag = "EnableOffset",
    Value = Cfg.AimUseOffset,
    Callback = function(v)
        Cfg.AimUseOffset = v
        if API.SetOffset then API.SetOffset(v) end
    end
})

Sections.Chance:Toggle({
    Title = "hutaohub:Auto_Coin_Flip",
    Desc = "hutaohub:Auto_Coin_Flip_Desc",
    Flag = "AutoCoinFlip",
    Value = Cfg.AutoCoinflip,
    Callback = function(v)
        Cfg.AutoCoinflip = v
        if API.SetCoinflip then API.SetCoinflip(v) end
    end
})

Sections.Chance:Dropdown({
    Title = "hutaohub:Coinflip_Target",
    Desc = "hutaohub:Coinflip_Target_Desc",
    Flag = "CoinflipTarget",
    Values = {"1 Point", "2 Point", "3 Point"},
    Value = tostring(Cfg.CoinflipTargetCharge).." Point",
    Callback = function(v)
        local num = tonumber(v:match("%d+"))
        if num then
            Cfg.CoinflipTargetCharge = num
            if API.SetTargetCharge then API.SetTargetCharge(num) end
        end
    end
})

Sections.Chance:Toggle({
    Title = "hutaohub:Safe_Coinflip",
    Desc = "hutaohub:Safe_Coinflip_Desc",
    Flag = "AntiKillersCoinflip",
    Value = Cfg.CoinflipBlockWhenClose,
    Callback = function(v)
        Cfg.CoinflipBlockWhenClose = v
        if API.SetBlockWhenClose then API.SetBlockWhenClose(v) end
    end
})

Sections.Chance:Input({
    Title = "hutaohub:Safe_Coinflip_Distance",
    Desc = "hutaohub:Safe_Coinflip_Distance_Desc",
    Flag = "SafeCoinflip",
    Value = Cfg.CoinflipBlockDist,
    Callback = function(v)
        local num = tonumber(v)
        if num then
            Cfg.CoinflipBlockDist = num
            if API.SetBlockDist then API.SetBlockDist(num) end
        end
    end
})

getgenv().AutoAbilityEnabled = getgenv().AutoAbilityEnabled or false
getgenv().AutoAbilityRange = getgenv().AutoAbilityRange or 25
getgenv().AutoUseAllSkills = getgenv().AutoUseAllSkills or true

getgenv().AutoRagingPace = getgenv().AutoRagingPace or false
getgenv().AutoPizzaDelivery = getgenv().AutoPizzaDelivery or false
getgenv().Auto404Error = getgenv().Auto404Error or false
getgenv().AutoUnstableEye = getgenv().AutoUnstableEye or false
getgenv().AutoBloodHunt = getgenv().AutoBloodHunt or false

getgenv().AutoActiveButton = getgenv().AutoActiveButton or false

local AbilityButtons = {"Carving Slash", "Slash", "Punch", "Stab"}

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

local function ProcessAbilityContainer(container)
    if getgenv().AutoUseAllSkills and getgenv().AutoKillerFarm then
        for _, obj in ipairs(container:GetChildren()) do
            if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                FireButton(obj)
            end
        end
    end

    if getgenv().AutoAbilityEnabled and HasSurvivorInRange(getgenv().AutoAbilityRange) then
        for _, name in ipairs(AbilityButtons) do
            local btn = container:FindFirstChild(name)
            if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then
                FireButton(btn)
            end
        end
    end

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

task.spawn(function()
    while task.wait(0.1) do
        ProcessAutoAbilities()
        ProcessQTEActiveButton()
    end
end)

Sections.AutoAttack:Input({
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

Sections.AutoAttack:Toggle({
    Title = "hutaohub:Auto_Attack_Survivors",
    Desc = "hutaohub:Auto_Attack_Survivors_Desc",
    Flag = "AutoAbilityToggle",
    Value = false,
    Callback = function(state)
        getgenv().AutoAbilityEnabled = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_Use_All_Skills",
    Desc = "hutaohub:Auto_Use_All_Skills_Desc",
    Flag = "AutoUseAllSkills",
    Value = true,
    Callback = function(state)
        getgenv().AutoUseAllSkills = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_RagingPace",
    Desc = "hutaohub:Auto_RagingPace_Desc",
    Flag = "AutoRagingPace",
    Value = false,
    Callback = function(state)
        getgenv().AutoRagingPace = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_PizzaDelivery",
    Desc = "hutaohub:Auto_PizzaDelivery_Desc",
    Flag = "AutoPizzaDelivery",
    Value = false,
    Callback = function(state)
        getgenv().AutoPizzaDelivery = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_404Error",
    Desc = "hutaohub:Auto_404Error_Desc",
    Flag = "Auto404Error",
    Value = false,
    Callback = function(state)
        getgenv().Auto404Error = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_UnstableEye",
    Desc = "hutaohub:Auto_UnstableEye_Desc",
    Flag = "AutoUnstableEye",
    Value = false,
    Callback = function(state)
        getgenv().AutoUnstableEye = state
    end
})

Sections.AutoSkill:Toggle({
    Title = "hutaohub:Auto_BloodHunt",
    Desc = "hutaohub:Auto_BloodHunt_Desc",
    Flag = "AutoBloodHunt",
    Value = false,
    Callback = function(state)
        getgenv().AutoBloodHunt = state
    end
})

Sections.Nosferatu:Toggle({
    Title = "hutaohub:Auto_Complete_Mini_Game",
    Desc = "hutaohub:Auto_Complete_Mini_Game_Desc",
    Flag = "AutoActiveButtonQTE",
    Value = false,
    Callback = function(state)
        getgenv().AutoActiveButton = state
    end
})

getgenv().AimbotExtra = getgenv().AimbotExtra or false
getgenv().AimbotMain = getgenv().AimbotMain or false
getgenv().AimbotAlt = getgenv().AimbotAlt or false

local playExtra, playMain, playAlt = false, false, false
local tarExtra, tarMain, tarAlt = nil, nil, nil

local soundMaps = {
    extra = { ["120038054863702"] = true },
    main = { ["105934041806374"] = true, ["132331977491979"] = true },
    alt = { ["70845653728841"] = true }
}

local function isKiller()
    return playerCharacter and playerCharacter.Parent == killersFolder
end

local function getClosestSurvivor()
    if not playerCharacter then return nil end
    local root = playerCharacter:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local closest, dist = nil, math.huge

    for _, plr in ipairs(survivorsFolder:GetChildren()) do
        if plr ~= playerCharacter and plr:IsA("Model") then
            local plrRoot = plr:FindFirstChild("HumanoidRootPart")
            if plrRoot then
                local d = (root.Position - plrRoot.Position).Magnitude
                if d < dist then
                    dist = d
                    closest = plr
                end
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

local function setAutoRotate(state)
    if not playerCharacter then return end
    local humanoid = playerCharacter:FindFirstChild("Humanoid")
    if humanoid and humanoid.AutoRotate ~= state then
        humanoid.AutoRotate = state
    end
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

    root.CFrame = root.CFrame:Lerp(goal, 0.99)
end

local function ProcessAimbotLogic()
    if not isKiller() then return end

    local isAimingThisFrame = false

    if getgenv().AimbotExtra then
        local soundNow = checkSound(soundMaps.extra)
        if soundNow and not playExtra then
            playExtra = true
            tarExtra = getClosestSurvivor()
        end
        if playExtra then
            if tarExtra and tarExtra.Parent then 
                face(tarExtra) 
                isAimingThisFrame = true
            end
            if not soundNow then
                playExtra, tarExtra = false, nil
            end
        end
    end

    if getgenv().AimbotMain then
        local soundNow = checkSound(soundMaps.main)
        if soundNow and not playMain then
            playMain = true
            tarMain = getClosestSurvivor()
        end
        if playMain then
            if tarMain and tarMain.Parent then 
                face(tarMain) 
                isAimingThisFrame = true
            end
            if not soundNow then
                playMain, tarMain = false, nil
            end
        end
    end

    if getgenv().AimbotAlt then
        local soundNow = checkSound(soundMaps.alt)
        if soundNow and not playAlt then
            playAlt = true
            tarAlt = getClosestSurvivor()
        end
        if playAlt then
            if tarAlt and tarAlt.Parent then 
                face(tarAlt) 
                isAimingThisFrame = true
            end
            if not soundNow then
                playAlt, tarAlt = false, nil
            end
        end
    end

    setAutoRotate(not isAimingThisFrame)
end

task.spawn(function()
    while task.wait(0.05) do
        ProcessAimbotLogic()
    end
end)

Sections.Nosferatu:Toggle({
    Title = "hutaohub:Bloodhook_Aimbot", 
    Desc = "hutaohub:Bloodhook_Aimbot_Desc",
    Flag = "Bloodhook Aimbot",
    Value = false,
    Callback = function(state)
        getgenv().AimbotExtra = state
    end
})

Sections.is1x1x1x1:Toggle({
    Title = "hutaohub:MassInfection_Aimbot",
    Desc = "hutaohub:Massinfection_Entanglement_Desc",
    Flag = "MassInfection Aimbot",
    Value = false,
    Callback = function(state)
        getgenv().AimbotMain = state
    end
})

Sections.is1x1x1x1:Toggle({
    Title = "hutaohub:Entanglement_Aimbot",
    Desc = "hutaohub:Massinfection_Entanglement_Desc",
    Flag = "Entanglement",
    Value = false,
    Callback = function(state)
        getgenv().AimbotAlt = state
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

Sections.Noli:Toggle({ 
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

Sections.Noli:Toggle({ 
    Title = "hutaohub:Void_Rush_Aimbot",
    Desc = "hutaohub:Void_Rush_Aimbot_Desc",
    Flag = "Void Rush Aimbot",
    Value = false,
    Callback = function(s) VoidRushController.Aimbot = s end 
})

Sections.Noli:Toggle({ 
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

Sections.c00lkidd:Toggle({ 
    Title = "hutaohub:Walkspeed_Override_Controller",
    Desc = "hutaohub:Walkspeed_Override_Controller_Desc",
    Flag = "Walkspeed Override Controller",
    Value = false,
    Callback = function(s) enabled = s end 
})

Sections.c00lkidd:Toggle({ 
    Title = "hutaohub:Walkspeed_Override_Aimbot",
    Desc = "hutaohub:Walkspeed_Override_Aimbot_Desc",
    Flag = "Walk Speed Override Aimbot",
    Value = false,
    Callback = function(s) aimEnabled = s end 
})

Sections.c00lkidd:Toggle({ 
    Title = "hutaohub:Radar_360_Wall_Check",
    Desc = "hutaohub:Radar_360_Wall_Check_Desc",
    Flag = "Redar wall check",
    Value = false,
    Callback = function(s) wallCheck = s end 
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

Sections.YouName:Input({
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

Sections.YouName:Toggle({
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

local function SetTouchControlsVisible(visible)
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")

    if not playerGui then
        return
    end

    for _, gui in ipairs(playerGui:GetDescendants()) do
        if gui:IsA("GuiObject") then
            local name = gui.Name:lower()

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

    SetTouchControlsVisible(false)

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

    if AntiStunState.MovementConnection then
        AntiStunState.MovementConnection:Disconnect()
        AntiStunState.MovementConnection = nil
    end

    AntiStunState.MovementConnection = RunService.RenderStepped:Connect(function()
        if humanoid and humanoid.Parent then
            humanoid:Move(Vector3.zero, true)

            local rootPart = humanoid.RootPart

            if rootPart then
                rootPart.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end)

    task.delay(duration or 0.2, function()
        if AntiStunState.MovementConnection then
            AntiStunState.MovementConnection:Disconnect()
            AntiStunState.MovementConnection = nil
        end

        ContextActionService:UnbindAction(BLOCK_ACTION_NAME)

        SetTouchControlsVisible(true)

        local currentHumanoid = playerCharacter and playerCharacter:FindFirstChildOfClass("Humanoid")

        if currentHumanoid then
            task.wait()

            currentHumanoid:Move(currentHumanoid.MoveDirection, true)
        end

        AntiStunState.ControlBlocked = false
    end)
end

local function BlockAnimations(character, duration)
    if AntiStunState.AnimationBlock then
        return
    end

    AntiStunState.AnimationBlock = true

    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end

        DisableCharacterControl(0.1)
    end

    task.delay(duration or 0.1, function()
        AntiStunState.AnimationBlock = false
    end)
end

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
                if isStunned and not AntiStunState.LastStun then
                    BlockAnimations(char, 0.1)

                    stunned.Value = 1
                end

                AntiStunState.LastStun = isStunned
            end)
        end
    else
        if AntiStunState.Connection then
            AntiStunState.Connection:Disconnect()
            AntiStunState.Connection = nil
        end

        if AntiStunState.MovementConnection then
            AntiStunState.MovementConnection:Disconnect()
            AntiStunState.MovementConnection = nil
        end

        ContextActionService:UnbindAction(BLOCK_ACTION_NAME)

        SetTouchControlsVisible(true)

        AntiStunState.AnimationBlock = false
        AntiStunState.LastStun = false
        AntiStunState.ControlBlocked = false
    end
end

Sections.AntiCC:Toggle({
    Title = "hutaohub:Anti_Stun",
    Desc = "hutaohub:Anti_Stun_Desc",
    Flag = "Anti-Stun",
    Value = false,
    Callback = function(enabled)
        ToggleAntiStun(enabled)
    end
})

localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

if not getgenv().KillerCamlockSettings then
    getgenv().KillerCamlockSettings = {
        Enabled = false,
        Target = nil,
        ZoomDistance = 10,
        HeightOffset = 1.5,
        AimPart = "Head",
        QuickGuiVisible = false
    }
end

local Cfg = getgenv().KillerCamlockSettings
local API = getgenv().KillerCamlockAPI or {}

-- 1. Toggle bật tắt tính năng Camlock chính
Sections.Camlock:Toggle({
    Title = "hutaohub:Camlock_Survivor",
    Desc = "hutaohub:Camlock_Survivor_Desc",
    Flag = "KillerCamlock",
    Value = Cfg.Enabled,
    Callback = function(state)
        Cfg.Enabled = state
        if API.Toggle then API.Toggle(state) end
    end
})

-- 2. Toggle ẩn hiện nút bấm nhanh trên màn hình di động (Đồng bộ hóa cao)
Sections.Camlock:Toggle({
    Title = "hutaohub:Show_Quick_Button",
    Desc = "hutaohub:Show_Quick_Button_Desc",
    Flag = "KillerCamlockQuickBtn",
    Value = Cfg.QuickGuiVisible,
    Callback = function(state)
        Cfg.QuickGuiVisible = state
        if API.SetQuickGuiVisible then API.SetQuickGuiVisible(state) end
    end
})

-- 3. ĐÃ FIX: Ô nhập tùy chỉnh độ cao Camlock thay thế cho Slider
Sections.Camlock:Input({
    Title = "hutaohub:Camera_Height",
    Desc = "hutaohub:Adjust_Cam_Vertical_Offset",
    Flag = "KillerCamHeight",
    Placeholder = "Ví dụ: 1.5",
    Value = tostring(Cfg.HeightOffset or 1.5),
    Callback = function(value)
        local num = tonumber(value) or 1.5 -- Nếu nhập lỗi hoặc để trống thì tự về 1.5
        Cfg.HeightOffset = num
        if API.SetHeightOffset then API.SetHeightOffset(num) end
    end
})

-- 4. Menu lựa chọn bộ phận ngắm bắn mục tiêu
Sections.Camlock:Dropdown({
    Title = "hutaohub:Aim_Part",
    Desc = "hutaohub:Aim_Part_Desc",
    Flag = "KillerAimPart",
    Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"},
    Value = Cfg.AimPart or "Head",
    Callback = function(value)
        Cfg.AimPart = value
        if API.SetAimPart then API.SetAimPart(value) end
    end
})

-- 5. Nút thủ công chuyển đổi mục tiêu nhanh
Sections.Camlock:Button({
    Title = "hutaohub:Switch_Target",
    Desc = "hutaohub:Switch_Target_Desc",
    Callback = function()
        if API.SwitchTarget then API.SwitchTarget() end
    end
})

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

Sections.Stamina:Button({
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

Sections.Stamina:Toggle({
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

Sections.Stamina:Input({
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

Sections.Stamina:Toggle({
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

Sections.Stamina:Input({
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

Sections.Stamina:Toggle({
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

Sections.Stamina:Input({
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

Sections.Stamina:Toggle({
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

if not getgenv().HitboxDevilSettings then
    getgenv().HitboxDevilSettings = {
        Enabled = false,
        Distance = 120
    }
end

local Cfg = getgenv().HitboxDevilSettings
local API = getgenv().HitboxDevilAPI or {}

Sections.Hitbox:Toggle({
    Title = "hutaohub:Hitbox_Angel",
    Desc = "hutaohub:Hitbox_Angel_Desc",
    Flag = "HitboxAngel",
    Locked = false,
    Value = Cfg.Enabled,
    Callback = function(val)
        Cfg.Enabled = val
        if API.SetEnabled then API.SetEnabled(val) end
    end
})

Sections.Hitbox:Input({
    Title = "hutaohub:Hitbox_Range",
    Desc = "hutaohub:Hitbox_Range_Desc",
    Flag = "HitboxRange",
    Value = tostring(Cfg.Distance),
    Placeholder = "120",
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 10 and num <= 300 then
            Cfg.Distance = num
            if API.SetDistance then API.SetDistance(num) end
        end
    end
})

local Sys = getgenv().HutaoESPSystem

Sys.Folders.Survivors = survivorsFolder
Sys.Folders.Killers = killersFolder
Sys.Folders.Gen = genFolder

local dynamicMap = Sys.Internal.GetDynamicMapFolder()

-- 3. Khởi tạo cấu hình Runtime chuyển tiếp gọn nhẹ (Giảm thiểu khai báo biến local)
Sys.Internal.RegisterRuntimeConfig("Clone", { Id = "Clone", Color = Color3.fromRGB(0,255,0), ShowHealth = true, Living = true, WorkspaceOnly = true, Validator = Sys.Validators.Clone })
Sys.Internal.RegisterRuntimeConfig("Model", { Id = "Model", Color = Color3.fromRGB(255,170,0), Validator = Sys.Validators.Model })
Sys.Internal.RegisterRuntimeConfig("Survivor", { Id = "Survivor", Color = Color3.fromRGB(255,255,255), ShowHealth = true, Living = true, WatchFolder = survivorsFolder, WorkspaceOnly = true, Validator = Sys.Validators.Survivor })
Sys.Internal.RegisterRuntimeConfig("Killer", { Id = "Killer", Color = Color3.fromRGB(255,0,0), ShowHealth = true, Living = true, WatchFolder = killersFolder, WorkspaceOnly = true, Validator = Sys.Validators.Killer })
Sys.Internal.RegisterRuntimeConfig("Generator", { Id = "Generator", Color = Color3.fromRGB(0,255,255), Generator = true, WatchFolder = dynamicMap, WorkspaceOnly = not genFolder, Validator = Sys.Validators.Generator })
Sys.Internal.RegisterRuntimeConfig("FakeGenerator", { Id = "FakeGenerator", Color = Color3.fromRGB(170, 0, 255), WatchFolder = dynamicMap, Validator = Sys.Validators.FakeGenerator })
Sys.Internal.RegisterRuntimeConfig("Item", { Id = "Item", Color = Color3.fromRGB(255,215,0), Item = true, WatchFolder = dynamicMap, Validator = Sys.Validators.Item })
Sys.Internal.RegisterRuntimeConfig("Dispenser", { Id = "Dispenser", Color = Color3.fromRGB(0,162,255), Validator = Sys.Validators.Dispenser })
Sys.Internal.RegisterRuntimeConfig("Sentry", { Id = "Sentry", Color = Color3.fromRGB(128,128,128), Validator = Sys.Validators.Sentry })
Sys.Internal.RegisterRuntimeConfig("Trap", { Id = "Trap", Color = Color3.fromRGB(255,85,0), Validator = Sys.Validators.Trap })
Sys.Internal.RegisterRuntimeConfig("Subspace", { Id = "Subspace", Color = Color3.fromRGB(160,32,240), Validator = Sys.Validators.Subspace })
Sys.Internal.RegisterRuntimeConfig("JohnDoeTrap", { Id = "JohnDoeTrap", Color = Color3.fromRGB(255,0,0), FillTransparency = 0.2, Validator = Sys.Validators.JohnDoeTrap })

Sections.Esp:Toggle({ Title = "hutaohub:Clone_ESP", Desc = "hutaohub:Clone_ESP_Desc", Flag = "ESP_Clone", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Clone", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Model_ESP", Desc = "hutaohub:Model_ESP_Desc", Flag = "ESP_Model", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Model", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Survivors_ESP", Desc = "hutaohub:Survivors_ESP_Desc", Flag = "ESP_Survivor", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Survivor", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Killers_ESP", Desc = "hutaohub:Killers_ESP_Desc", Flag = "ESP_Killer", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Killer", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Generator_ESP", Desc = "hutaohub:Generator_ESP_Desc", Flag = "ESP_Generator", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Generator", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:FakeGenerator_ESP", Desc = "hutaohub:FakeGenerator_ESP_Desc", Flag = "ESP_FakeGenerator", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("FakeGenerator", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Items_ESP", Desc = "hutaohub:Items_ESP_Desc", Flag = "ESP_Item", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Item", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Dispenser_ESP", Desc = "hutaohub:Dispenser_ESP_Desc", Flag = "ESP_Dispenser", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Dispenser", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Sentry_ESP", Desc = "hutaohub:Sentry_ESP_Desc", Flag = "ESP_Sentry", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Sentry", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Tripwire_ESP", Desc = "hutaohub:Tripwire_ESP_Desc", Flag = "ESP_Trap", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Trap", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Subspace_ESP", Desc = "hutaohub:Subspace_ESP_Desc", Flag = "ESP_Subspace", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("Subspace", state) end })
Sections.Esp:Toggle({ Title = "hutaohub:Digital_Trap_ESP", Desc = "hutaohub:Digital_Trap_ESP_Desc", Flag = "ESP_JohnDoeTrap", Value = false, Callback = function(state) Sys.Internal.TriggerToggle("JohnDoeTrap", state) end })


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

Sections.FixLag:Button({
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

if not getgenv().MiscModule then
    getgenv().MiscModule = {
        Settings = {
            FullBright = false,
            Fog = false,
            InfiniteZoom = false,
            AntiSlow = false,
            ShowChat = false,
            RemoveNPCNoli = false,
            AntiAFK = true,
            RemoveEffects = false,
            RemoveBlackScreen = true,
            AntiAdmin = true
        },
        Constants = {
            DefaultCamera = { Max = 128, Min = 0.5 },
            EffectNames = {
                BlurEffect = true, ColorCorrectionEffect = true, BloomEffect = true, SunRaysEffect = true,
                DepthOfFieldEffect = true, ScreenFlash = true, HitEffect = true, DamageOverlay = true,
                BloodEffect = true, Vignette = true, BlackScreen = true, WhiteScreen = true,
                ShockEffect = true, Darkness = true, JumpScare = true, LowHealthOverlay = true,
                Flashbang = true, FadeEffect = true
            },
            EffectClasses = {
                BlurEffect = true, BloomEffect = true, SunRaysEffect = true, 
                DepthOfFieldEffect = true, ColorCorrectionEffect = true
            },
            AntiSlowConfigs = {
                {"SlowedStatus"},
                {"StunningKiller", "EatFriedChicken", "GuestBlocking", "PunchAbility", "SubspaceTripmine", "TaphTripwire", "PlasmaBeam", "SpawnProtection", "c00lgui", "ShootingGun", "TwoTimeStab", "TwoTimeCrouching", "DrinkingCola", "DrinkingSlateskin", "SlateskinStatus", "EatingGhostburger"},
                {"BloxyColaItem", "Medkit"},
                {"Emoting"},
                {"DispenserConstruction", "SentryConstruction"}
            },
            AdminNames = {
                "Enoderen", "SoyS3BASTIAN", "aateeer", "sayso_1230",
                "fractalintersection", "KeyAfterKey", "Exedious",
                "Agrovient", "isaac3523", "Proffessor738", "Roblox"
            }
        },
        Cache = {
            EffectCons = {},
            BlackScreenCons = {},
            AntiAFKCons = {},
            AntiAFKConn = nil,
            ChatWindow = game:GetService("TextChatService"):FindFirstChild("ChatWindowConfiguration"),
            AntiAdminLoop = nil,
            NoliTracked = {} -- ĐÃ THÊM: Sổ theo dõi thời gian sống của Noli
        }
    }
end

local M = getgenv().MiscModule

local function ApplyVisuals()
    if M.Settings.FullBright then
        Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        Lighting.Brightness = 4
        Lighting.GlobalShadows = false
    end

    if M.Settings.Fog then
        Lighting.FogStart = 0
        Lighting.FogEnd = 999999
        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if atmosphere then
            atmosphere.Density = 0
            atmosphere.Haze = 0
        end
    end

    if M.Settings.InfiniteZoom then
        localPlayer.CameraMaxZoomDistance = math.huge
        localPlayer.CameraMinZoomDistance = M.Constants.DefaultCamera.Min
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
    localPlayer.CameraMaxZoomDistance = M.Constants.DefaultCamera.Max
    localPlayer.CameraMinZoomDistance = M.Constants.DefaultCamera.Min
end

local function processAntiSlow()
    if not M.Settings.AntiSlow or not playerCharacter then return end
    
    local speedFolder = playerCharacter:FindFirstChild("SpeedMultipliers")
    if speedFolder then
        for _, group in ipairs(M.Constants.AntiSlowConfigs) do
            for i = 1, #group do
                local obj = speedFolder:FindFirstChild(group[i])
                if obj and obj:IsA("NumberValue") and obj.Value ~= 1 then
                    obj.Value = 1
                end
            end
        end
    end

    local pg = localPlayer:FindFirstChild("PlayerGui")
    if pg then
        local mainUI = pg:FindFirstChild("MainUI")
        local status = mainUI and mainUI:FindFirstChild("StatusContainer")
        local slowUI = status and status:FindFirstChild("Slowness")
        if slowUI then slowUI.Visible = false end
    end
end

local function processRemoveNoli()
    if not M.Settings.RemoveNPCNoli then 
        table.clear(M.Cache.NoliTracked) -- Dọn sổ theo dõi nếu tắt chức năng
        return 
    end
    
    -- Dọn dẹp những model Noli đã tự biến mất khỏi map để chống rác bộ nhớ
    for model, _ in pairs(M.Cache.NoliTracked) do
        if not model or not model.Parent then
            M.Cache.NoliTracked[model] = nil
        end
    end

    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Noli" then
            if Players:GetPlayerFromCharacter(v) then
                -- Nếu nó đã hóa thành Player thật -> Xóa khỏi sổ theo dõi, tha mạng
                M.Cache.NoliTracked[v] = nil
            else
                if v:FindFirstChildOfClass("Humanoid") then
                    if not M.Cache.NoliTracked[v] then
                        -- Lần đầu nhìn thấy, ghi lại thời gian (tick)
                        M.Cache.NoliTracked[v] = tick()
                    else
                        -- Nếu đã trôi qua 5 giây mà vẫn không phải Player -> Tiêu diệt
                        if tick() - M.Cache.NoliTracked[v] >= 5 then
                            pcall(v.Destroy, v)
                            M.Cache.NoliTracked[v] = nil
                        end
                    end
                end
            end
        end
    end
end

local function processAntiAdmin()
    if not M.Settings.AntiAdmin then return end

    local myName = Players.LocalPlayer.Name
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= myName and table.find(M.Constants.AdminNames, player.Name) then
            -- Thông báo qua WindUI
            pcall(function()
                WindUI:Notify({
                    Title = "hutaohub:Anti_Admin_Forsaken",
                    Content = "hutaohub:Anti_Admin_Forsaken_Content",
                    Duration = 3,
                    Icon = "shield"
                })
            end)
            warn("[AntiAdmin] Phát hiện admin: " .. player.Name .. " - Server hop sau 1 giây.")

            -- Chờ 1 giây rồi chuyển server
            task.wait(1)
            pcall(function()
                TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
            end)
            return
        end
    end
end

local function TryRemoveEffect(obj)
    if not M.Settings.RemoveEffects or not obj or not obj.Parent then return end

    local remove = M.Constants.EffectNames[obj.Name] or M.Constants.EffectClasses[obj.ClassName]
    if not remove and (obj:IsA("ScreenGui") or obj:IsA("BillboardGui") or obj:IsA("SurfaceGui")) then
        local lname = string.lower(obj.Name)
        remove = string.find(lname, "overlay") or string.find(lname, "effect")
    end

    if remove then pcall(obj.Destroy, obj) end
end

local function TryRemoveBlackScreen(obj)
    if not M.Settings.RemoveBlackScreen or not obj or not obj.Parent then return end
    
    local nameLower = string.lower(obj.Name)
    local isBlackTarget = (nameLower == "blackscreen") 
        or (nameLower == "fadescreen") 
        or (nameLower == "fadeeffect") 
        or (nameLower == "darkness")
        or (nameLower == "loadinggui")
        
    if not isBlackTarget and obj:IsA("Frame") then
        isBlackTarget = string.find(nameLower, "black") or string.find(nameLower, "fade")
    end
    
    if isBlackTarget then
        pcall(obj.Destroy, obj)
    end
end

local function cleanAllBlackScreens()
    if not M.Settings.RemoveBlackScreen then return end
    local pg = localPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    
    for _, obj in ipairs(pg:GetDescendants()) do
        TryRemoveBlackScreen(obj)
    end
end

task.spawn(function()
    while true do
        if M.Settings.FullBright or M.Settings.Fog or M.Settings.InfiniteZoom then
            ApplyVisuals()
        end
        processAntiSlow()
        processRemoveNoli()
        cleanAllBlackScreens()
        task.wait(0.5)
    end
end)

task.spawn(function()
    while true do
        if M.Settings.AntiAdmin then
            processAntiAdmin()
        end
        task.wait(1)
    end
end)

local function setFullBright(state)
    M.Settings.FullBright = state
    if state then ApplyVisuals() else ResetFullBright() end
end

local function setRemoveFog(state)
    M.Settings.Fog = state
    if state then ApplyVisuals() else ResetFog() end
end

local function setInfiniteZoom(state)
    M.Settings.InfiniteZoom = state
    if not state then ResetZoom() end
end

local function setRemoveEffects(state)
    M.Settings.RemoveEffects = state
    for i = 1, #M.Cache.EffectCons do M.Cache.EffectCons[i]:Disconnect() end
    table.clear(M.Cache.EffectCons)

    if not state then return end
    local pg = localPlayer:FindFirstChild("PlayerGui")
    if pg then
        for _, obj in ipairs(pg:GetDescendants()) do TryRemoveEffect(obj) end
        table.insert(M.Cache.EffectCons, pg.DescendantAdded:Connect(TryRemoveEffect))
    end
    for _, obj in ipairs(Lighting:GetDescendants()) do TryRemoveEffect(obj) end
    table.insert(M.Cache.EffectCons, Lighting.DescendantAdded:Connect(TryRemoveEffect))
end

local function setRemoveBlackScreen(state)
    M.Settings.RemoveBlackScreen = state
    for i = 1, #M.Cache.BlackScreenCons do M.Cache.BlackScreenCons[i]:Disconnect() end
    table.clear(M.Cache.BlackScreenCons)

    if not state then return end
    cleanAllBlackScreens()
    
    local pg = localPlayer:FindFirstChild("PlayerGui")
    if pg then
        table.insert(M.Cache.BlackScreenCons, pg.DescendantAdded:Connect(TryRemoveBlackScreen))
    end
end

local function setAntiSlow(state)
    M.Settings.AntiSlow = state
end

local function setShowChat(state)
    M.Settings.ShowChat = state
    if M.Cache.ChatWindow then M.Cache.ChatWindow.Enabled = state end
end

local function setAntiScreenRec(state)
    if type(setfflag) ~= "function" then return end
    pcall(function()
        setfflag("AbuseReportScreenshot", state and "False" or "True")
        setfflag("AbuseReportScreenshotPercentage", state and "0" or "100")
    end)
end

local function setRemoveFakeNoli(state)
    M.Settings.RemoveNPCNoli = state
end

local function setAntiAdmin(state)
    M.Settings.AntiAdmin = state
end

local function performAntiAFKAction()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end)
end

local function setAntiAFK(state)
    M.Settings.AntiAFK = state
    if not getconnections then return end
    local idleCons = getconnections(localPlayer.Idled)

    if state then
        for _, c in ipairs(idleCons) do
            M.Cache.AntiAFKCons[c] = true
            pcall(c.Disable, c)
        end
        if M.Cache.AntiAFKConn then M.Cache.AntiAFKConn:Disconnect() end
        M.Cache.AntiAFKConn = localPlayer.Idled:Connect(performAntiAFKAction)
    else
        for c in pairs(M.Cache.AntiAFKCons) do
            if c and c.Enable then pcall(c.Enable, c) end
        end
        M.Cache.AntiAFKCons = {}
        if M.Cache.AntiAFKConn then
            M.Cache.AntiAFKConn:Disconnect()
            M.Cache.AntiAFKConn = nil
        end
    end
end

if M.Cache.ChatWindow then
    M.Cache.ChatWindow:GetPropertyChangedSignal("Enabled"):Connect(function()
        if M.Cache.ChatWindow.Enabled ~= M.Settings.ShowChat then
            M.Cache.ChatWindow.Enabled = M.Settings.ShowChat
        end
    end)
end

Sections.Camera:Toggle({
    Title = "hutaohub:Full_Bright", Desc = "hutaohub:Full_Bright_Desc",
    Flag = "FullBright", Value = M.Settings.FullBright, Callback = setFullBright
})

Sections.Camera:Toggle({
    Title = "hutaohub:Remove_Fog", Desc = "hutaohub:Remove_Fog_Desc",
    Flag = "RemoveFog", Value = M.Settings.Fog, Callback = setRemoveFog
})

Sections.Camera:Toggle({
    Title = "hutaohub:Infinite_Zoom", Desc = "hutaohub:Infinite_Zoom_Desc",
    Flag = "Infinite Zoom", Value = M.Settings.InfiniteZoom, Callback = setInfiniteZoom
})

Sections.GamePlay:Toggle({
    Title = "hutaohub:Remove_Effects", Desc = "hutaohub:Remove_Effects_Desc",
    Flag = "RemoveAllBadEffects", Value = M.Settings.RemoveEffects, Callback = setRemoveEffects
})

Sections.GamePlay:Toggle({
    Title = "hutaohub:Remove_BlackScreen", Desc = "hutaohub:Remove_BlackScreen_Desc",
    Flag = "RemoveStuckBlackScreen", Value = M.Settings.RemoveBlackScreen, Callback = setRemoveBlackScreen
})

Sections.GamePlay:Toggle({
    Title = "hutaohub:Anti_Slow", Desc = "hutaohub:Anti_Slow_Desc",
    Flag = "Anti Slow", Value = M.Settings.AntiSlow, Callback = setAntiSlow
})

Sections.GamePlay:Toggle({
    Title = "hutaohub:Show_Chat", Desc = "hutaohub:Show_Chat_Desc",
    Flag = "ShowChat", Value = M.Settings.ShowChat, Callback = setShowChat
})

Sections.Protect:Toggle({
    Title = "hutaohub:Anti_Screen_Recording", Desc = "hutaohub:Anti_Screen_Recording",
    Flag = "Anti Screen Recording", Value = true, Callback = setAntiScreenRec
})

Sections.Protect:Toggle({
    Title = "hutaohub:Anti_Admin_Forsaken",
    Desc = "hutaohub:Anti_Admin_Forsaken_Desc",
    Flag = "AntiAdmin",
    Value = M.Settings.AntiAdmin,
    Callback = setAntiAdmin
})

Sections.Protect:Toggle({
    Title = "hutaohub:Remove_Fake_Noli", Desc = "hutaohub:Remove_Fake_Noli_Desc",
    Flag = "Remove Fake Noli", Value = M.Settings.RemoveNPCNoli, Callback = setRemoveFakeNoli
})

Sections.Protect:Toggle({
    Title = "hutaohub:Anti_AFK_Roblox", Desc = "hutaohub:Anti_AFK_Roblox_Desc",
    Flag = "Anti AFK", Value = M.Settings.AntiAFK, Callback = setAntiAFK
})

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

local ConfigDropdownElement = nil

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

Sections.Config:Input({
    Title = "hutaohub:Config_Name",
    Desc = "hutaohub:Config_Name_Desc",
    Flag = "Config Name",
    Placeholder = "Enter new config name",
    Value = "",
    Callback = OnConfigNameChanged
})

ConfigDropdownElement = Sections.Config:Dropdown({
    Title = "hutaohub:Config_List",
    Desc = "hutaohub:Config_List_Desc",
    Flag = "Config List",
    Values = GetConfigs(),
    Value = nil,
    Callback = OnConfigSelected
})

Sections.Config:Button({
    Title = "hutaohub:Make_Config",
    Desc = "hutaohub:Make_Config_Desc",
    Callback = OnMakeConfigPressed
})

Sections.Config:Button({
    Title = "hutaohub:Update_Config",
    Desc = "hutaohub:Update_Config_Content",
    Callback = OnUpdateConfigPressed
})

Sections.Config:Button({
    Title = "hutaohub:Load_Config",
    Desc = "hutaohub:Load_Config_Desc",
    Callback = OnLoadConfigPressed
})

Sections.Config:Button({
    Title = "hutaohub:Delete_Config",
    Desc = "hutaohub:Delete_Config_Desc",
    Callback = OnDeleteConfigPressed
})

Sections.Config:Toggle({
    Title = "hutaohub:Auto_Load_Config",
    Desc = "hutaohub:Auto_Load_Config_Desc",
    Flag = "Auto Load Config v2",
    Value = false,
    Callback = OnAutoLoadToggled
})

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
