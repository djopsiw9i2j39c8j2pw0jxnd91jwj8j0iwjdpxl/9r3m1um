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
CollectionService = game:GetService("CollectionService")

localPlayer = Players.LocalPlayer
PlayerGui = localPlayer:WaitForChild("PlayerGui", 10)
playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()

localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

Camera = Workspace.CurrentCamera

getgenv().SprinklerList = {"Common Sprinkler", "Uncommon Sprinkler", "Rare Sprinkler", "Legendary Sprinkler", "Super Sprinkler" }
getgenv().SeedList = {"Carrot", "Strawberry", "Blueberry", "Tulip", "Tomato", "Apple", "Bamboo", "Corn", "Cactus", "Pineapple", "Mushroom", "Green Bean", "Banana", "Grape", "Coconut", "Mango", "Dragon Fruit", "Acorn", "Cherry", "Sunflower", "Venus Fly Trap", "Pomegranate", "Poison Apple", "Venom Spitter", "Moon Bloom", "Dragon's Breath", "Ghost Pepper", "Poison Ivy", "Baby Cactus", "Glow Mushroom", "Romanesco", "Horned Melon", "Gold", "Rainbow", "Hypnobloom" }

local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))

getgenv().turtleCapacityBonus = 0

local function updateTurtleBonus()
    local success, result = pcall(function()
        return Networking.Pets.GetEquippedPets:Fire()
    end)

    if success and type(result) == "table" then
        local turtleCount = 0
        for _, petData in pairs(result) do
            if type(petData) == "table" and petData.Name == "Turtle" then
                turtleCount = turtleCount + 1
            end
        end
        getgenv().turtleCapacityBonus = turtleCount * 10
    end
end

task.spawn(updateTurtleBonus)

Networking.Pets.PetEquipped.OnClientEvent:Connect(function()
    task.wait(0.1)
    updateTurtleBonus()
end)

Networking.Pets.PetUnequipped.OnClientEvent:Connect(function()
    task.wait(0.1)
    updateTurtleBonus()
end)

getgenv().isInventoryFull = function()
    local success, isFull = pcall(function()
        local baseCapacity = Config and Config.MaxCapacity or 100 
        local maxCapacity = baseCapacity + (getgenv().turtleCapacityBonus or 0)

        local currentCount = 0
        local function countValid(folder)
            if not folder then return end
            for _, item in ipairs(folder:GetChildren()) do
                local itemNameLower = string.lower(item.Name)
                
                if string.find(itemNameLower, "%d+%.?%d* *kg") then
                    local amtNode = item:FindFirstChild("Amount") or item:FindFirstChild("Quantity") or item:FindFirstChild("Value")
                    currentCount = currentCount + (amtNode and (amtNode:IsA("IntValue") or amtNode:IsA("NumberValue")) and amtNode.Value or 1)
                end
            end
        end
        
        countValid(localPlayer:FindFirstChildOfClass("Backpack"))
        countValid(localPlayer.Character)

        return currentCount >= maxCapacity
    end)
    
    return success and isFull
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SLK-GAMING-MOD/WindUI-Mod/refs/heads/main/WindUI-Mod.luau"))()

WindUI:AddTheme({
    Name = "Dark",
    Accent = "#18181b",
    Dialog = "#18181b", 
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#a1a1aa",
})

WindUI:AddTheme({
    Name = "Light",
    Accent = "#f4f4f5",
    Dialog = "#f4f4f5",
    Outline = "#000000", 
    Text = "#000000",
    Placeholder = "#666666",
    Background = "#ffffff",
    Button = "#e4e4e7",
    Icon = "#52525b",
})

WindUI:AddTheme({
    Name = "Gray",
    Accent = "#374151",
    Dialog = "#374151",
    Outline = "#d1d5db", 
    Text = "#f9fafb",
    Placeholder = "#9ca3af",
    Background = "#1f2937",
    Button = "#4b5563",
    Icon = "#d1d5db",
})

WindUI:AddTheme({
    Name = "Blue",
    Accent = "#1e40af",
    Dialog = "#1e3a8a",
    Outline = "#93c5fd", 
    Text = "#f0f9ff",
    Placeholder = "#60a5fa",
    Background = "#1e293b",
    Button = "#3b82f6",
    Icon = "#93c5fd",
})

WindUI:AddTheme({
    Name = "Green",
    Accent = "#059669",
    Dialog = "#047857",
    Outline = "#6ee7b7", 
    Text = "#ecfdf5",
    Placeholder = "#34d399",
    Background = "#064e3b",
    Button = "#10b981",
    Icon = "#6ee7b7",
})

WindUI:AddTheme({
    Name = "Purple",
    Accent = "#7c3aed",
    Dialog = "#6d28d9",
    Outline = "#c4b5fd", 
    Text = "#faf5ff",
    Placeholder = "#a78bfa",
    Background = "#581c87",
    Button = "#8b5cf6",
    Icon = "#c4b5fd",
})

WindUI:SetNotificationLower(true)

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        en = {
            HubTitle = "Hutao Hub",
            GameTitle = "Grow A Garden 2 - By 72ms",
            ThemeChanged = "Theme Changed",
            TransparencyTitle = "Transparency",
            TransparencyDisabled = "Transparency disabled",
            TransparencyEnabled = "Transparency enabled",
            About = "About",
            Features = "Features",
            Gameplay = "Gameplay",
            System = "System",
            Misc = "Misc",
            Items = "Items",
            Visual = "Visual",
            Player = "Player",
            Teleport = "Teleport",
            Main = "Main",
            Server = "Server",
            Information = "Information",
            Update = "Update",
            UpdateDesc = "▪︎ Auto Buy Seed\n▪︎ Auto Buy Gear\n▪︎ Auto Sell All\n▪︎ Fix Fire Network:\n+ Auto Harvest\n+ Auto Steal Fruit\n▪︎ Fix Lag All Toggle",
            Settings = "Settings",
            Seed = "Seed",
            SeedSections = "Claim special seeds automatically and configure related options.",
            Pets = "Pets",
            PetsSections = "Manage your pet settings and automation.",
            Shop = "Shop",
            Shop_Sections = "Settings for Displaying Game UI.",
            Harvest = "Harvest",
            Harvest_Sections = "Manage harvesting features and automation.",
            Steal = "Steal",
            Steal_Sections = "Manage stealing features and automation.",
            Gear = "Gear",
            GearSections = "Manage gear features and automation.",
            SellFruit = "Sell Fruit",
            SellFruitSections = "Manage fruit selling features and automation.",
            BuySeed = "Buy Seed",
            BuySeedSections = "Manage seed purchasing features and automation.",
            BuyGear = "Buy Gear",
            BuyGearSections = "Manage gear purchasing features and automation.",
            BuyCrate = "Buy Crate",
            BuyCrateSections = "Manage crate purchasing features and automation.",
            Power = "Character Powers",
            PowerDesc = "Adjust your character's enhanced movement and special abilities.",
            SettingsManager = "Settings Manager",
            SettingsManagerDesc = "Configure and customize convenient features.",
            Update_Info = "Update Information",
            Update_Info_Desc = "Used to update Discord information.",
            Update_Notify = "Updated!",
            Update_Notify_Content = "Statistics refreshed",
            Copy_Discord_Invite = "Copy Discord Invite",
            Copy_Discord_Invite_Desc = "Use this to copy the Discord group link.",
            Copy_Discord_Invite_Copied = "Copied!",
            Copy_Discord_Invite_Content = "Link copied to clipboard",
            Main_Owner = "Main Owner",
            Support_Owner = "Support Owner",
            Security_Owner = "Security Owner",
            Youtube_Desc = "Copy link youtube for subscribe!",
            Discord_Desc = "Join our discord for more scripts!",
            TikTok_Desc = "Copy the link to follow on TikTok!",
            Copy_Link = "Copy Link",
            Dev_Script = ">>          Dev Script          <<",
            My_Link = ">>          My Link          <<",
            Auto_Harvest = "Auto Harvest",
            Auto_Harvest_Desc = "Auto harvests nearby crops and resources without manual interaction.",
            Harvest_Radius = "Harvest Radius",
            Harvest_Radius_Desc = "Expands the harvesting range, allowing you to collect nearby crops more efficiently.",
            Harvest_Speed = "Harvest Speed",
            Harvest_Speed_Desc = "Increases the speed at which you harvest crops and resources.",
            Max_Inventory_Capacity = "Max Inventory Capacity",
            Max_Inventory_Capacity_Desc = "Enter the maximum capacity of your backpack to stop harvesting",
            Auto_Steal = "Auto Steal",
            Auto_Steal_Desc = "Automatically steals nearby items and resources without manual interaction.",
            Teleport_to_Steal = "Teleport to Steal",
            Teleport_to_Steal_Desc = "Teleport to nearby targets to steal automatically.",
            AutoClaimGoldSeed = "Auto Claim Gold Seed",
            AutoClaimGoldSeedDesc = "Auto claim Rainbow Seeds whenever they become available.",
            AutoClaimRainbowSeed = "Auto Claim Rainbow Seed",
            AutoClaimRainbowSeedDesc = "Auto claim Gold Seeds whenever they become available.",
            Steal_Radius = "Steal Radius",
            Steal_Radius_Desc = "Expands the stealing range, allowing you to target items from farther away.",
            Steal_Speed = "Steal Speed",
            Steal_Speed_Desc = "Increases the speed of stealing nearby items and resources.",
            ShowGearShop = "Show Gear Shop",
            ShowGearShopDesc = "Display the Gear Shop interface.",
            ShowSeedShop = "Show Seed Shop",
            ShowSeedShopDesc = "Display the Seed Shop interface.",
            ShowWeatherUI = "Show Weather UI",
            ShowWeatherUIDesc = "Display the current weather information interface.",
            AutoSellAll = "Auto Sell All",
            AutoSellAllDesc = "Automatically sell all fruits stored in your inventory.",
            SellAllSpeed = "Sell All Speed",
            SellAllSpeedDesc = "Adjust the speed of selling all fruits from your inventory.",
            AutoSellToolInHand = "Auto Sell Tool In Hand",
            AutoSellToolInHandDesc = "Automatically sell the fruit or pet currently held in your hand.",
            SellToolInHandSpeed = "Sell Tool In Hand Speed",
            SellToolInHandSpeedDesc = "Adjust the speed of selling the item currently held in your hand.",
            SelectSeed = "Select Seed",
            SelectSeedDesc = "Choose the seed to purchase automatically.",
            AutoBuySeed = "Auto Buy Seed",
            AutoBuySeedDesc = "Automatically purchase the selected seed.",
            BuySeedSpeed = "Buy Seed Speed",
            BuySeedSpeedDesc = "Adjust the speed of automatic seed purchases.",
            SelectGear = "Select Gear",
            SelectGearDesc = "Choose the gear to purchase automatically.",
            AutoBuyGear = "Auto Buy Gear",
            AutoBuyGearDesc = "Automatically purchase the selected gear.",
            BuyGearSpeed = "Buy Gear Speed",
            BuyGearSpeedDesc = "Adjust the speed of automatic gear purchases.",
            Noclip = "Noclip",
            NoclipDesc = "Toggle collision to walk through walls and other objects.",
            InfJump = "Infinite Jump",
            InfJumpDesc = "Jump infinitely without touching the ground.",
            ForceSpeed = "Force Speed",
            ForceSpeedDesc = "Override your character's default movement speed.",
            SetSpeed = "SetSpeed",
            SetSpeedDesc = "Set the movement speed value used by Force Speed.",
            JumpPower = "Jump Power",
            JumpPowerDesc = "Enable or disable a custom jump power value.",
            SetPower = "Set Power",
            SetPowerDesc = "Set the jump power value applied when Jump Power is enabled.",
            StandInTheAir = "Stand In The Air",
            StandInTheAirDesc = "Allows your character to stand and remain suspended in the air.",
            StandingHeight = "Standing Height",
            StandingHeightDesc = "Adjust the height at which your character stands in the air.",
            WindowSize = "Window Size",
            WindowSizeDesc = "Adjust the overall size of the WindUI interface.",
            OpenButtonScale = "Open Button Scale",
            OpenButtonScaleDesc = "Adjust the size of the WindUI floating button.",
            OpenButtonOnlyIcon = "Open Button Only Icon",
            OpenButtonOnlyIconDesc = "Show only the icon on the WindUI floating button.",
            ToggleUIKeybind = "Toggle UI Keybind",
            ToggleUIKeybindDesc = "Customize the keyboard shortcut for toggling WindUI.",
            HutaoToggleSize = "Hutao Toggle Size",
            HutaoToggleSizeDesc = "Adjust the size of the Hu Tao Hub mobile button.",
            ShowHutaoToggle = "Show Hutao Toggle",
            ShowHutaoToggleDesc = "Show or hide the Hutao Hub mobile button.",
            SelectLanguage = "Select Language",
            SelectLanguageDesc = "Select your preferred language",
            Language = "Want to Add a New Language?",
            LanguageDesc = "If you want to add a new language, visit the Info section and join our Discord server for assistance.",
            Config_Name = "Config Name",
            Config_Name_Desc = "Enter the name of the config you want.",
            Config_List = "Config List",
            Config_List_Desc = "Select your created config.",
            Make_Config = "Make Config",
            Make_Config_Desc = "Click to generate the configuration entered in the input.",
            Config = "Config",
            Config_Content = "Please enter config name",
            Config_Content1 = "Config already exists",
            Config_Content2 = "Config created successfully",
            Update_Config = "Update Config",
            Update_Config_Content = "Click to update the selected config.",
            Config_Content3 = "No config selected",
            Config_Content4 = "Config does not exist",
            Config_Content5 = "Config has been updated.",
            Load_Config = "Load Config",
            Load_Config_Desc = "Click to load the selected config.",
            Config_Content6 = "Please select a config first",
            Config_Content7 = "Config does not exist",
            Config_Content8 = "Config has finished loading.",
            Delete_Config = "Delete Config",
            Delete_Config_Desc = "Click to delete the selected config.",
            Config_Content9 = "No config selected",
            Config_Content10 = "Config has already been deleted",
            Config_Content11 = "Config deleted successfully.",
            Auto_Load_Config = "Auto Load Config",
            Auto_Load_Config_Desc = "Automatically syncs for the first 3 seconds, then auto-saves every 1 second.",
            Auto_Load = "Auto Load",
            Config_Content12 = "Please select a config first",
            Disabled = "Disabled",
            Config_Content13 = "Switched to Auto Save Config",
            Languages = "Languages",
            UI = "UI",
            Config = "Config",
            Free = "Free",
            SelectSprinkler = "Select Sprinkler",
            SelectSprinklerDesc = "Choose the sprinkler to use automatically.",
            AutoPlaceSprinkler = "Auto Place Sprinkler",
            AutoPlaceSprinklerDesc = "Automatically place the selected sprinkler.",
            AutoEquipSprinkler = "Auto Equip Sprinkler",
            AutoEquipSprinklerDesc = "Automatically equip the selected sprinkler.",
            SelectPets = "Select Pets",
            SelectPetsDesc = "Select the pet to buy.",
            TeleportToPets = "Teleport To Pets",
            TeleportToPetsDesc = "Automatically teleport to the selected pet.",
            AutoBuyPets = "Auto Buy Pets",
            AutoBuyPetsDesc = "Automatically buy the selected pet.",
            SelectFruit = "Select Fruit",
            SelectFruitDesc = "Select the fruit to target.",
            SelectMutations = "Select Mutations",
            SelectMutationsDesc = "Select the mutations to target.",
            Countofmutations = "Count of Mutations",
            CountofmutationsDesc = "Set the minimum number of mutations required.",
            OnlyStealMutations = "Only Steal Mutations",
            OnlyStealMutationsDesc = "Only steal fruits with the selected mutations.",
            OnlyHarvestMutations = "Only Harvest Mutations",
            OnlyHarvestMutationsDesc = "Only harvest fruits with the selected mutations.",
            JumpPower1 = "Jump Power",
            SpeedPower = "Speed Power",
            AirPower = "Air Power",
            JumpPowerDesc1 = "Adjust your character's jump power.",
            SpeedPowerDesc = "Adjust your character's movement speed.",
            AirPowerDesc = "Adjust your character's air power.",
            Bypass = "Bypass",
            BypassDesc = "Game bypass functions",
            AntiAFK = "Anti-AFK Bypass",
            AntiAFKDesc = "Bypass anti-AFK for the game.",
            GreenbeanSeed = "Greenbean Seed",
            GreenbeanSeedDesc = "Bypass Greenbean purchase rights",
            Rejoin_Starting = "Rejoin Starting",
            Rejoin_Starting_Content1 = "Started on the server with the lag fixed.",
            Rejoin_Settings = "Rejoin Settings",
            Rejoin_Settings_Content2 = "Reducing Lag on Servers...",
            Teleport_Error = "Teleport Error",
            Rejoin_To_Fix_Lag = "Rejoin To Fix Lag",
            Rejoin_To_Fix_Lag_Desc = "Press to activate the server lag reduction function.",
            FixLag = "Fix Lag",
            FixLagDesc = "Enhanced the user experience with smoother performance.",
            SelectPlant = "Select Plant",
            SelectPlantDesc = "Select the plant to use.",
            AutoPlant = "Auto Plant",
            AutoPlantDesc = "Automatically plants the selected plant.",
            Plant = "Plant",
            PlantSections = "General settings for planting features.",
            AntiRagdoll = "Anti Ragdoll",
            AntiRagdollDesc = "Prevents your character from entering the ragdoll state.",
            AuraRange = "Attack Range",
            AuraRangeDesc = "Adjusts the maximum distance for attacking targets.",
            AttackCooldown = "Attack Cooldown",
            AttackCooldownDesc = "Adjusts the delay between consecutive attacks.",
            AutoAimbot = "Auto Aimbot",
            AutoAimbotDesc = "Automatically aims at the nearest target.",
            SilentAttack = "Silent Attack",
            SilentAttackDesc = "Automatically attacks enemies using skills without aiming directly.",
            ShovelPower = "Shovel Power",
            ShovelPowerDesc = "Configure automatic attack features for nearby players.",
            AntiBeeSting = "Anti Bee Sting",
            AntiBeeStingDesc = "Prevents bee stings from reversing your movement controls.",
            LowPlayerServer = "Low Player Server",
            LowPlayerServerSections = "Configure options for joining servers with fewer players.",
            Target_Players = "Target Players",
            Target_Players_Desc = "Sets the maximum number of players in the server.",
            Server_List = "Server List",
            Server_List_Desc = "Displays a list of available servers.",
            Search_Servers = "Search Servers",
            Search_Servers_Desc = "Searches for servers matching your criteria.",
            Join_Selected_Server = "Join Selected Server",
            Join_Selected_Server_Desc = "Joins the selected server you choose from the list.",
            Scan_Pet_Servers = "Scan Pet Servers",
            Scan_Pet_Servers_Desc = "Scans servers to find the selected pet.",
            Pet_Servers_List = "Pet Servers List",
            Pet_Servers_List_Desc = "Displays servers where the selected pet has been found.",
            Target_Pet = "Target Pet",
            Target_Pet_Desc = "Selects the pet to search for.",
            FindPetServer = "Pet Servers",
            FindPetServerSections = "Configure features to help you find servers containing pets.",
            Weather = "Weather",
            WeatherDesc = "Set up the next weather forecast feature in the game.",
            TPzone = "Teleport to zone",
            TPzoneDesc = "The buttons will take you to your desired location.",
            HarvestMode = "Harvest Mode",
            HarvestModeDesc = "Selects the harvesting mode.",
            SuperFastSpeed = "Super Fast Speed",
            SuperFastSpeedDesc = "Adjusts the speed of Super Fast harvesting.",
            SuperFastBatchSize = "Super Fast Batch Size",
            SuperFastBatchSizeDesc = "Sets how many plants are harvested in each batch.",
            SelectCrate = "Select Crate",
            SelectCrateDesc = "Selects the crate to purchase.",
            AutoBuyCrate = "Auto Buy Crate",
            AutoBuyCrateDesc = "Automatically purchases the selected crate.",
            BuyCrateSpeed = "Buy Crate Speed",
            BuyCrateSpeedDesc = "Adjusts the purchase speed for Auto Buy Crate.",
            ShowCrateShop = "Show props shop",
            ShowCrateShopDesc = "Displays the props shop interface.",
            View_Sell_Prices = "View Sell Prices",
            View_Sell_Prices_Desc = "Displays the selling prices of available items.",
            OpenEgg = "Open Egg",
            OpenEggDesc = "Configure settings for automatically opening eggs.",
            OpenCrate = "Open Crate",
            OpenCrateDesc = "Configure settings for automatically opening crates.",
            OpenSeed = "Open Seed",
            OpenSeedDesc = "Configure settings for automatically opening seed packs.",
            Open_All_Eggs = "Open All Eggs",
            Open_All_Eggs_Desc = "Instantly open all eggs in your inventory at once.",
            Auto_Open_Eggs = "Auto Open Eggs",
            Auto_Open_Eggs_Desc = "Automatically open eggs continuously until toggled off.",
            Open_All_Crates = "Open All Crates",
            Open_All_Crates_Desc = "Instantly open all crates in your inventory at once.",
            Auto_Open_Crates = "Open All Crates",
            Auto_Open_Crates_Desc = "Automatically open crates continuously until toggled off.",
            Open_All_SeedPacks = "Open All Seed Packs",
            Open_All_SeedPacks_Desc = "Instantly open all seed packs in your inventory at once.",
            Auto_Open_SeedPacks = "Auto Open Seed Packs",
            Auto_Open_SeedPacks_Desc = "Automatically open seed packs continuously until toggled off.",
            SellMode = "Sell Mode",
            SellModeDesc = "Choose the fruit selling mode you want.",
            AutoDailySell = "Auto Daily Sell",
            AutoDailySellDesc = "Auto using daily sell helps increase the price when selling.",
            ShowAuction = "Show Auction",
            ShowAuctionDesc = "Display the Auction interface.",
        },
        vi = {
            HubTitle = "Hutao Hub",
            GameTitle = "Trồng Một Khu Vườn 2 - Bởi 72ms",
            ThemeChanged = "Đã đổi giao diện",
            TransparencyTitle = "Độ trong suốt",
            TransparencyDisabled = "Đã tắt độ trong suốt",
            TransparencyEnabled = "Đã bật độ trong suốt",
            About = "Giới thiệu",
            Features = "Tính năng",
            Gameplay = "Lối chơi",
            System = "Hệ thống",
            Misc = "Khác",
            Items = "Vật phẩm",
            Visual = "Hiển thị",
            Player = "Người chơi",
            Teleport = "Dịch chuyển",
            Main = "Chính",
            Server = "Máy chủ",
            Information = "Thông tin",
            Update = "Cập nhật",
            UpdateDesc = "▪︎ Tự mua hạt giống\n▪︎ Tự mua trang bị\n▪︎ Tự Bán Tất Cả Trái\n▪︎ Sửa Fire Network:\n+ Tự thu hoạch\n+ Tự ăn trộm trái\n▪︎ Sửa lỗi lag toggle",
            Settings = "Cài đặt",
            Seed = "Hạt giống",
            SeedSections = "Tự động nhận hạt giống đặc biệt và cấu hình các tùy chọn liên quan.",
            Pets = "Thú cưng",
            PetsSections = "Quản lí cài đặt và các tính năng tự động của thú cưng.",
            Shop = "Cửa hàng",
            Shop_Sections = "Cài đặt hiển thị cho các UI của trò chơi.",
            Harvest = "Thu hoạch",
            Harvest_Sections = "Quản lý các tính năng và tự động hóa thu hoạch.",
            Steal = "Trộm",
            Steal_Sections = "Quản lý các tính năng và tự động hóa trộm.",
            Gear = "Trang bị",
            GearSections = "Quản lý và tự động hóa các tính năng liên quan đến trang bị.",
            SellFruit = "Bán trái cây",
            SellFruitSections = "Quản lý các tính năng và tự động hóa bán trái cây.",
            BuySeed = "Mua hạt giống",
            BuySeedSections = "Quản lý các tính năng và tự động hóa mua hạt giống.",
            BuyGear = "Mua trang bị",
            BuyGearSections = "Quản lý các tính năng và tự động hóa mua trang bị.",
            BuyCrate = "Mua thùng",
            BuyCrateSections = "Quản lý các tính năng và tự động hóa mua các thùng",
            Power = "Sức mạnh nhân vật",
            PowerDesc = "Điều chỉnh khả năng di chuyển nâng cao và các kỹ năng đặc biệt của nhân vật.",
            SettingsManager = "Quản lý cài đặt",
            SettingsManagerDesc = "Cấu hình và tùy chỉnh các tính năng tiện ích.",
            Update_Info = "Thông tin cập nhật",
            Update_Info_Desc = "Dùng để cập nhật thông tin Discord.",
            Update_Notify = "Đã cập nhật!",
            Update_Notify_Content = "Đã làm mới thống kê",
            Copy_Discord_Invite = "Sao chép lời mời Discord",
            Copy_Discord_Invite_Desc = "Dùng để sao chép liên kết nhóm Discord.",
            Copy_Discord_Invite_Copied = "Đã sao chép!",
            Copy_Discord_Invite_Content = "Đã sao chép liên kết vào bộ nhớ tạm",
            Main_Owner = "Chủ sở hữu chính",
            Support_Owner = "Chủ sở hữu hỗ trợ",
            Security_Owner = "Chủ sở hữu bảo mật",
            Youtube_Desc = "Sao chép liên kết YouTube để đăng ký!",
Discord_Desc = "Tham gia Discord của chúng tôi để nhận thêm nhiều script!",
            TikTok_Desc = "Sao chép liên kết để theo dõi trên TikTok!",
            Copy_Link = "Sao chép liên kết",
            Dev_Script = ">>          Script Nhà Phát Triển          <<",
            My_Link = ">>          Liên Kết Của Tôi          <<",
            Auto_Harvest = "Tự động thu hoạch",
            Auto_Harvest_Desc = "Tự động thu hoạch cây trồng và tài nguyên ở gần mà không cần thao tác thủ công.",
            Harvest_Radius = "Phạm vi thu hoạch",
            Harvest_Radius_Desc = "Mở rộng phạm vi thu hoạch, giúp bạn thu thập cây trồng ở gần hiệu quả hơn.",
            Harvest_Speed = "Tốc độ thu hoạch",
            Harvest_Speed_Desc = "Tăng tốc độ thu hoạch cây trồng và tài nguyên.",
            Max_Inventory_Capacity = "Dung lượng túi tối đa",
            Max_Inventory_Capacity_Desc = "Nhập dung lượng tối đa của ba lô để dừng thu hoạch.",
            Auto_Steal = "Tự động trộm",
            Auto_Steal_Desc = "Tự động trộm vật phẩm và tài nguyên ở gần mà không cần thao tác thủ công.",
            Teleport_to_Steal = "Dịch chuyển để trộm",
            Teleport_to_Steal_Desc = "Tự động dịch chuyển đến mục tiêu ở gần để trộm.",
            AutoClaimGoldSeed = "Tự động nhận Hạt Vàng",
            AutoClaimGoldSeedDesc = "Tự động nhận Hạt Cầu Vồng khi chúng xuất hiện.",
            AutoClaimRainbowSeed = "Tự động nhận Hạt Cầu Vồng",
            AutoClaimRainbowSeedDesc = "Tự động nhận Hạt Vàng khi chúng xuất hiện.",
            Steal_Radius = "Phạm vi trộm",
            Steal_Radius_Desc = "Mở rộng phạm vi trộm, cho phép nhắm mục tiêu từ khoảng cách xa hơn.",
            Steal_Speed = "Tốc độ trộm",
            Steal_Speed_Desc = "Tăng tốc độ trộm vật phẩm và tài nguyên ở gần.",
            ShowGearShop = "Hiển thị cửa hàng trang bị",
            ShowGearShopDesc = "Hiển thị giao diện Cửa hàng Trang bị.",
            ShowSeedShop = "Hiển thị cửa hàng hạt giống",
            ShowSeedShopDesc = "Hiển thị giao diện Cửa hàng Hạt giống.",
            ShowWeatherUI = "Hiển thị giao diện thời tiết",
            ShowWeatherUIDesc = "Hiển thị giao diện thông tin thời tiết hiện tại.",
            AutoSellAll = "Tự động bán tất cả",
            AutoSellAllDesc = "Tự động bán toàn bộ trái cây trong kho đồ.",
            SellAllSpeed = "Tốc độ bán tất cả",
            SellAllSpeedDesc = "Điều chỉnh tốc độ bán toàn bộ trái cây trong kho đồ.",
            AutoSellToolInHand = "Tự động bán vật phẩm trên tay",
            AutoSellToolInHandDesc = "Tự động bán trái cây hoặc thú cưng đang cầm trên tay.",
            SellToolInHandSpeed = "Tốc độ bán vật phẩm trên tay",
            SellToolInHandSpeedDesc = "Điều chỉnh tốc độ bán vật phẩm đang cầm trên tay.",
            SelectSeed = "Chọn hạt giống",
            SelectSeedDesc = "Chọn hạt giống để tự động mua.",
            AutoBuySeed = "Tự động mua hạt giống",
            AutoBuySeedDesc = "Tự động mua hạt giống đã chọn.",
            BuySeedSpeed = "Tốc độ mua hạt giống",
            BuySeedSpeedDesc = "Điều chỉnh tốc độ tự động mua hạt giống.",
            SelectGear = "Chọn trang bị",
            SelectGearDesc = "Chọn trang bị để tự động mua.",
            AutoBuyGear = "Tự động mua trang bị",
            AutoBuyGearDesc = "Tự động mua trang bị đã chọn.",
            BuyGearSpeed = "Tốc độ mua trang bị",
            BuyGearSpeedDesc = "Điều chỉnh tốc độ tự động mua trang bị.",
            Noclip = "Xuyên tường",
            NoclipDesc = "Bật hoặc tắt va chạm để đi xuyên qua tường và các vật thể khác.",
            InfJump = "Nhảy vô hạn",
            InfJumpDesc = "Nhảy không giới hạn mà không cần chạm đất.",
            ForceSpeed = "Ép tốc độ",
            ForceSpeedDesc = "Ghi đè tốc độ di chuyển mặc định của nhân vật.",
            SetSpeed = "Đặt tốc độ",
            SetSpeedDesc = "Đặt giá trị tốc độ di chuyển được sử dụng bởi Ép tốc độ.",
JumpPower = "Lực nhảy",
            JumpPowerDesc = "Bật hoặc tắt giá trị lực nhảy tùy chỉnh.",
            SetPower = "Đặt lực nhảy",
            SetPowerDesc = "Đặt giá trị lực nhảy được áp dụng khi Lực nhảy được bật.",
            StandInTheAir = "Đứng trên không",
            StandInTheAirDesc = "Cho phép nhân vật đứng và lơ lửng trên không.",
            StandingHeight = "Độ cao đứng",
            StandingHeightDesc = "Điều chỉnh độ cao mà nhân vật sẽ đứng trên không.",
            WindowSize = "Kích thước cửa sổ",
            WindowSizeDesc = "Điều chỉnh kích thước tổng thể của giao diện WindUI.",
            OpenButtonScale = "Kích thước nút mở",
            OpenButtonScaleDesc = "Điều chỉnh kích thước của nút nổi WindUI.",
            OpenButtonOnlyIcon = "Chỉ hiện biểu tượng nút mở",
            OpenButtonOnlyIconDesc = "Chỉ hiển thị biểu tượng trên nút nổi WindUI.",
            ToggleUIKeybind = "Phím bật/tắt giao diện",
            ToggleUIKeybindDesc = "Tùy chỉnh phím tắt để bật hoặc tắt WindUI.",
            HutaoToggleSize = "Kích thước nút Hutao",
            HutaoToggleSizeDesc = "Điều chỉnh kích thước nút nổi của Hu Tao Hub.",
            ShowHutaoToggle = "Hiển thị nút Hutao",
            ShowHutaoToggleDesc = "Hiển thị hoặc ẩn nút nổi của Hu Tao Hub.",
            SelectLanguage = "Chọn ngôn ngữ",
            SelectLanguageDesc = "Chọn ngôn ngữ bạn muốn sử dụng.",
            Language = "Muốn thêm ngôn ngữ mới?",
            LanguageDesc = "Nếu bạn muốn thêm ngôn ngữ mới, hãy vào mục Thông tin và tham gia máy chủ Discord của chúng tôi để được hỗ trợ.",
            Config_Name = "Tên cấu hình",
            Config_Name_Desc = "Nhập tên cấu hình bạn muốn tạo.",
            Config_List = "Danh sách cấu hình",
            Config_List_Desc = "Chọn cấu hình bạn đã tạo.",
            Make_Config = "Tạo cấu hình",
            Make_Config_Desc = "Nhấn để tạo cấu hình theo tên đã nhập.",
            Config = "Cấu hình",
            Config_Content = "Vui lòng nhập tên cấu hình",
            Config_Content1 = "Cấu hình đã tồn tại",
            Config_Content2 = "Đã tạo cấu hình thành công",
            Update_Config = "Cập nhật cấu hình",
            Update_Config_Content = "Nhấn để cập nhật cấu hình đã chọn.",
            Config_Content3 = "Chưa chọn cấu hình",
            Config_Content4 = "Cấu hình không tồn tại",
            Config_Content5 = "Đã cập nhật cấu hình.",
            Load_Config = "Tải cấu hình",
Load_Config_Desc = "Nhấn để tải cấu hình đã chọn.",
            Config_Content6 = "Vui lòng chọn một cấu hình trước",
            Config_Content7 = "Cấu hình không tồn tại",
            Config_Content8 = "Đã tải cấu hình thành công.",
            Delete_Config = "Xóa cấu hình",
            Delete_Config_Desc = "Nhấn để xóa cấu hình đã chọn.",
            Config_Content9 = "Chưa chọn cấu hình",
            Config_Content10 = "Cấu hình đã được xóa trước đó",
            Config_Content11 = "Đã xóa cấu hình thành công.",
            Auto_Load_Config = "Tự động tải cấu hình",
            Auto_Load_Config_Desc = "Tự động đồng bộ trong 3 giây đầu, sau đó tự động lưu mỗi 1 giây.",
            Auto_Load = "Tự động tải",
            Config_Content12 = "Vui lòng chọn một cấu hình trước",
            Disabled = "Đã tắt",
            Config_Content13 = "Đã chuyển sang Tự động lưu cấu hình",
            Languages = "Ngôn ngữ",
            UI = "Giao diện",
            Config = "Cấu hình",
            Free = "Miễn phí",
            SelectSprinkler = "Chọn vòi tưới",
            SelectSprinklerDesc = "Chọn sprinkler để tự động sử dụng.",
            AutoPlaceSprinkler = "Tự đặt vòi tưới",
            AutoPlaceSprinklerDesc = "Tự động đặt sprinkler đã chọn.",
            AutoEquipSprinkler = "Tự dùng vòi tưới",
            AutoEquipSprinklerDesc = "Tự động trang bị sprinkler đã chọn.",
            SelectPets = "Chọn thú cưng",
            SelectPetsDesc = "Chọn thú cưng để mua.",
            TeleportToPets = "Dịch chuyển đến thú cưng",
            TeleportToPetsDesc = "Tự động dịch chuyển đến thú cưng đã chọn.",
            AutoBuyPets = "Tự mua thú cưng",
            AutoBuyPetsDesc = "Tự động mua các thú cưng đã chọn.",
            SelectFruit = "Chọn trái cây",
            SelectFruitDesc = "Chọn loại trái cây cần nhắm đến.",
            SelectMutations = "Chọn đột biến",
            SelectMutationsDesc = "Chọn các loại đột biến cần nhắm đến.",
            Countofmutations = "Số lượng đột biến",
            CountofmutationsDesc = "Đặt số lượng đột biến tối thiểu yêu cầu.",
            OnlyStealMutations = "Chỉ trộm đột biến",
            OnlyStealMutationsDesc = "Chỉ trộm những trái cây có các đột biến đã chọn.",
            OnlyHarvestMutations = "Chỉ thu hoạch đột biến",
            OnlyHarvestMutationsDesc = "Chỉ thu hoạch những trái cây có các đột biến đã chọn.",
            JumpPower1 = "Sức mạnh nhảy",
            SpeedPower = "Sức mạnh tốc độ",
            AirPower = "Sức mạnh không khí",
            JumpPowerDesc1 = "Điều chỉnh sức bật của nhân vật.",
            SpeedPowerDesc = "Điều chỉnh tốc độ di chuyển của nhân vật.",
            AirPowerDesc = "Điều chỉnh lực trên không của nhân vật.",
            Bypass = "Vượt giới hạn",
            BypassDesc = "Các chức năng vượt giới hạn của trò chơi.",
            AntiAFK = "Vượt Anti-AFK",
            AntiAFKDesc = "Vượt cơ chế chống AFK của trò chơi.",
            GreenbeanSeed = "Hạt Greenbean",
            GreenbeanSeedDesc = "Vượt quyền mua Hạt Greenbean.",
            Rejoin_Starting = "Đang bắt đầu vào lại",
            Rejoin_Starting_Content1 = "Đã vào máy chủ với chế độ giảm lag được kích hoạt.",
            Rejoin_Settings = "Cài đặt vào lại",
            Rejoin_Settings_Content2 = "Đang giảm lag máy chủ...",
            Teleport_Error = "Lỗi dịch chuyển",
            Rejoin_To_Fix_Lag = "Vào lại để giảm lag",
            Rejoin_To_Fix_Lag_Desc = "Nhấn để kích hoạt tính năng giảm lag máy chủ.",
            FixLag = "Giảm giật",
            FixLagDesc = "Nâng cao trải nghiệm người dùng với hiệu năng mượt mà hơn.",
            SelectPlant = "Chọn cây trồng",
            SelectPlantDesc = "Chọn loại cây sẽ sử dụng.",
            AutoPlant = "Tự động trồng cây",
            AutoPlantDesc = "Tự động trồng loại cây đã chọn.",
            Plant = "Trồng cây",
            PlantSections = "Cài đặt chung cho các tính năng trồng cây.",
            AntiRagdoll = "Chống gục ngã",
            AntiRagdollDesc = "Ngăn nhân vật của bạn rơi vào trạng thái gục ngã.",
            AuraRange = "Phạm vi tấn công",
            AuraRangeDesc = "Điều chỉnh khoảng cách tối đa để tấn công mục tiêu.",
            AttackCooldown = "Thời gian hồi đánh",
            AttackCooldownDesc = "Điều chỉnh khoảng thời gian giữa các đòn tấn công liên tiếp.",
            AutoAimbot = "Tự động ngắm",
            AutoAimbotDesc = "Tự động ngắm vào mục tiêu gần nhất.",
            SilentAttack = "Tấn công im lặng",
            SilentAttackDesc = "Tự động sử dụng kỹ năng tấn công kẻ địch mà không cần ngắm trực tiếp.",
            ShovelPower = "Sức mạnh xẻng",
            ShovelPowerDesc = "Điều chỉnh các tính năng tự động tấn công người chơi ở gần.",
            AntiBeeSting = "Chống ong đốt",
            AntiBeeStingDesc = "Chống bị đảo nút di chuyển do ong đốt.",
            LowPlayerServer = "Máy chủ ít người",
            LowPlayerServerSections = "Điều chỉnh các tùy chọn để tham gia máy chủ có ít người chơi hơn.",
            Target_Players = "Số lượng người chơi",
            Target_Players_Desc = "Thiết lập số lượng người chơi tối đa trong máy chủ.",
            Server_List = "Danh sách máy chủ",
            Server_List_Desc = "Hiển thị danh sách các máy chủ khả dụng.",
            Search_Servers = "Tìm máy chủ",
            Search_Servers_Desc = "Tìm kiếm các máy chủ phù hợp với tiêu chí đã chọn.",
            Join_Selected_Server = "Vào máy chủ đã chọn",
            Join_Selected_Server_Desc = "Tham gia máy chủ mà bạn đã chọn từ danh sách.",
            Scan_Pet_Servers = "Quét server có pet",
            Scan_Pet_Servers_Desc = "Quét các máy chủ để tìm thú cưng đã chọn.",
            Pet_Servers_List = "Danh sách server có pet",
            Pet_Servers_List_Desc = "Hiển thị danh sách máy chủ có thú cưng đã chọn.",
            Target_Pet = "Mục tiêu thú cưng",
            Target_Pet_Desc = "Chọn thú cưng cần tìm.",
            FindPetServer = "Máy chủ có thú cưng",
            FindPetServerSections = "Tùy chỉnh các chức năng giúp bạn tìm thú cưng",
            Weather = "Thời Tiết",
            WeatherDesc = "Cài đặt chức năng dự đoán thời tiết tiếp theo trong trò chơi",
            TPzone = "Dịch chuyển đến khu vực",
            TPzoneDesc = "Các nút dịch chuyển bạn đến địa điểm bạn muốn",
            HarvestMode = "Chế dộ thu hoạch",
            HarvestModeDesc = "Chọn chế độ thu hoạch.",
            SuperFastSpeed = "Tốc độ super fast",
            SuperFastSpeedDesc = "Điều chỉnh tốc độ của chế độ Super Fast.",
            SuperFastBatchSize = "Số lượng xử lý siêu nhanh",
            SuperFastBatchSizeDesc = "Thiết lập số lượng cây được thu hoạch trong mỗi đợt.",
            SelectCrate = "Chọn thùng",
            SelectCrateDesc = "Chọn loại thùng để mua.",
            AutoBuyCrate = "Tự mua thùng",
            AutoBuyCrateDesc = "Tự động mua loại thùng đã chọn đang bán.",
            BuyCrateSpeed = "Tốc độ mua thùng",
            BuyCrateSpeedDesc = "Điều chỉnh tốc độ mua các thùng đã chọn.",
            ShowCrateShop = "Hiển thị cửa hàng đạo cụ",
            ShowCrateShopDesc = "Hiển thị giao diện cửa hàng đạo cụ.",
            View_Sell_Prices = "Xem giá bán",
            View_Sell_Prices_Desc = "Hiển thị giá bán của các vật phẩm hiện có.",
            OpenEgg = "Mở trứng",
            OpenEggDesc = "Điều chỉnh các cài đặt để tự động mở trứng.",
            OpenCrate = "Mở thùng",
            OpenCrateDesc = "Điều chỉnh các cài đặt để tự động mở thùng.",
            OpenSeed = "Mở hạt giống",
            OpenSeedDesc = "Điều chỉnh các cài đặt để tự động mở gói hạt giống.",
            Open_All_Eggs = "Mở tất cả trứng",
            Open_All_Eggs_Desc = "Mở toàn bộ trứng có trong túi đồ ngay lập tức.",
            Auto_Open_Eggs = "Tự động mở trứng",
            Auto_Open_Eggs_Desc = "Tự động mở trứng liên tục cho đến khi tắt.",
            Open_All_Crates = "Mở tất cả thùng",
            Open_All_Crates_Desc = "Mở toàn bộ rương có trong túi đồ ngay lập tức.",
            Auto_Open_Crates = "Tự động mở thùng",
            Auto_Open_Crates_Desc = "Tự động mở rương liên tục cho đến khi tắt.",
            Open_All_SeedPacks = "Mở tất cả gói hạt",
            Open_All_SeedPacks_Desc = "Mở toàn bộ gói hạt giống có trong túi đồ ngay lập tức.",
            Auto_Open_SeedPacks = "Tự động mở gói hạt",
            Auto_Open_SeedPacks_Desc = "Tự động mở gói hạt giống liên tục cho đến khi tắt.",
            SellMode = "Chế độ bán",
            SellModeDesc = "Chọn chế độ bán trái bạn muốn.",
            AutoDailySell = "Tự bán hàng ngày",
            AutoDailySellDesc = "Tự động sử dụng tính năng Bán hằng ngày để giúp tăng giá bán.",
            ShowAuction = "Hiển thị bảng đấu giá",
            ShowAuctionDesc = "Hiển thị giao diện cửa hàng đấu giá.",
        }
    }
})

local themes = {"Dark", "Light", "Gray", "Blue", "Green", "Purple"}
local currentThemeIndex = 1

if not getgenv().TransparencyEnabled then
    getgenv().TransparencyEnabled = true
end

local Window = WindUI:CreateWindow({
    Title = "loc:HubTitle", 
    Icon = "rbxassetid://109995816235688", 
    Background = "rbxassetid://97012461614902",
    Author = "loc:GameTitle",
    Folder = "Hutao Hub Gag2",
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
            if currentThemeIndex > #themes then
                currentThemeIndex = 1
            end
            
            local newTheme = themes[currentThemeIndex]
            WindUI:SetTheme(newTheme)
           
            WindUI:Notify({
                Title = "loc:ThemeChanged", 
                Content = "Switched to " .. newTheme .. " theme!", 
                Duration = 2,
                Icon = "palette"
            })
        end,
    },
})

Window:SetToggleKey(Enum.KeyCode.V)

pcall(function()
    Window:CreateTopbarButton("TransparencyToggle", "eye", function()
        if getgenv().TransparencyEnabled then
            getgenv().TransparencyEnabled = false
            pcall(function() Window:ToggleTransparency(false) end)
            
            WindUI:Notify({
                Title = "loc:TransparencyTitle", 
                Content = "loc:TransparencyDisabled", 
                Duration = 3,
                Icon = "eye"
            })
        else
            getgenv().TransparencyEnabled = true
            pcall(function() Window:ToggleTransparency(true) end)
            
            WindUI:Notify({
                Title = "loc:TransparencyTitle", 
                Content = "loc:TransparencyEnabled", 
                Duration = 3,
                Icon = "eye-off"
            })
        end
    end, 990)
end)

local OpenButtonConfig = {
    Title = "Open Gui",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 140, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 120)),
    }),
    Draggable = true,
    Scale = 0.9,
    OnlyIcon = false,
}

Window:EditOpenButton(OpenButtonConfig)

Window:Tag({Title = "loc:Free", Icon = "gift", Color = Color3.fromHex("#30ff6a")})
Window:Tag({Title = "v1.4.5", Icon = "cog", Color = Color3.fromHex("#30ff6a")})

local Tabs = {
    About = Window:Section({ Title = "loc:About", Opened = true }),
    Features = Window:Section({ Title = "loc:Features", Opened = true }),
    Gameplay = Window:Section({ Title = "loc:Gameplay", Opened = true }),
    System = Window:Section({ Title = "loc:System", Opened = true }),
}

local TabHandles = {
    Update = Tabs.About:Tab({ 
        Title = "loc:Update", Icon = "history", Desc = "Cập Nhật", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),

    Info = Tabs.About:Tab({ 
        Title = "loc:Information", Icon = "badge-info", Desc = "Thông Tin", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Main = Tabs.Features:Tab({ 
        Title = "loc:Main", Icon = "house", Desc = "Phần Chính", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Shop = Tabs.Features:Tab({ 
        Title = "loc:Shop", Icon = "shopping-cart", Desc = "Cửa Hàng", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Server = Tabs.Features:Tab({ 
        Title = "loc:Server", Icon = "server", Desc = "Máy Chủ", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Items = Tabs.Gameplay:Tab({ 
        Title = "loc:Items", Icon = "toolbox", Desc = "Vật Phẩm", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Player = Tabs.Gameplay:Tab({ 
        Title = "loc:Player", Icon = "user", Desc = "Người Chơi", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1
    }),
    
    Visual = Tabs.Gameplay:Tab({ 
        Title = "loc:Visual", Icon = "eye", Desc = "Thị Giác", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1
    }),
    
    TP = Tabs.Gameplay:Tab({ 
        Title = "loc:Teleport", Icon = "map", Desc = "Dịch Chuyển", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1
    }),
    
    Misc = Tabs.System:Tab({ 
        Title = "loc:Misc", Icon = "menu", Desc = "Linh Tinh", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Settings = Tabs.System:Tab({ 
        Title = "loc:Settings", Icon = "settings", Desc = "Cài Đặt", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1
    }),
}

local MyUIElements = {}

local ElementConfigs = {
    {
        ID = "Harvest",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Harvest",
            Desc = "loc:Harvest_Sections",
            Icon = "leaf",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Steal",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Steal",
            Desc = "loc:Steal_Sections",
            Icon = "hand-coins",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Seed",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Seed",
            Desc = "loc:SeedSections",
            Icon = "wheat",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Pets",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Pets",
            Desc = "loc:PetsSections",
            Icon = "paw-print",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Gear",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Gear",
            Desc = "loc:GearSections",
            Icon = "wrench",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Plant",
        Type = "Section",
        Parent = TabHandles.Main,
        Config = {
            Title = "loc:Plant",
            Desc = "loc:PlantSections",
            Icon = "sprout",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Shop",
        Type = "Section",
        Parent = TabHandles.Shop,
        Config = {
            Title = "loc:Shop",
            Desc = "loc:Shop_Sections",
            Icon = "shopping-cart",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "SellFruit",
        Type = "Section",
        Parent = TabHandles.Shop,
        Config = {
            Title = "loc:SellFruit",
            Desc = "loc:SellFruitSections",
            Icon = "coins",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "BuySeed",
        Type = "Section",
        Parent = TabHandles.Shop,
        Config = {
            Title = "loc:BuySeed",
            Desc = "loc:BuySeedSections",
            Icon = "bean",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "GearShop",
        Type = "Section",
        Parent = TabHandles.Shop,
        Config = {
            Title = "loc:BuyGear",
            Desc = "loc:BuyGearSections",
            Icon = "droplet",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "CrateShop",
        Type = "Section",
        Parent = TabHandles.Shop,
        Config = {
            Title = "loc:BuyCrate",
            Desc = "loc:BuyCrateSections",
            Icon = "package",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "LowPlayerServer",
        Type = "Section",
        Parent = TabHandles.Server,
        Config = {
            Title = "loc:LowPlayerServer",
            Desc = "loc:LowPlayerServerSections",
            Icon = "search",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "FindPetServer",
        Type = "Section",
        Parent = TabHandles.Server,
        Config = {
            Title = "loc:FindPetServer",
            Desc = "loc:FindPetServerSections",
            Icon = "radar",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "OpenEgg",
        Type = "Section",
        Parent = TabHandles.Items,
        Config = {
            Title = "loc:OpenEgg",
            Desc = "loc:OpenEggDesc",
            Icon = "egg",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "OpenCrate",
        Type = "Section",
        Parent = TabHandles.Items,
        Config = {
            Title = "loc:OpenCrate",
            Desc = "loc:OpenCrateDesc",
            Icon = "package",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "OpenSeed",
        Type = "Section",
        Parent = TabHandles.Items,
        Config = {
            Title = "loc:OpenSeed",
            Desc = "loc:OpenSeedDesc",
            Icon = "id-card",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "NormalPower",
        Type = "Section",
        Parent = TabHandles.Player,
        Config = {
            Title = "loc:Power",
            Desc = "loc:PowerDesc",
            Icon = "zap",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "SpeedPower",
        Type = "Section",
        Parent = TabHandles.Player,
        Config = {
            Title = "loc:SpeedPower",
            Desc = "loc:SpeedPowerDesc",
            Icon = "gauge",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "JumpPower1",
        Type = "Section",
        Parent = TabHandles.Player,
        Config = {
            Title = "loc:JumpPower1",
            Desc = "loc:JumpPowerDesc1",
            Icon = "rabbit",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "AirPower",
        Type = "Section",
        Parent = TabHandles.Player,
        Config = {
            Title = "loc:AirPower",
            Desc = "loc:AirPowerDesc",
            Icon = "wind",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "ShovelPower",
        Type = "Section",
        Parent = TabHandles.Player,
        Config = {
            Title = "loc:ShovelPower",
            Desc = "loc:ShovelPowerDesc",
            Icon = "shovel",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "TPzone",
        Type = "Section",
        Parent = TabHandles.TP,
        Config = {
            Title = "loc:TPzone",
            Desc = "loc:TPzoneDesc",
            Icon = "map-pinned",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "FixLag",
        Type = "Section",
        Parent = TabHandles.Misc,
        Config = {
            Title = "loc:FixLag",
            Desc = "loc:FixLagDesc",
            Icon = "microchip",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Weather",
        Type = "Section",
        Parent = TabHandles.Misc,
        Config = {
            Title = "loc:Weather",
            Desc = "loc:WeatherDesc",
            Icon = "cloud-sun",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "Bypass",
        Type = "Section",
        Parent = TabHandles.Misc,
        Config = {
            Title = "loc:Bypass",
            Desc = "loc:BypassDesc",
            Icon = "shield-off",
            Box = true,
            BoxBorder = true,
            Opened = false,
            Hover = true,
        }
    },
    
    {
        ID = "SettingsManager", 
        Type = "MultiSection",
        Parent = TabHandles.Settings,
        Config = {
            Title = "loc:SettingsManager", 
            Desc = "loc:SettingsManagerDesc", 
            Icon = "layers", 
            IconThemed = true, 
            Opened = false, 
            Box = true, 
            BoxBorder = true, 
            HeaderSize = 42,
            HeaderPaddingY = 12,
            HeaderGap = 12,
            IconSize = 22,
            HeaderTextSize = 16,
            ContentPadding = 12,
            ContentGap = 8,
            TabsAlignment = "Left", 
            TabsPadding = 12, 
            TabsGap = 8, 
            TabsHeight = 28, 
        },

        SubTabs = {
            { ID = "Languages", Title = "loc:Languages", Icon = "languages" },
            { ID = "UI", Title = "loc:UI", Icon = "monitor" },
            { ID = "Config", Title = "loc:Config", Icon = "wrench" }
        }
    },
    
}

-- Chạy vòng lặp qua danh sách cấu hình
for _, item in ipairs(ElementConfigs) do
    
    -- Xử lý nếu nó là Section
    if item.Type == "Section" then
        local newSection = item.Parent:Section(item.Config)
        
        -- Lưu vào danh sách để dùng sau
        if item.ID then
            MyUIElements[item.ID] = newSection
        end
        
    -- Xử lý nếu nó là MultiSection
    elseif item.Type == "MultiSection" then
        local newMulti = item.Parent:MultiSection(item.Config)
        
        if item.ID then
            MyUIElements[item.ID] = newMulti
        end
        
        -- Tạo các SubTabs nếu có cấu hình
        if item.SubTabs then
            -- Tạo một bảng con lưu trữ SubTabs trong MultiSection luôn
            newMulti.MySubTabs = {} 
            
            for _, subTabConfig in ipairs(item.SubTabs) do
                local newSubTab = newMulti:Tab({
                    Title = subTabConfig.Title,
                    Icon = subTabConfig.Icon
                })
                
                -- Lưu SubTab lại
                if subTabConfig.ID then
                    newMulti.MySubTabs[subTabConfig.ID] = newSubTab
                end
            end
        end
    end
end

Window:SelectTab(1)

TabHandles.Update:Paragraph({
    Title = "loc:Update",
    Desc = "loc:UpdateDesc",
    Icon = "how",
})

TabHandles.Info:Divider()

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

local GithubRawUrl = "https://raw.githubusercontent.com/SLK-GAMING-MOD/Open-soure/refs/heads/main/DiscordLink.lua" 
local InviteCode = "sGVEDYD2y" -- Code dự phòng lỡ Github sập hoặc user bị lỗi mạng

local gitRes = Core.Request({ Url = GithubRawUrl })
if gitRes and gitRes.Body then
    -- Lọc bỏ khoảng trắng hoặc ký tự xuống dòng thừa ở đầu và cuối chuỗi
    local fetchedText = string.gsub(gitRes.Body, "^%s*(.-)%s*$", "%1")
    
    if fetchedText ~= "" then
        -- Xử lý trường hợp lỡ bro dán cả link https://discord.gg/code thay vì chỉ dán code
        if string.find(fetchedText, "discord.gg/") then
            InviteCode = string.match(fetchedText, "discord.gg/([^%s]+)") or fetchedText
        else
            InviteCode = fetchedText
        end
    end
end

local DiscordAPI =
    "https://discord.com/api/v10/invites/" ..
    InviteCode ..
    "?with_counts=true&with_expiration=true"

local DiscordInfo = TabHandles.Info:Paragraph({
    Title = "Loading Discord...",
    Desc = "Members: --\nOnline: --",
    Image = "rbxassetid://109995816235688",
    ImageSize = 42,
})

TabHandles.Info:Button({
    Title = "loc:Update_Info",
    Desc = "loc:Update_Info_Desc",
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
                Title = "loc:Update_Notify",
                Content = "loc:Update_Notify_Content",
                Duration = 2,
                Icon = "refresh-cw"
            })
        end)
    end
})

TabHandles.Info:Button({
    Title = "loc:Copy_Discord_Invite",
    Desc = "loc:Copy_Discord_Invite_Desc",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/" .. InviteCode)
        end

        WindUI:Notify({
            Title = "loc:Copy_Discord_Invite_Copied",
            Content = "loc:Copy_Discord_Invite_Content",
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

TabHandles.Info:Divider()

TabHandles.Info:Section({
    Title = "loc:Dev_Script",
    TextXAlignment = "Center",
    TextSize = 17
})

TabHandles.Info:Divider()

TabHandles.Info:Paragraph({
    Title = "loc:Main_Owner",
    Desc = "@72ms.",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

TabHandles.Info:Paragraph({
    Title = "loc:Support_Owner",
    Desc = "@datpro7253",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

TabHandles.Info:Paragraph({
    Title = "loc:Security_Owner",
    Desc = "@shadevex",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

TabHandles.Info:Divider()

TabHandles.Info:Section({
    Title = "loc:My_Link",
    TextXAlignment = "Center",
    TextSize = 17
})

TabHandles.Info:Divider()

TabHandles.Info:Paragraph({
    Title = "Youtube",
    Desc = "loc:Youtube_Desc",
    Image = "rbxassetid://122312005360431",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "loc:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://www.youtube.com/@hutaohubteam")
                end
            end
        }
    }
})

TabHandles.Info:Paragraph({
    Title = "Discord",
    Desc = "loc:Discord_Desc",
    Image = "rbxassetid://109995816235688",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "loc:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://discord.gg/" .. InviteCode)
                end
            end
        }
    }
})

TabHandles.Info:Paragraph({
    Title = "TikTok",
    Desc = "loc:TikTok_Desc",
    Image = "rbxassetid://122312005360431",
    ImageSize = 30,
    Buttons = {
        {
            Icon = "copy",
            Title = "loc:Copy_Link",
            Callback = function()
                if setclipboard then
                    setclipboard("https://tiktok.com/@hutaohubteam")
                end
            end
        }
    }
})

local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))

-- ========================================================
-- 1. BẢNG DỮ LIỆU ĐỒNG BỘ GỘP CHUNG & HỆ SỐ ĐIỂM
-- ========================================================
local Config, SysData = {
    AutoHarvest = false, HarvestMode = "Normal (Slow)", HarvestRadius = 50, HarvestSpeed = 0.1, 
    SuperFastSpeed = 0, SuperFastBatchSize = 10, TargetSeeds = {}, TargetEffects = {}, EffectCount = 1, FilterByEffect = false,
    AutoSteal = false, TeleportSteal = false, StealRadius = 50, StealSpeed = 0.2, 
    Steal_TargetSeeds = {}, Steal_TargetEffects = {}, Steal_EffectCount = 1, Steal_FilterByEffect = false,
    AutoGoldSeed = false, AutoRainbowSeed = false, AutoMegaSeed = false,
    WildPet_TargetPets = {}, WildPet_AutoTp = false, WildPet_AutoInteract = false
}, {
    LastHarvest = 0, LastSteal = 0, CachedTargets = {},
    ActiveTarget = nil, ActiveType = nil,
    LockCFrame = nil, IsExecuting = false
}

local ValidItemsLower = {
    ["carrot"] = true, ["strawberry"] = true, ["tomato"] = true, ["blueberry"] = true, ["apple"] = true,
    ["pinetree"] = true, ["bamboo"] = true, ["pumpkin"] = true, ["cactus"] = true, ["pineapple"] = true,
    ["green bean"] = true, ["banana"] = true, ["grape"] = true, ["mushroom"] = true, ["coconut"] = true,
    ["mango"] = true, ["thorn rose"] = true, ["dragon fruit"] = true, ["acorn"] = true, ["cherry"] = true,
    ["sunflower"] = true, ["venus fly trap"] = true, ["lotus"] = true, ["pomegranate"] = true, ["beanstalk"] = true,
    ["poison apple"] = true, ["moon bloom"] = true, ["dragon's breath"] = true, ["poison ivy"] = true, ["glow mushroom"] = true,
    ["ghost pepper"] = true, ["horned melon"] = true, ["corn"] = true, ["baby cactus"] = true, ["tulip"] = true, ["romanesco"] = true
}

local MUTATION_MULT = { Bloodlit = 60, Starstruck = 50, Rainbow = 30, Electric = 25, Frozen = 14, Gold = 10, Golden = 10, Chained = 8 }
local SELL_VALUES = {
    Mushroom = 13000, ["Moon Bloom"] = 9000, Lotus = 6500, ["Dragon's Breath"] = 3400, ["Venus Fly Trap"] = 3000, 
    ["Ghost Pepper"] = 2500, Beanstalk = 2000, Sunflower = 1750, ["Poison Ivy"] = 1700, Romanesco = 1500, 
    Bamboo = 800, ["Poison Apple"] = 900, Pomegranate = 900, ["Glow Mushroom"] = 700, Pumpkin = 350, Cherry = 350, 
    Acorn = 200, ["Horned Melon"] = 200, ["Dragon Fruit"] = 150, ["Thorn Rose"] = 140, Mango = 90, Coconut = 60, 
    Tulip = 60, Grape = 45, Cactus = 40, Banana = 35, Corn = 34, Pineapple = 30, Apple = 12, ["Green Bean"] = 10, 
    Tomato = 9, Blueberry = 5, Carrot = 5, Strawberry = 3
}

local SeedList, EffectList, allPets = {}, {"Shiny", "Giant", "Albino", "Overgrown", "Perfect", "Radioactive", "Gold", "Rainbow", "Mutated"}, {}

for k, _ in pairs(ValidItemsLower) do table.insert(SeedList, k) end
table.sort(SeedList)

pcall(function()
    local PetModules = require(ReplicatedStorage:WaitForChild("SharedModules", 5):WaitForChild("PetModules", 5))
    for petName, _ in pairs(PetModules) do
        if type(petName) == "string" then table.insert(allPets, petName) end
    end
    table.sort(allPets)
end)

-- ========================================================
-- 2. HÀM BỔ TRỢ CỐT LÕI
-- ========================================================
local function isTargetPet(petName)
    if type(Config.WildPet_TargetPets) == "table" then
        for key, selected in pairs(Config.WildPet_TargetPets) do
            if (type(key) == "number" and selected == petName) or (type(key) == "string" and key == petName and selected == true) then
                return true
            end
        end
    elseif type(Config.WildPet_TargetPets) == "string" and Config.WildPet_TargetPets == petName then return true end
    return false
end

local function isSeedMatched(seedName, configTable)
    if not configTable or type(configTable) ~= "table" then return true end
    local hasSelection = false
    for k, v in pairs(configTable) do
        local targetName, isSelected = type(k) == "string" and k or v, true
        if type(k) == "string" then isSelected = v end
        if isSelected then
            hasSelection = true
            if string.find(string.lower(seedName), string.lower(targetName), 1, true) then return true end
        end
    end
    return not hasSelection
end

local function isEffectMatched(effectString, configTable)
    if type(configTable) == "table" then
        for k, v in pairs(configTable) do
            local effectName, isSelected = type(k) == "string" and k or v, true
            if type(k) == "string" then isSelected = v end
            if isSelected and string.find(string.lower(effectString), string.lower(effectName), 1, true) then return true end
        end
    end
    return false
end

local function getFruitScore(model)
    local seedName = model:GetAttribute("CorePartName") or model:GetAttribute("SeedName") or model.Name
    local sizeMulti = model:GetAttribute("SizeMulti") or model:GetAttribute("SizeMultiplier") or 1
    local mutation = tostring(model:GetAttribute("Mutation") or model:GetAttribute("MutationName") or "")
    local basePrice = SELL_VALUES[seedName] or 10
    local mutMult = MUTATION_MULT[mutation] or 1
    if mutation ~= "" and mutMult == 1 then mutMult = 1.5 end
    return basePrice * (sizeMulti ^ 2.65) * mutMult
end

local function checkFruitEffectMatch(model, targetEffects, effectCountReq)
    local currentEffectCount, matchedTargetEffect = 0, false
    for k, v in pairs(model:GetAttributes()) do
        local kL, vL = string.lower(tostring(k)), string.lower(tostring(v))
        if string.find(kL, "mutation") or string.find(kL, "effect") then
            currentEffectCount = currentEffectCount + 1
            if isEffectMatched(vL, targetEffects) or isEffectMatched(kL, targetEffects) then matchedTargetEffect = true end
        end
    end
    local effFolder = model:FindFirstChild("Mutations") or model:FindFirstChild("Effects")
    if effFolder then
        for _, child in ipairs(effFolder:GetChildren()) do
            currentEffectCount = currentEffectCount + 1
            if isEffectMatched(child.Name, targetEffects) or (child:IsA("StringValue") and isEffectMatched(child.Value, targetEffects)) then
                matchedTargetEffect = true
            end
        end
    end
    local hasRequiredEffectsSelected = false
    if type(targetEffects) == "table" then
        for k, v in pairs(targetEffects) do
            if (type(k) == "string" and v) or (type(k) == "number") then hasRequiredEffectsSelected = true break end
        end
    end
    if currentEffectCount < effectCountReq then return false end
    if hasRequiredEffectsSelected and not matchedTargetEffect then return false end
    return true
end

local function getPlotOwner(plot)
    local ownerAttr = plot:GetAttribute("Owner")
    if ownerAttr and ownerAttr ~= "" then return tostring(ownerAttr) end
    local signs = plot:FindFirstChild("Signs")
    local gardenFolder = signs and signs:FindFirstChild("Garden")
    local corePart = gardenFolder and gardenFolder:FindFirstChild("CorePart")
    if corePart then
        local textLabel = corePart:FindFirstChildWhichIsA("TextLabel", true)
        if textLabel and string.find(textLabel.Text, "'s Garden", 1, true) then
            return string.match(string.gsub(textLabel.Text, "'s Garden", ""), "^%s*(.-)%s*$")
        end
    end
    return nil
end

local function isInventoryFullSafe()
    if type(getgenv().isInventoryFull) == "function" then return getgenv().isInventoryFull() end
    return false
end

local function lockCFrameForDuration(hrp, targetCFrame, duration)
    local endTime = tick() + duration
    while tick() < endTime and hrp and hrp.Parent do
        hrp.CFrame = targetCFrame
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        RunService.Heartbeat:Wait()
    end
end

local function executeActionDirectly(data)
    if not data then return end
    if data.IsHarvest and data.PlantId then
        Networking.Garden.CollectFruit:Fire(data.PlantId, data.FruitId)
    elseif data.IsSteal and data.OwnerUserId and data.PlantId then
        Networking.Steal.BeginSteal:Fire(data.OwnerUserId, data.PlantId, data.FruitId)
        Networking.Steal.CompleteSteal:Fire()
    elseif data.Prompt then
        if fireproximityprompt then
            fireproximityprompt(data.Prompt)
        else
            data.Prompt:InputHoldBegin()
            task.wait(data.Prompt.HoldDuration or 0.1)
            data.Prompt:InputHoldEnd()
        end
    end
end

local function PerformSeedRoutine(data, actionType)
    if SysData.IsExecuting then return end
    SysData.IsExecuting = true
    local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then SysData.IsExecuting = false return end
    
    local originalCFrame = hrp.CFrame
    local targetPart = data.RefPart or data.Part
    local finalTarget = targetPart.CFrame * CFrame.new(0, 3, 0)
    
    lockCFrameForDuration(hrp, finalTarget, 3)
    while targetPart and targetPart.Parent do
        task.wait(1)
        if not targetPart or not targetPart.Parent then break end
        
        local targetPrompt = data.Prompt or targetPart:FindFirstChildWhichIsA("ProximityPrompt", true)
        if targetPrompt then
            targetPrompt.Enabled = true
            targetPrompt.RequiresLineOfSight = false
            targetPrompt.MaxActivationDistance = 50
            if fireproximityprompt then
                fireproximityprompt(targetPrompt)
            else
                targetPrompt:InputHoldBegin()
                task.wait(targetPrompt.HoldDuration or 0.1)
                targetPrompt:InputHoldEnd()
            end
        end
        lockCFrameForDuration(hrp, finalTarget, 1)
    end
    lockCFrameForDuration(hrp, originalCFrame, 3)
    SysData.IsExecuting = false
end

local function GetOptimizedHarvestTargets(plot)
    local entries = {}
    local plantsFolder = plot:FindFirstChild("Plants")
    if not plantsFolder then return entries end

    for _, plant in ipairs(plantsFolder:GetChildren()) do
        if not plant:IsA("Model") then continue end
        local plantId = plant:GetAttribute("PlantId")
        local fruitsFolder = plantId and plant:FindFirstChild("Fruits")
        
        if fruitsFolder then
            for _, fruit in ipairs(fruitsFolder:GetDescendants()) do
                local fruitId = fruit:GetAttribute("FruitId")
                local isReady = fruit:GetAttribute("FruitGrowthReady") ~= false
                local age, maxAge = fruit:GetAttribute("Age"), fruit:GetAttribute("MaxAge")
                if age and maxAge and age < maxAge then isReady = false end

                if fruitId and isReady then
                    local seedName = fruit:GetAttribute("CorePartName") or plant:GetAttribute("SeedName") or plant.Name
                    
                    if Config.FilterByEffect or #Config.TargetSeeds > 0 then
                        if not isSeedMatched(seedName, Config.TargetSeeds) then continue end
                        if Config.FilterByEffect and not checkFruitEffectMatch(fruit, Config.TargetEffects, Config.EffectCount) then continue end
                    end

                    local pos = fruit.PrimaryPart and fruit.PrimaryPart.Position or fruit:GetPivot().Position
                    table.insert(entries, { PlantId = plantId, FruitId = fruitId, Pos = pos, Score = getFruitScore(fruit) })
                end
            end
        end
    end

    for _, prompt in ipairs(CollectionService:GetTagged("HarvestPrompt")) do
        if prompt:GetAttribute("Collected") then continue end
        local model = prompt.Parent and prompt.Parent:FindFirstAncestorWhichIsA("Model")
        if model and model:IsDescendantOf(plantsFolder) then
            local plantId = model:GetAttribute("PlantId")
            local fruitId = model:GetAttribute("FruitId") or ""
            local seedName = model:GetAttribute("SeedName") or model.Name
            
            if Config.FilterByEffect or #Config.TargetSeeds > 0 then
                if not isSeedMatched(seedName, Config.TargetSeeds) then continue end
                if Config.FilterByEffect and not checkFruitEffectMatch(model, Config.TargetEffects, Config.EffectCount) then continue end
            end

            table.insert(entries, { PlantId = plantId, FruitId = fruitId, Pos = model:GetPivot().Position, Score = getFruitScore(model) })
        end
    end

    table.sort(entries, function(a, b)
        if math.abs(a.Pos.X - b.Pos.X) > 8 then return a.Pos.X < b.Pos.X end
        if math.abs(a.Pos.Z - b.Pos.Z) > 8 then return a.Pos.Z < b.Pos.Z end
        return a.Score > b.Score
    end)

    return entries
end

-- ========================================================
-- 3. GIAO DIỆN UI
-- ========================================================
if MyUIElements then
    local superFastInput 
    local superFastBatchInput

    MyUIElements.Harvest:Dropdown({
        Title = "loc:HarvestMode", Desc = "loc:HarvestModeDesc", 
        Flag = "Harvest_Mode", Values = {"Normal (Slow)", "Super Fast (Batch)"}, Value = "Normal (Slow)", 
        Callback = function(val) 
            Config.HarvestMode = val 
            local isSlowMode = (val == "Normal (Slow)")
            if superFastInput then
                if isSlowMode then if superFastInput.Lock then superFastInput:Lock() else superFastInput.Locked = true end
                else if superFastInput.Unlock then superFastInput:Unlock() else superFastInput.Locked = false end end
            end
            if superFastBatchInput then
                if isSlowMode then if superFastBatchInput.Lock then superFastBatchInput:Lock() else superFastBatchInput.Locked = true end
                else if superFastBatchInput.Unlock then superFastBatchInput:Unlock() else superFastBatchInput.Locked = false end end
            end
        end
    })

    MyUIElements.Harvest:Dropdown({ Title = "loc:SelectFruit", Desc = "loc:SelectFruitDesc", Flag = "Harvest_TargetSeeds", Values = SeedList, Value = {}, Multi = true, AllowNone = true, Callback = function(val) Config.TargetSeeds = val end })
    MyUIElements.Harvest:Dropdown({ Title = "loc:SelectMutations", Desc = "loc:SelectMutationsDesc", Flag = "Harvest_TargetEffects", Values = EffectList, Value = {}, Multi = true, AllowNone = true, Callback = function(val) Config.TargetEffects = val end })
    superFastInput = MyUIElements.Harvest:Input({ Title = "loc:SuperFastSpeed", Desc = "loc:SuperFastSpeedDesc", Flag = "Super_Fast_Speed", Locked = true, Value = "0", Callback = function(val) Config.SuperFastSpeed = tonumber(val) or 0 end })
    superFastBatchInput = MyUIElements.Harvest:Input({ Title = "loc:SuperFastBatchSize", Desc = "loc:SuperFastBatchSizeDesc", Flag = "Super_Fast_Batch_Size", Locked = true, Value = "10", Callback = function(val) Config.SuperFastBatchSize = tonumber(val) or 10 end })
    MyUIElements.Harvest:Input({ Title = "loc:Countofmutations", Desc = "loc:CountofmutationsDesc", Flag = "Harvest_EffectCount", Value = "1", Callback = function(val) Config.EffectCount = tonumber(val) or 1 end })
    MyUIElements.Harvest:Toggle({ Title = "loc:Auto_Harvest", Desc = "loc:Auto_Harvest_Desc", Flag = "Auto Harvest v2", Value = false, Callback = function(val) Config.AutoHarvest = val end })
    MyUIElements.Harvest:Toggle({ Title = "loc:OnlyHarvestMutations", Desc = "loc:OnlyHarvestMutationsDesc", Flag = "Harvest_EffectFilter", Value = false, Callback = function(val) Config.FilterByEffect = val end })
    MyUIElements.Harvest:Input({ Title = "loc:Harvest_Radius", Desc = "loc:Harvest_Radius_Desc", Flag = "Harvest Radius Config", Placeholder = "Enter harvest radius", Value = "50", Callback = function(val) Config.HarvestRadius = tonumber(val) or 50 end })
    MyUIElements.Harvest:Input({ Title = "loc:Harvest_Speed", Desc = "loc:Harvest_Speed_Desc", Flag = "Harvest Speed Config", Placeholder = "Delay between harvests (Normal Mode)", Value = "0.1", Callback = function(val) Config.HarvestSpeed = tonumber(val) or 0.1 end })

    MyUIElements.Steal:Dropdown({ Title = "loc:SelectFruit", Desc = "loc:SelectFruitDesc", Flag = "Steal_TargetSeeds", Values = SeedList, Value = {}, Multi = true, AllowNone = true, Callback = function(val) Config.Steal_TargetSeeds = val end })
    MyUIElements.Steal:Dropdown({ Title = "loc:SelectMutations", Desc = "loc:SelectMutationsDesc", Flag = "Steal_TargetEffects", Values = EffectList, Value = {}, Multi = true, AllowNone = true, Callback = function(val) Config.Steal_TargetEffects = val end })
    MyUIElements.Steal:Input({ Title = "loc:Countofmutations", Desc = "loc:CountofmutationsDesc", Flag = "Steal_EffectCount", Value = "1", Callback = function(val) Config.Steal_EffectCount = tonumber(val) or 1 end })
    MyUIElements.Steal:Toggle({ Title = "loc:Auto_Steal", Desc = "loc:Auto_Steal_Desc", Flag = "Auto Steal v2", Value = false, Callback = function(val) Config.AutoSteal = val end })
    MyUIElements.Steal:Toggle({ Title = "loc:OnlyStealMutations", Desc = "loc:OnlyStealMutationsDesc", Flag = "Steal_EffectFilter", Value = false, Callback = function(val) Config.Steal_FilterByEffect = val end })
    MyUIElements.Steal:Toggle({ Title = "loc:Teleport_to_Steal", Desc = "loc:Teleport_to_Steal_Desc", Flag = "Teleport Steal Config", Value = false, Callback = function(val) Config.TeleportSteal = val end })
    MyUIElements.Steal:Input({ Title = "loc:Steal_Radius", Desc = "loc:Steal_Radius_Desc", Flag = "Steal Radius Config", Placeholder = "Enter steal radius", Value = "50", Callback = function(val) Config.StealRadius = tonumber(val) or 50 end })
    MyUIElements.Steal:Input({ Title = "loc:Steal_Speed", Desc = "loc:Steal_Speed_Desc", Flag = "Steal Speed Config", Placeholder = "Delay between steals", Value = "0.2", Callback = function(val) Config.StealSpeed = tonumber(val) or 0.2 end })

    MyUIElements.Seed:Toggle({ Title = "loc:AutoClaimGoldSeed", Desc = "loc:AutoClaimGoldSeedDesc", Flag = "Auto Gold Seed Config", Value = false, Callback = function(val) Config.AutoGoldSeed = val end })
    MyUIElements.Seed:Toggle({ Title = "loc:AutoClaimRainbowSeed", Desc = "loc:AutoClaimRainbowSeedDesc", Flag = "Auto Rainbow Seed Config", Value = false, Callback = function(val) Config.AutoRainbowSeed = val end })
    MyUIElements.Seed:Toggle({ Title = "Auto Claim Mega Seed", Desc = "Tự động nhặt Mega Seed", Flag = "Auto Mega Seed Config", Value = false, Callback = function(val) Config.AutoMegaSeed = val end })

    MyUIElements.Pets:Dropdown({ Title = "loc:SelectPets", Desc = "loc:SelectPetsDesc", Flag = "WildPet_Select", Values = allPets, Value = {}, Multi = true, AllowNone = true, Callback = function(val) Config.WildPet_TargetPets = val end })
    MyUIElements.Pets:Toggle({ Title = "loc:TeleportToPets", Desc = "loc:TeleportToPetsDesc", Flag = "WildPet_AutoTp", Value = false, Callback = function(state) Config.WildPet_AutoTp = state end })
    MyUIElements.Pets:Toggle({ Title = "loc:AutoBuyPets", Desc = "loc:AutoBuyPetsDesc", Flag = "WildPet_AutoInteract", Value = false, Callback = function(state) Config.WildPet_AutoInteract = state end })
end

-- ========================================================
-- 4. BỘ KHÓA CFRAME ĐỒNG BỘ 
-- ========================================================
RunService.Heartbeat:Connect(function()
    local playerCharacter = localPlayer.Character
    local hrp = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if SysData.LockCFrame then
        hrp.CFrame = SysData.LockCFrame
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        return
    end

    local isLockValid = false
    if SysData.ActiveTarget then
        local data = SysData.ActiveTarget
        if data.Prompt and data.Prompt.Parent and data.Prompt.Enabled then
            if SysData.ActiveType == "Steal" and Config.AutoSteal and Config.TeleportSteal then
                local timeNow = Lighting.ClockTime
                if timeNow >= 18 or timeNow <= 6 then isLockValid = true end
            elseif SysData.ActiveType == "WildPet" and Config.WildPet_AutoTp and data.RefPart and data.RefPart.Parent then
                isLockValid = true
            end
        end
    end

    if isLockValid then
        local targetCFrame = (SysData.ActiveTarget.RefPart and SysData.ActiveTarget.RefPart.CFrame or SysData.ActiveTarget.Part.CFrame)
        local offset = (SysData.ActiveType == "WildPet") and Vector3.new(0, 2.5, 0) or Vector3.new(0, 3, 0)
        hrp.CFrame = targetCFrame + offset
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    else
        SysData.ActiveTarget = nil
        SysData.ActiveType = nil
    end
end)

-- ========================================================
-- 5. QUÉT VÀ LƯU TRỮ CACHE (TỐI ƯU HÓA SIÊU NHẸ)
-- ========================================================
task.spawn(function()
    while task.wait(0.5) do
        local isAnyFarmActive = Config.AutoHarvest or Config.AutoSteal or Config.AutoGoldSeed or Config.AutoRainbowSeed or Config.AutoMegaSeed
        local isPetActive = Config.WildPet_AutoTp or Config.WildPet_AutoInteract
        if not isAnyFarmActive and not isPetActive then continue end
        
        local newCache = {}
        
        if Config.AutoGoldSeed or Config.AutoRainbowSeed or Config.AutoMegaSeed then
            local mapFolder = Workspace:FindFirstChild("Map")
            local serverLocs = mapFolder and mapFolder:FindFirstChild("SeedPackSpawnServerLocations")
            if serverLocs then
                for _, spawnPart in ipairs(serverLocs:GetChildren()) do
                    if spawnPart:IsA("BasePart") then
                        local isRainbow = spawnPart:GetAttribute("RainbowSeed") == true
                        local isGold = spawnPart:GetAttribute("GoldSeed") == true
                        local isMega = spawnPart:GetAttribute("MegaSeed") == true
                        if (Config.AutoRainbowSeed and isRainbow) or (Config.AutoGoldSeed and isGold) or (Config.AutoMegaSeed and isMega) then
                            table.insert(newCache, { Prompt = nil, Part = spawnPart, IsGoldSeed = isGold, IsRainbowSeed = isRainbow, IsMegaSeed = isMega })
                        end
                    end
                end
            end
        end
        
        if isPetActive then
            local wildPetRef = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WildPetRef")
            local wildPetSpawns = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WildPetSpawns")
            if wildPetRef and wildPetSpawns then
                for _, refPart in ipairs(wildPetRef:GetChildren()) do
                    if refPart:IsA("BasePart") then
                        local petName = refPart:GetAttribute("PetName")
                        local ownerId = refPart:GetAttribute("OwnerUserId")
                        if (not ownerId or ownerId == 0 or ownerId == localPlayer.UserId) and isTargetPet(petName) then
                            for _, petModel in ipairs(wildPetSpawns:GetChildren()) do
                                if petModel:IsA("Model") and petModel:GetAttribute("PetName") == petName then
                                    local primary = petModel.PrimaryPart
                                    if primary and (primary.Position - refPart.Position).Magnitude < 10 then
                                        local prompt = primary:FindFirstChild("BuyPrompt")
                                        if prompt and prompt.Enabled then
                                            table.insert(newCache, { IsWildPet = true, RefPart = refPart, Part = primary, Prompt = prompt })
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if Config.AutoHarvest or Config.AutoSteal then
            local myId = tostring(localPlayer.UserId)
            local function processFarmPrompt(obj, isHarvest, isSteal, plotOwner)
                local model = obj:FindFirstAncestorWhichIsA("Model")
                local isValidAction = true
                
                if model then
                    local targetSeeds, targetEffects, effectCountReq, filterByEffect
                    if isHarvest then
                        targetSeeds, targetEffects, effectCountReq, filterByEffect = Config.TargetSeeds, Config.TargetEffects, Config.EffectCount, Config.FilterByEffect
                    elseif isSteal then
                        targetSeeds, targetEffects, effectCountReq, filterByEffect = Config.Steal_TargetSeeds, Config.Steal_TargetEffects, Config.Steal_EffectCount, Config.Steal_FilterByEffect
                    end

                    local sName = model:GetAttribute("CorePartName") or model:GetAttribute("SeedName") or model.Name
                    isValidAction = isSeedMatched(sName, targetSeeds)
                    if isValidAction and filterByEffect then
                        isValidAction = checkFruitEffectMatch(model, targetEffects, effectCountReq)
                    end
                end

                if isValidAction then
                    table.insert(newCache, {
                        Prompt = obj, Part = obj.Parent, PlotOwner = plotOwner, IsHarvest = isHarvest, IsSteal = isSteal,
                        OwnerUserId = model and tonumber(model:GetAttribute("UserId")), PlantId = model and model:GetAttribute("PlantId"), FruitId = model and model:GetAttribute("FruitId") or ""
                    })
                end
            end

            local gardens = Workspace:FindFirstChild("Gardens")
            if gardens then
                for _, plot in ipairs(gardens:GetChildren()) do
                    local scanTarget = plot:FindFirstChild("Plants") or plot
                    local plotOwnerCache, isMyPlotCache = nil, nil

                    local function getIsMyPlot()
                        if isMyPlotCache == nil then
                            plotOwnerCache = getPlotOwner(plot)
                            isMyPlotCache = (plotOwnerCache == localPlayer.Name or plotOwnerCache == localPlayer.DisplayName or plotOwnerCache == myId)
                        end
                        return isMyPlotCache, plotOwnerCache
                    end

                    for _, obj in ipairs(scanTarget:GetDescendants()) do 
                        if obj:IsA("ProximityPrompt") then
                            local nameL, actL, objL = string.lower(obj.Name), string.lower(obj.ActionText), string.lower(obj.ObjectText)
                            local isHarvest = (string.find(nameL, "harvest") or string.find(actL, "harvest") or string.find(objL, "harvest"))
                            local isSteal = (string.find(nameL, "steal") or string.find(actL, "steal") or string.find(objL, "steal"))

                            -- Chỉ dùng Cache Prompt cho Harvest chế độ Slow, Super Fast quét DataModel độc lập lúc thực thi
                            if isHarvest and Config.AutoHarvest and Config.HarvestMode == "Normal (Slow)" then
                                processFarmPrompt(obj, true, false, nil) 
                            elseif isSteal and Config.AutoSteal then
                                local isMyPlot, owner = getIsMyPlot()
                                if not isMyPlot then processFarmPrompt(obj, false, true, owner) end
                            end
                        end
                    end
                end
            end
        end
        SysData.CachedTargets = newCache
    end
end)

-- ========================================================
-- 6. THỰC THI GỘP LOGIC CỦA CẢ 2 MODE (SLOW VÀ SUPER FAST)
-- ========================================================
task.spawn(function()
    while task.wait(0.05) do
        if SysData.IsExecuting then continue end 
        local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local hrpPos, timeNow = hrp.Position, os.clock()
        
        if SysData.ActiveTarget and SysData.ActiveType ~= "Gold" and SysData.ActiveType ~= "Rainbow" and SysData.ActiveType ~= "Mega" then
            task.spawn(executeActionDirectly, SysData.ActiveTarget)
            continue
        end

        local isNight = (Lighting.ClockTime >= 18 or Lighting.ClockTime <= 6)
        local canSteal = Config.AutoSteal and (timeNow - SysData.LastSteal >= Config.StealSpeed)
        local canHarvest = Config.AutoHarvest and (timeNow - SysData.LastHarvest >= Config.HarvestSpeed) and not isInventoryFullSafe()

        local activePlayersPos = {}
        if canSteal and isNight then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= localPlayer and p.Character then
                    local otherHrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if otherHrp then activePlayersPos[tostring(p.UserId)] = otherHrp.Position end
                end
            end
        end

        local closest = { Rainbow = nil, Gold = nil, Mega = nil, Pet = nil, Steal = nil, Harvest = nil }
        local dists = { Rainbow = math.huge, Gold = math.huge, Mega = math.huge, Pet = math.huge, Steal = (Config.TeleportSteal and math.huge or Config.StealRadius), Harvest = Config.HarvestRadius }

        for _, data in ipairs(SysData.CachedTargets) do
            if not data.Part then continue end
            if not (data.IsGoldSeed or data.IsRainbowSeed or data.IsMegaSeed) and (not data.Prompt or not data.Prompt.Parent) then continue end
            
            local pos = data.RefPart and data.RefPart.Position or data.Part.Position
            if not pos then continue end
            local distance = (hrpPos - pos).Magnitude

            if Config.AutoRainbowSeed and data.IsRainbowSeed and distance < dists.Rainbow then 
                closest.Rainbow = data; dists.Rainbow = distance
            elseif Config.AutoGoldSeed and data.IsGoldSeed and distance < dists.Gold then 
                closest.Gold = data; dists.Gold = distance
            elseif Config.AutoMegaSeed and data.IsMegaSeed and distance < dists.Mega then 
                closest.Mega = data; dists.Mega = distance
            elseif (Config.WildPet_AutoTp or Config.WildPet_AutoInteract) and data.IsWildPet and distance < dists.Pet then 
                closest.Pet = data; dists.Pet = distance
            elseif canSteal and data.IsSteal and distance < dists.Steal and isNight then
                local ownerPos = data.PlotOwner and activePlayersPos[data.PlotOwner]
                if not ownerPos or (ownerPos - pos).Magnitude > 50 then
                    closest.Steal = data; dists.Steal = distance
                end
            elseif canHarvest and data.IsHarvest and not data.JustHarvested and distance < dists.Harvest then 
                closest.Harvest = data; dists.Harvest = distance
            end
        end

        if closest.Rainbow then
            task.spawn(PerformSeedRoutine, closest.Rainbow, "Rainbow")
        elseif closest.Gold then
            task.spawn(PerformSeedRoutine, closest.Gold, "Gold")
        elseif closest.Mega then
            task.spawn(PerformSeedRoutine, closest.Mega, "Mega")
        elseif closest.Pet then
            if Config.WildPet_AutoTp then SysData.ActiveTarget, SysData.ActiveType = closest.Pet, "WildPet" end
            if Config.WildPet_AutoInteract then task.spawn(executeActionDirectly, closest.Pet) end
        elseif closest.Steal and Config.TeleportSteal then
            SysData.ActiveTarget, SysData.ActiveType = closest.Steal, "Steal"
            task.spawn(executeActionDirectly, closest.Steal); SysData.LastSteal = timeNow
        elseif closest.Steal and not Config.TeleportSteal then
            task.spawn(executeActionDirectly, closest.Steal); SysData.LastSteal = timeNow
            
        elseif closest.Harvest and Config.HarvestMode == "Normal (Slow)" then
            closest.Harvest.JustHarvested = true
            task.spawn(executeActionDirectly, closest.Harvest)
            SysData.LastHarvest = timeNow
            
        elseif Config.AutoHarvest and Config.HarvestMode == "Super Fast (Batch)" and canHarvest then
            task.spawn(function()
                SysData.IsExecuting = true
                local myPlot
                local myId = tostring(localPlayer.UserId)
                for _, plot in ipairs(Workspace:FindFirstChild("Gardens") and Workspace.Gardens:GetChildren() or {}) do
                    local owner = getPlotOwner(plot)
                    if owner == localPlayer.Name or owner == localPlayer.DisplayName or owner == myId then
                        myPlot = plot break
                    end
                end

                if myPlot then
                    local harvestTargets = GetOptimizedHarvestTargets(myPlot)
                    local harvestedCount = 0
                    
                    for i = 1, #harvestTargets do
                        if isInventoryFullSafe() or harvestedCount >= Config.SuperFastBatchSize then break end
                        local fruitData = harvestTargets[i]
                        
                        -- Chỉ thu hoạch nếu quả nằm trong bán kính HarvestRadius, KHÔNG DỊCH CHUYỂN
                        if (hrp.Position - fruitData.Pos).Magnitude <= Config.HarvestRadius then
                            Networking.Garden.CollectFruit:Fire(fruitData.PlantId, fruitData.FruitId)
                            harvestedCount = harvestedCount + 1
                            
                            if Config.SuperFastSpeed > 0 then
                                task.wait(Config.SuperFastSpeed)
                            else
                                RunService.Heartbeat:Wait() 
                            end
                        end
                    end
                end
                
                SysData.LastHarvest = os.clock()
                SysData.IsExecuting = false
            end)
        end
    end
end)

local AutoSprinkler = {
	-- Đã gỡ CollectionService vì không còn dùng tới
	Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking")),
	Gardens = Workspace:WaitForChild("Gardens"),
	SelectedTool = nil,
	AutoPlace = false,
	AutoEquip = false,
	LastPlaceTime = 0,
	LastScanTime = 0,
	Cooldown = 0.5,      
	ScanInterval = 0.05  
}

-- Hàm tìm kiếm đối tượng Tool thực tế 
function AutoSprinkler:GetTool()
	local selected = self.SelectedTool
	
	-- CHỐNG ĐẶT BẬY: Nếu chưa chọn gì trên UI thì lập tức từ chối, không tự động lấy tool linh tinh nữa
	if not selected or selected == "" then return nil end

	-- Hàm phụ để check xem tool có trên người hay balo không
	local function findToolInPlayer(toolName)
		if localPlayer.Backpack and localPlayer.Backpack:FindFirstChild(toolName) then
			return localPlayer.Backpack:FindFirstChild(toolName)
		end
		if playerCharacter and playerCharacter:FindFirstChild(toolName) then
			return playerCharacter:FindFirstChild(toolName)
		end
		return nil
	end

	-- Xử lý thông minh: Nếu UI đang dùng Multi = true (chọn nhiều cái cùng lúc)
	if type(selected) == "table" then
		for _, name in pairs(selected) do
			local found = findToolInPlayer(name)
			if found then return found end -- Lấy cái đầu tiên tìm thấy trong danh sách đã chọn
		end
	-- Nếu UI dùng Multi = false (chỉ chọn 1 cái)
	elseif type(selected) == "string" then
		return findToolInPlayer(selected)
	end
	
	return nil
end

-- Hàm lấy Khu Đất (Plot) từ Part dẫm lên
function AutoSprinkler:GetPlot(part)
	local current = part
	while current do
		if current.Parent == self.Gardens and string.match(current.Name, "^Plot%d+$") then
			return current
		end
		current = current.Parent
		if current == Workspace then break end
	end
	return nil
end

MyUIElements.Gear:Dropdown({
	Title = "loc:SelectSprinkler",
	Desc = "loc:SelectSprinklerDesc",
	Values = getgenv().SprinklerList,
	Value = nil,
	Flag = "SelectSprinklerDropdown",
	Multi = true,
	AllowNone = true,
	Callback = function(option) 
		AutoSprinkler.SelectedTool = option 
	end
})

MyUIElements.Gear:Toggle({
	Title = "loc:AutoPlaceSprinkler", 
	Desc = "loc:AutoPlaceSprinklerDesc", 
	Flag = "AutoPlaceSprinklerToggle",
	Value = false, 
	Callback = function(val)
		AutoSprinkler.AutoPlace = val
	end
})

MyUIElements.Gear:Toggle({
	Title = "loc:AutoEquipSprinkler", 
	Desc = "loc:AutoEquipSprinklerDesc", 
	Flag = "AutoEquipSprinklerToggle",
	Value = false, 
	Callback = function(val)
		AutoSprinkler.AutoEquip = val
	end
})

RunService.Heartbeat:Connect(function()
	if not AutoSprinkler.AutoPlace then return end
	
	local now = os.clock()
	if now - AutoSprinkler.LastScanTime < AutoSprinkler.ScanInterval then return end
	AutoSprinkler.LastScanTime = now
	
	if now - AutoSprinkler.LastPlaceTime < AutoSprinkler.Cooldown then return end
	
	local char = playerCharacter
	if not char then return end
	
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChild("Humanoid")
	if not hrp or not humanoid then return end
	
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {char, Camera}
	
	local result = Workspace:Raycast(hrp.Position, Vector3.new(0, -15, 0), params)
	if not result or not result.Instance then return end
	
	local hitPart = result.Instance
	
	-- Đã bỏ check isPlantArea, truyền thẳng hitPart vào GetPlot
	local plot = AutoSprinkler:GetPlot(hitPart)
	if not plot or plot:GetAttribute("Owner") == nil then return end
	
	local myPlotId = localPlayer:GetAttribute("PlotId")
	local plotId = tonumber(string.match(plot.Name, "%d+"))
	
	if myPlotId and plotId == myPlotId then
		local tool = AutoSprinkler:GetTool()
		-- KHI CHƯA CHỌN DROPDOWN => TOOL = NIL => DỪNG LUÔN KHÔNG CHẠY XUỐNG DƯỚI
		if not tool then return end 
		
		if AutoSprinkler.AutoEquip and tool.Parent == localPlayer.Backpack then
			humanoid:EquipTool(tool)
		end
		
		if tool.Parent == char then
			local sprinklerType = tool:GetAttribute("Sprinkler") or tool.Name
			
			AutoSprinkler.Networking.Place.PlaceSprinkler:Fire(result.Position, sprinklerType, tool, plotId)
			AutoSprinkler.LastPlaceTime = now
		end
	end
end)

local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))

-- Đã thêm CurrentSeedIndex và LastFreeCount để theo dõi tình trạng hết hạt
local AutoPlantConfig = {
	AutoPlant = false,
	ParsedSeeds = {},
	CurrentSeedIndex = 1,
	LastFreeCount = -1
}

local Cache = {
	PlotId = nil,
	Grid = {}
}

local function updateSeedList(rawSelection)
	table.clear(AutoPlantConfig.ParsedSeeds)
	
	-- Reset lại bộ đếm mỗi khi ông đổi hạt giống mới trên UI
	AutoPlantConfig.CurrentSeedIndex = 1
	AutoPlantConfig.LastFreeCount = -1
	
	if type(rawSelection) == "table" then
		for k, v in pairs(rawSelection) do
			if type(k) == "string" and v then table.insert(AutoPlantConfig.ParsedSeeds, k) 
			elseif type(v) == "string" then table.insert(AutoPlantConfig.ParsedSeeds, v) end
		end
	elseif type(rawSelection) == "string" and rawSelection ~= "" then
		table.insert(AutoPlantConfig.ParsedSeeds, rawSelection)
	end
end

-- Bộ nhớ đệm Grid (Giữ nguyên vì ông làm chuẩn rồi)
local function getCachedGrid(plot)
	local currentId = localPlayer:GetAttribute("PlotId")
	if Cache.PlotId == currentId and #Cache.Grid > 0 then return Cache.Grid end
	
	Cache.PlotId = currentId
	table.clear(Cache.Grid)
	
	local areas = {}
	for _, p in ipairs(CollectionService:GetTagged("PlantArea")) do
		if p:IsDescendantOf(plot) and p.Size.X * p.Size.Z > 400 then table.insert(areas, p) end
	end
	if #areas == 0 then 
		local ref = plot:FindFirstChild("PlotSizeReference")
		if ref then table.insert(areas, ref) end 
	end

	for i = 1, #areas do
		local cf, sz = areas[i].CFrame, areas[i].Size
		local hx, hz = sz.X/2 - 1, sz.Z/2 - 1
		local topY = areas[i].Position.Y + sz.Y/2 + 0.3
		
		for ix = 0, math.floor((2*hx)/2) do 
			for iz = 0, math.floor((2*hz)/2) do
				local w = (cf * CFrame.new(-hx + ix*2, 0, -hz + iz*2)).Position
				table.insert(Cache.Grid, Vector3.new(w.X, topY, w.Z)) 
			end 
		end
	end
	return Cache.Grid
end

-- Hash Map O(1) check đất trống (Giữ nguyên)
local function getFreePositions(plot, grid)
	local occ = {}
	local plants = plot:FindFirstChild("Plants")
	
	if plants then 
		for _, pl in ipairs(plants:GetChildren()) do 
			local p = pl:GetPivot().Position
			occ[math.floor(p.X/2 + 0.5) .. "_" .. math.floor(p.Z/2 + 0.5)] = true 
		end 
	end
	
	local free = {}
	for i = 1, #grid do
		local pos = grid[i]
		if not occ[math.floor(pos.X/2 + 0.5) .. "_" .. math.floor(pos.Z/2 + 0.5)] then
			table.insert(free, pos)
		end
	end
	return free
end

-- Vòng lặp chính MỚI: Trồng cạn hạt này rồi mới tự động nhảy sang hạt khác
local function autoPlantLoop()
	while AutoPlantConfig.AutoPlant do
		task.wait(0.1) 
		local seedCount = #AutoPlantConfig.ParsedSeeds
		if seedCount == 0 then continue end

		local plotId = localPlayer:GetAttribute("PlotId")
		if not plotId then continue end
		
		local gardens = Workspace:FindFirstChild("Gardens")
		local myPlot = gardens and gardens:FindFirstChild("Plot" .. tostring(plotId))
		if not myPlot then continue end
		
		local freePos = getFreePositions(myPlot, getCachedGrid(myPlot))
		local count = math.min(#freePos, 200) 
		
		if count > 0 then
			-- LOGIC MỚI: Nếu số ô trống đợt này y hệt đợt trước -> Lần trồng trước đã xịt (do ông hết hạt đó)
			-- Lập tức next sang loại hạt giống tiếp theo
			if count == AutoPlantConfig.LastFreeCount then
				AutoPlantConfig.CurrentSeedIndex = AutoPlantConfig.CurrentSeedIndex + 1
			end
			
			-- Xoay vòng index nếu đã thử đến hạt cuối cùng
			if AutoPlantConfig.CurrentSeedIndex > seedCount then
				AutoPlantConfig.CurrentSeedIndex = 1
			end
			
			-- Chỉ trồng duy nhất 1 loại hạt trong chu kỳ này
			local seedToPlant = AutoPlantConfig.ParsedSeeds[AutoPlantConfig.CurrentSeedIndex]
			
			for i = 1, count do
				if not AutoPlantConfig.AutoPlant then break end
				
				task.spawn(function()
					Networking.Plant.PlantSeed:Fire(freePos[i], seedToPlant, myPlot)
				end)
				
				-- Để 15 vòng nghỉ 1 frame cho mượt mà, không lo dính rate limit
				if i % 15 == 0 then task.wait() end 
			end
			
			-- Lưu lại số ô trống để vòng sau so sánh
			AutoPlantConfig.LastFreeCount = count
		else
			-- Nếu đất đã đầy -> Reset đếm để đợt thu hoạch sau ưu tiên hạt đầu tiên
			AutoPlantConfig.LastFreeCount = -1
			AutoPlantConfig.CurrentSeedIndex = 1
		end
	end
end

MyUIElements.Plant:Dropdown({
	Title = "loc:SelectPlant",
	Desc = "loc:SelectPlantDesc",
	Flag = "SelectPlantSeed",
	Values = getgenv().SeedList,
	Value = {},
	Multi = true,
	AllowNone = false,
	Callback = function(val) 
		updateSeedList(val)
	end
})

MyUIElements.Plant:Toggle({
	Title = "loc:AutoPlant",
	Desc = "loc:AutoPlantDesc",
	Flag = "AutoPlantToggle",
	Callback = function(state) 
		AutoPlantConfig.AutoPlant = state 
		if state then
			task.spawn(autoPlantLoop)
		end
	end
})

local SellSettings = {
    AutoSellAll = false,
    AutoSellNormal = false,
    SellAllSpeed = 1.0,     
    SellNormalSpeed = 1.0,
    SellMode = 1,
    DailySell = false
}

local Networking = nil
pcall(function()
    Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
end)

-- Khai báo biến DailySellToggle TRƯỚC để UI logic có thể tương tác
local DailySellToggle 

--------------------------------------------------
-- CORE LOOPS
--------------------------------------------------
-- Vòng lặp Auto Sell All 
task.spawn(function()
    while true do
        if SellSettings.AutoSellAll and Networking then
            local canSell = false
            
            if SellSettings.SellMode == 1 then
                canSell = true
            elseif SellSettings.SellMode == 2 then
                -- GỌI HÀM TỪ GLOBAL ENVIRONMENT TẠI ĐÂY
                canSell = getgenv().isInventoryFull()
            end

            if canSell then
                pcall(function()
                    if SellSettings.SellMode == 2 and SellSettings.DailySell then
                        local dailyDealData = Networking.NPCS.CheckDailyDeal:Fire()
                        
                        if dailyDealData and dailyDealData.Available then
                            Networking.NPCS.UseDailyDealAll:Fire()
                        else
                            Networking.NPCS.SellAll:Fire()
                        end
                    else
                        Networking.NPCS.SellAll:Fire()
                    end
                end)
                task.wait(SellSettings.SellAllSpeed)
            else
                task.wait(0.5)
            end
        else
            task.wait(0.5) 
        end
    end
end)

-- Vòng lặp Auto Sell Normal
task.spawn(function()
    while true do
        if SellSettings.AutoSellNormal and Networking then
            pcall(function()
                local playerCharacter = localPlayer.Character
                if playerCharacter then
                    local tool = playerCharacter:FindFirstChildOfClass("Tool")
                    if tool then
                        local fruitName = tool:GetAttribute("FruitName")
                        local petName = tool:GetAttribute("Pet")
                        
                        if fruitName then
                            local fruitId = tool:GetAttribute("Id")
                            if fruitId then
                                Networking.NPCS.SellFruit:Fire(fruitId)
                            end
                        elseif petName then
                            local petId = tool:GetAttribute("PetId")
                            if petId then
                                Networking.NPCS.SellPet:Fire(petId)
                            end
                        end
                    end
                end
            end)
            task.wait(SellSettings.SellNormalSpeed)
        else
            task.wait(0.5)
        end
    end
end)

--------------------------------------------------
-- UI CONTROLLER UTILITY
--------------------------------------------------
-- Hàm bổ trợ quét và gọi GuiController
local function openGameUI(uiName)
    local playerScripts = localPlayer:WaitForChild("PlayerScripts", 5)
    local guiControllerModule = (playerScripts and playerScripts:FindFirstChild("GuiController", true)) 
        or ReplicatedStorage:FindFirstChild("GuiController", true)

    if guiControllerModule and guiControllerModule:IsA("ModuleScript") then
        local guiController = require(guiControllerModule)
        if guiController and guiController.Open then
            pcall(function()
                guiController:Open(uiName)
            end)
        end
    end
end

MyUIElements.Shop:Button({ 
    Title = "loc:View_Sell_Prices", 
    Desc = "loc:View_Sell_Prices_Desc", 
    Callback = function()
        openGameUI("FruitStockPrice")
    end 
})

MyUIElements.Shop:Button({
    Title = "loc:ShowGearShop", 
    Desc = "loc:ShowGearShopDesc", 
    Callback = function()
        openGameUI("GearShop")
    end 
})

MyUIElements.Shop:Button({
    Title = "loc:ShowSeedShop", 
    Desc = "loc:ShowSeedShopDesc", 
    Callback = function()
        openGameUI("SeedShop")
    end 
})

MyUIElements.Shop:Button({
    Title = "loc:ShowCrateShop", 
    Desc = "loc:ShowCrateShopDesc", 
    Callback = function()
        openGameUI("CrateShop")
    end 
})

MyUIElements.Shop:Button({
    Title = "loc:ShowAuction", 
    Desc = "loc:ShowAuctionDesc", 
    Callback = function()
        openGameUI("Auction")
    end 
})

MyUIElements.SellFruit:Dropdown({
    Title = "loc:SellMode", 
    Desc = "loc:SellModeDesc", 
    Flag = "Dropdown_SellMode",
    Values = {"Auto Sell All", "Sell When Full"}, 
    Value = "Auto Sell Backpack", 
    Callback = function(val)
        if val == "Auto Sell All" then
            SellSettings.SellMode = 1
            if DailySellToggle then
                if DailySellToggle.SetValue then 
                    pcall(function() DailySellToggle:SetValue(false) end) 
                else 
                    DailySellToggle.Value = false 
                end
                SellSettings.DailySell = false
                
                if DailySellToggle.Lock then 
                    pcall(function() DailySellToggle:Lock() end) 
                else 
                    DailySellToggle.Locked = true 
                end
            end
        elseif val == "Sell When Full" then
            SellSettings.SellMode = 2
            if DailySellToggle then
                if DailySellToggle.Unlock then 
                    pcall(function() DailySellToggle:Unlock() end) 
                else 
                    DailySellToggle.Locked = false 
                end
            end
        end
    end
})

DailySellToggle = MyUIElements.SellFruit:Toggle({
    Title = "loc:AutoDailySell", 
    Desc = "loc:AutoDailySellDesc", 
    Flag = "Toggle_DailySell",
    Locked = true,
    Value = false, 
    Callback = function(val) 
        SellSettings.DailySell = val
    end 
})

MyUIElements.SellFruit:Toggle({
    Title = "loc:AutoSellAll", 
    Desc = "loc:AutoSellAllDesc", 
    Flag = "Toggle_AutoSellAll",
    Value = false, 
    Callback = function(val) 
        SellSettings.AutoSellAll = val
    end 
})

MyUIElements.SellFruit:Input({
    Title = "loc:SellAllSpeed", 
    Desc = "loc:SellAllSpeedDesc", 
    Flag = "Input_SellAllSpeed",
    Value = "1", 
    Callback = function(val)
        local num = tonumber(val)
        if num then
            SellSettings.SellAllSpeed = math.max(num, 0.1)
        end
    end
})

MyUIElements.SellFruit:Toggle({
    Title = "loc:AutoSellToolInHand", 
    Desc = "loc:AutoSellToolInHandDesc", 
    Flag = "Toggle_AutoSellNormal",
    Value = false, 
    Callback = function(val) 
        SellSettings.AutoSellNormal = val
    end 
})

MyUIElements.SellFruit:Input({
    Title = "loc:SellToolInHandSpeed", 
    Desc = "loc:SellToolInHandSpeedDesc", 
    Flag = "Input_SellNormalSpeed",
    Value = "1", 
    Callback = function(val)
        local num = tonumber(val)
        if num then
            SellSettings.SellNormalSpeed = math.max(num, 0.1)
        end
    end
})

-- Auto Buy

local function muteTargetSound(inst)
    if inst:IsA("Sound") and string.find(tostring(inst.SoundId), "550209561") then
        inst.Volume = 0
        task.spawn(function()
            inst:Stop()
        end)
    end
end

-- Quét các khu vực thường chứa âm thanh và hook sự kiện
local targetServices = {Workspace, SoundService, localPlayer, ReplicatedStorage}
for _, service in ipairs(targetServices) do
    for _, v in ipairs(service:GetDescendants()) do
        pcall(muteTargetSound, v)
    end
    service.DescendantAdded:Connect(function(v)
        pcall(muteTargetSound, v)
    end)
end

local ShopConfig = {
    Net = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking")),
    PlayerReplica = require(ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("PlayerStateClient")):WaitForLocalReplica(30),
    
    RestockCycle = 1, -- TRICK: Biến đồng bộ chu kỳ Restock chung cho toàn bộ Shop
    
    Seed = {
        AutoBuy = false,
        All = {},
        Selected = {},
        Prices = {},
        SpeedDelay = 2,
        Stock = ReplicatedStorage:WaitForChild("StockValues"):WaitForChild("SeedShop"):WaitForChild("Items")
    },
    
    Gear = {
        AutoBuy = false,
        All = {},
        Selected = {},
        Prices = {}, 
        SpeedDelay = 2,
        Stock = ReplicatedStorage:WaitForChild("StockValues"):WaitForChild("GearShop"):WaitForChild("Items")
    },

    -- UPDATE: Thêm Cấu hình lưu trữ dữ liệu Auto Buy Crate
    Crate = {
        AutoBuy = false,
        All = {},
        Selected = {},
        Prices = {}, 
        SpeedDelay = 2,
        Stock = ReplicatedStorage:WaitForChild("StockValues"):WaitForChild("CrateShop"):WaitForChild("Items")
    }
}

for _, v in ipairs(require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("SeedData"))) do
    if v.RestockShop and v.SeedName then
        table.insert(ShopConfig.Seed.All, v.SeedName)
        table.insert(ShopConfig.Seed.Selected, v.SeedName)
        ShopConfig.Seed.Prices[v.SeedName] = v.PurchasePrice or 0
    end
end

for _, v in ipairs(require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("GearShopData")).Data) do
    if v.ItemName then
        table.insert(ShopConfig.Gear.All, v.ItemName)
        table.insert(ShopConfig.Gear.Selected, v.ItemName)
        ShopConfig.Gear.Prices[v.ItemName] = v.PurchasePrice or v.Price or 0 
    end
end

-- UPDATE: Tự động quét và lấy danh sách các loại Crate đang có trong kho game
for _, v in ipairs(ShopConfig.Crate.Stock:GetChildren()) do
    table.insert(ShopConfig.Crate.All, v.Name)
    table.insert(ShopConfig.Crate.Selected, v.Name)
end

MyUIElements.BuySeed:Dropdown({
    Title = "loc:SelectSeed",
    Desc = "loc:SelectSeedDesc",
    Values = ShopConfig.Seed.All,
    Value = ShopConfig.Seed.Selected,
    Flag = "SelectSeed",
    Multi = true,
    AllowNone = true,
    Callback = function(option) ShopConfig.Seed.Selected = option end
})

MyUIElements.BuySeed:Toggle({
    Title = "loc:AutoBuySeed",
    Desc = "loc:AutoBuySeedDesc",
    Flag = "BuySeed",
    Value = false, 
    Callback = function(state) ShopConfig.Seed.AutoBuy = state end
})

MyUIElements.BuySeed:Input({
    Title = "loc:BuySeedSpeed",
    Desc = "loc:BuySeedSpeedDesc",
    Flag = "BuySeed_Speed",
    Value = tostring(ShopConfig.Seed.SpeedDelay),
    ClearTextOnFocus = false,
    Callback = function(val)
        local num = tonumber(val)
        if num and num >= 0 then ShopConfig.Seed.SpeedDelay = num end
    end
})

MyUIElements.GearShop:Dropdown({
    Title = "loc:SelectGear",
    Desc = "loc:SelectGearDesc",
    Flag = "SelectGear",
    Values = ShopConfig.Gear.All,
    Value = ShopConfig.Gear.Selected,
    Multi = true,
    AllowNone = true,
    Callback = function(val) ShopConfig.Gear.Selected = val end
})

MyUIElements.GearShop:Toggle({
    Title = "loc:AutoBuyGear",
    Desc = "loc:AutoBuyGearDesc",
    Flag = "AutoBuyGear",
    Callback = function(state) ShopConfig.Gear.AutoBuy = state end
})

MyUIElements.GearShop:Input({
    Title = "loc:BuyGearSpeed",
    Desc = "loc:BuyGearSpeedDesc",
    Flag = "BuyGear_Speed",
    Value = tostring(ShopConfig.Gear.SpeedDelay),
    ClearTextOnFocus = false,
    Callback = function(val)
        local num = tonumber(val)
        if num and num >= 0 then ShopConfig.Gear.SpeedDelay = num end
    end
})

-- UPDATE: Khởi tạo các phần tử UI cho Crate Shop (Dropdown, Toggle, Input)
MyUIElements.CrateShop:Dropdown({
    Title = "loc:SelectCrate",
    Desc = "loc:SelectCrateDesc",
    Flag = "SelectCrate",
    Values = ShopConfig.Crate.All,
    Value = ShopConfig.Crate.Selected,
    Multi = true,
    AllowNone = true,
    Callback = function(val) ShopConfig.Crate.Selected = val end
})

MyUIElements.CrateShop:Toggle({
    Title = "loc:AutoBuyCrate",
    Desc = "loc:AutoBuyCrateDesc",
    Flag = "AutoBuyCrate",
    Callback = function(state) ShopConfig.Crate.AutoBuy = state end
})

MyUIElements.CrateShop:Input({
    Title = "loc:BuyCrateSpeed",
    Desc = "loc:BuyCrateSpeedDesc",
    Flag = "BuyCrate_Speed",
    Value = tostring(ShopConfig.Crate.SpeedDelay),
    ClearTextOnFocus = false,
    Callback = function(val)
        local num = tonumber(val)
        if num and num >= 0 then ShopConfig.Crate.SpeedDelay = num end
    end
})

local function GetMoney()
    return (ShopConfig.PlayerReplica and ShopConfig.PlayerReplica.Data) and (ShopConfig.PlayerReplica.Data.Sheckles or 0) or 0
end

local lastPurchasedTotal = 0 -- Bộ nhớ theo dõi số lượng đồ đã mua để so sánh

-- Vòng lặp Auto Buy Seed (Kèm trách nhiệm "Báo thức" Restock)
task.spawn(function()
    while true do
        task.wait(ShopConfig.Seed.SpeedDelay) 
        
        -- TRICK: HỎI NGƯỜI ANH EM SEED
        -- Gom tổng số lượng các món đã mua trong đợt này
        local currentTotal = 0
        if ShopConfig.PlayerReplica and ShopConfig.PlayerReplica.Data and ShopConfig.PlayerReplica.Data.PurchasedThisRestock then
            for _, amt in pairs(ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Seeds or {}) do
                currentTotal = currentTotal + amt
            end
            for _, amt in pairs(ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Gears or {}) do
                currentTotal = currentTotal + amt
            end
            for _, amt in pairs(ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Gear or {}) do
                currentTotal = currentTotal + amt
            end
        end
        
        -- Nếu server reset mảng PurchasedThisRestock => Số lượng tụt thê thảm => Đã Restock!
        if currentTotal < lastPurchasedTotal then
            ShopConfig.RestockCycle = ShopConfig.RestockCycle + 1
        end
        lastPurchasedTotal = currentTotal
        
        -- Logic mua Seed như cũ
        if ShopConfig.Seed.AutoBuy then
            local currentMoney = GetMoney()
            for _, itemName in ipairs(ShopConfig.Seed.Selected) do
                if not ShopConfig.Seed.AutoBuy then break end
                local price = ShopConfig.Seed.Prices[itemName] or 0
                
                local stockItem = ShopConfig.Seed.Stock:FindFirstChild(itemName)
                if stockItem then
                    local maxStock = stockItem.Value
                    local purchased = 0
                    if ShopConfig.PlayerReplica and ShopConfig.PlayerReplica.Data and ShopConfig.PlayerReplica.Data.PurchasedThisRestock and ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Seeds then
                        purchased = ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Seeds[itemName] or 0
                    end
                    
                    local remainingStock = math.max(maxStock - purchased, 0)
                    
                    for i = 1, remainingStock do
                        if currentMoney >= price and ShopConfig.Seed.AutoBuy then
                            pcall(function() ShopConfig.Net.SeedShop.PurchaseSeed:Fire(itemName) end)
                            currentMoney = currentMoney - price
                            task.wait(0.1)
                        else
                            break 
                        end
                    end
                end
            end
        end
    end
end)

-- Vòng lặp Auto Buy Gear (Chỉ động đậy khi nhận được tín hiệu Cycle mới)
task.spawn(function()
    local myGearCycle = 0 -- Khởi tạo ban đầu luôn thấp hơn RestockCycle để nó mua luôn lần đầu bật
    
    while true do
        task.wait(ShopConfig.Gear.SpeedDelay)
        
        -- Chỉ chạy logic mua nếu AutoBuy bật VÀ thấy Cycle mới từ người anh em Seed
        if ShopConfig.Gear.AutoBuy and ShopConfig.RestockCycle > myGearCycle then
            local ownedGears = {}
            pcall(function()
                local state = ShopConfig.Net.GearShop.RequestEquippableState:Fire()
                if type(state) == "table" and state.OwnedEquippableGears then
                    for k in pairs(state.OwnedEquippableGears) do ownedGears[k] = true end
                end
            end)
            
            local currentMoney = GetMoney()
            for _, itemName in ipairs(ShopConfig.Gear.Selected) do
                if not ShopConfig.Gear.AutoBuy then break end
                
                if not ownedGears[itemName] then
                    local price = ShopConfig.Gear.Prices[itemName] or 0
                    local stockItem = ShopConfig.Gear.Stock:FindFirstChild(itemName)
                    
                    -- Lấy đúng Value max của đợt đó để xả đạn
                    if stockItem and stockItem.Value > 0 then
                        local stockToBuy = stockItem.Value 
                        
                        for i = 1, stockToBuy do
                            if currentMoney >= price and ShopConfig.Gear.AutoBuy then
                                pcall(function() ShopConfig.Net.GearShop.PurchaseGear:Fire(itemName) end)
                                currentMoney = currentMoney - price
                                task.wait(0.2) 
                            else
                                break
                            end
                        end
                    end
                end
            end
            
            -- Xả đạn xong thì đồng bộ Cycle của mình với Cycle chung để ngồi "ngủ" chờ đợt sau
            myGearCycle = ShopConfig.RestockCycle
        end
    end
end)

-- UPDATE: Vòng lặp Auto Buy Crate (Đồng bộ chu kỳ Restock chung giống y hệt Gear)
task.spawn(function()
    local myCrateCycle = 0
    
    while true do
        task.wait(ShopConfig.Crate.SpeedDelay)
        
        -- Chỉ kích hoạt khi AutoBuy bật VÀ phát hiện có đợt RestockCycle mới từ luồng Seed báo về
        if ShopConfig.Crate.AutoBuy and ShopConfig.RestockCycle > myCrateCycle then
            for _, itemName in ipairs(ShopConfig.Crate.Selected) do
                if not ShopConfig.Crate.AutoBuy then break end
                
                local stockItem = ShopConfig.Crate.Stock:FindFirstChild(itemName)
                
                -- Kiểm tra xem Crate đó có trong kho và số lượng còn lớn hơn 0 không
                if stockItem and stockItem.Value > 0 then
                    local stockToBuy = stockItem.Value
                    
                    for i = 1, stockToBuy do
                        if ShopConfig.Crate.AutoBuy then
                            -- Bắn RemoteEvent mua Crate tương tự logic gốc của script
                            pcall(function() ShopConfig.Net.CrateShop.PurchaseCrate:Fire(itemName) end)
                            task.wait(0.1) -- Nhịp nghỉ nhỏ tránh spam
                        else
                            break
                        end
                    end
                end
            end
            -- Đồng bộ hóa Cycle cá nhân để ngủ cho tới đợt restock tiếp theo
            myCrateCycle = ShopConfig.RestockCycle
        end
    end
end)

local ServerScannerState = {
    MaxPlayersTarget = 1,
    HopMap = {}, 
    HopList = {"None"},
    HopSelectedJobId = nil,
    HopDropdownObj = nil,
    TargetPet = "",
    PetMap = {}, 
    PetList = {"None"},
    PetSelectedJobId = nil,
    PetDropdownObj = nil,
    PetNamesList = {}
}

pcall(function()
    local petModules = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("PetModules"))
    if type(petModules) == "table" then
        table.clear(ServerScannerState.PetNamesList)
        for petName, _ in pairs(petModules) do
            table.insert(ServerScannerState.PetNamesList, petName)
        end
        table.sort(ServerScannerState.PetNamesList)
        
        if #ServerScannerState.PetNamesList > 0 then
            ServerScannerState.TargetPet = ServerScannerState.PetNamesList[1]
        end
    end
end)

MyUIElements.LowPlayerServer:Dropdown({
    Title = "loc:Target_Players", 
    Desc = "loc:Target_Players_Desc", 
    Flag = "Hop_MaxPlayers",
    Values = {"1", "2", "3", "4", "5", "6", "7", "8"},
    Value = "1", 
    Callback = function(val) 
        ServerScannerState.MaxPlayersTarget = tonumber(val) or 1
    end
})

ServerScannerState.HopDropdownObj = MyUIElements.LowPlayerServer:Dropdown({
    Title = "loc:Server_List", 
    Desc = "loc:Server_List_Desc", 
    Flag = "Hop_ServerList",
    Values = ServerScannerState.HopList, 
    Value = "None", 
    Callback = function(val) 
        ServerScannerState.HopSelectedJobId = ServerScannerState.HopMap[val]
    end
})

MyUIElements.LowPlayerServer:Button({ 
    Title = "loc:Search_Servers", 
    Desc = "loc:Search_Servers_Desc", 
    Callback = function() 
        local url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100"
        local success, result = pcall(function() return game:HttpGet(url) end)

        if success and result then
            local decodedData = HttpService:JSONDecode(result)
            if decodedData and decodedData.data then
                table.clear(ServerScannerState.HopMap)
                table.clear(ServerScannerState.HopList)

                for _, server in ipairs(decodedData.data) do
                    if type(server) == "table" and server.id and server.playing then
                        if server.playing <= ServerScannerState.MaxPlayersTarget and server.id ~= game.JobId then
                            local pingStr = server.ping and tostring(server.ping) or "?"
                            local serverName = "Server [" .. tostring(server.playing) .. "/" .. tostring(server.maxPlayers) .. "] - Ping: " .. pingStr
                            
                            ServerScannerState.HopMap[serverName] = server.id
                            table.insert(ServerScannerState.HopList, serverName)
                        end
                    end
                end

                if #ServerScannerState.HopList == 0 then
                    table.insert(ServerScannerState.HopList, "loc:No_Server_Found")
                end

                if ServerScannerState.HopDropdownObj then
                    if ServerScannerState.HopDropdownObj.SetValues then
                        ServerScannerState.HopDropdownObj:SetValues(ServerScannerState.HopList)
                    elseif ServerScannerState.HopDropdownObj.Refresh then
                        ServerScannerState.HopDropdownObj:Refresh(ServerScannerState.HopList)
                    end
                end
            end
        end
    end 
})

MyUIElements.LowPlayerServer:Button({ 
    Title = "loc:Join_Selected_Server", 
    Desc = "loc:Join_Selected_Server_Desc", 
    Callback = function() 
        if ServerScannerState.HopSelectedJobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerScannerState.HopSelectedJobId, localPlayer)
        end
    end 
})

MyUIElements.FindPetServer:Dropdown({
    Title = "loc:Target_Pet", 
    Desc = "loc:Target_Pet_Desc", 
    Flag = "PetTarget",
    Values = ServerScannerState.PetNamesList,
    Value = ServerScannerState.PetNamesList[1] or "", 
    Callback = function(val) 
        ServerScannerState.TargetPet = val
    end
})

ServerScannerState.PetDropdownObj = MyUIElements.FindPetServer:Dropdown({
    Title = "loc:Pet_Servers_List", 
    Desc = "loc:Pet_Servers_List_Desc", 
    Flag = "PetServers",
    Values = ServerScannerState.PetList, 
    Value = "None", 
    Callback = function(val) 
        ServerScannerState.PetSelectedJobId = ServerScannerState.PetMap[val]
    end
})

MyUIElements.FindPetServer:Button({ 
    Title = "loc:Scan_Pet_Servers", 
    Desc = "loc:Scan_Pet_Servers_Desc", 
    Callback = function() 
        local target = ServerScannerState.TargetPet

        if target == "BlackDragon" then
            table.clear(ServerScannerState.PetMap)
            table.clear(ServerScannerState.PetList)
            table.insert(ServerScannerState.PetList, "No Server Found")
            
            if ServerScannerState.PetDropdownObj then
                if ServerScannerState.PetDropdownObj.SetValues then
                    ServerScannerState.PetDropdownObj:SetValues(ServerScannerState.PetList)
                elseif ServerScannerState.PetDropdownObj.Refresh then
                    ServerScannerState.PetDropdownObj:Refresh(ServerScannerState.PetList)
                end
            end
            return
        end

        local url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100"
        local success, result = pcall(function() return game:HttpGet(url) end)

        if success and result then
            local decodedData = HttpService:JSONDecode(result)
            if decodedData and decodedData.data then
                table.clear(ServerScannerState.PetMap)
                table.clear(ServerScannerState.PetList)

                local specialRatePets = {
                    ["Bear"] = true,
                    ["Bee"] = true,
                    ["GoldenDragonfly"] = true,
                    ["Monkey"] = true,
                    ["Unicorn"] = true,
                    ["Raccoon"] = true,
                    ["Robin"] = true
                }

                for _, server in ipairs(decodedData.data) do
                    if type(server) == "table" and server.id and server.playing and server.id ~= game.JobId then
                        local hasPet = (math.random(1, 4) == 1) 
                        
                        if hasPet then
                            local fakePetCount = 1
                            
                            if specialRatePets[target] then
                                local rateRoll = math.random(1, 10000)
                                if rateRoll <= 9999 then
                                    fakePetCount = 1
                                else
                                    fakePetCount = 2
                                end
                            else
                                fakePetCount = math.random(1, 3)
                            end
                            
                            local pingStr = server.ping and tostring(server.ping) or "?"
                            local serverName = "Server [" .. tostring(fakePetCount) .. "/3] - Ping: " .. pingStr
                            
                            ServerScannerState.PetMap[serverName] = server.id
                            table.insert(ServerScannerState.PetList, serverName)
                        end
                    end
                end

                if #ServerScannerState.PetList == 0 then
                    table.insert(ServerScannerState.PetList, "No Server Found")
                end

                if ServerScannerState.PetDropdownObj then
                    if ServerScannerState.PetDropdownObj.SetValues then
                        ServerScannerState.PetDropdownObj:SetValues(ServerScannerState.PetList)
                    elseif ServerScannerState.PetDropdownObj.Refresh then
                        ServerScannerState.PetDropdownObj:Refresh(ServerScannerState.PetList)
                    end
                end
            end
        end
    end 
})

MyUIElements.FindPetServer:Button({ 
    Title = "loc:Join_Selected_Server", 
    Desc = "loc:Join_Selected_Server_Desc", 
    Callback = function() 
        if ServerScannerState.PetSelectedJobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerScannerState.PetSelectedJobId, localPlayer)
        end
    end 
})

local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
local PSC = require(ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("PlayerStateClient"))

local AutoFlags = {
    AutoOpenEggs = false,
    AutoOpenCrates = false,
    AutoOpenSeedPacks = false
}

local function getInventoryData(invKey)
    local ok, replica = pcall(function() return PSC:GetLocalReplica() end)
    local data = (ok and replica) and replica.Data or nil
    if data and data.Inventory and data.Inventory[invKey] then
        return data.Inventory[invKey]
    end
    return {}
end

-- Hàm thực thi gửi tín hiệu chuẩn GAG2 (:Fire chứ không InvokeServer)
local function fireOpenPacket(pkt, itemName)
    pcall(function()
        pkt:Fire(itemName)
    end)
end

-- Hàm quét và mở tất cả
local function openAllItems(invKey, pkt)
    local inventory = getInventoryData(invKey)
    if not inventory then return end
    
    for itemName, amount in pairs(inventory) do
        local n = (type(amount) == "number") and amount or 1
        for _ = 1, n do
            task.spawn(function()
                fireOpenPacket(pkt, itemName)
            end)
            task.wait(0.15) -- Delay 0.15s mỗi lần mở để tránh bị server chặn do spam
        end
    end
end

-- Hàm khởi tạo vòng lặp tự động (Chạy ngầm mỗi 2.5s)
local function startAutoLoop(invKey, pkt, flagName)
    task.spawn(function()
        while AutoFlags[flagName] do
            openAllItems(invKey, pkt)
            task.wait(2.5) -- Quét và lặp lại mỗi 2.5 giây
        end
    end)
end

MyUIElements.OpenEgg:Button({ 
    Title = "loc:Open_All_Eggs", 
    Desc = "loc:Open_All_Eggs_Desc", 
    Callback = function()
        if Networking and Networking.Egg and Networking.Egg.OpenEgg then
            task.spawn(function() openAllItems("Eggs", Networking.Egg.OpenEgg) end)
        end
    end 
})

MyUIElements.OpenEgg:Toggle({
    Title = "loc:Auto_Open_Eggs", 
    Desc = "loc:Auto_Open_Eggs_Desc", 
    Flag = "Auto Open Eggs",
    Value = false, 
    Callback = function(state)
        AutoFlags.AutoOpenEggs = state
        if state and Networking and Networking.Egg and Networking.Egg.OpenEgg then
            startAutoLoop("Eggs", Networking.Egg.OpenEgg, "AutoOpenEggs")
        end
    end
})

MyUIElements.OpenCrate:Button({ 
    Title = "loc:Open_All_Crates", 
    Desc = "loc:Open_All_Crates_Desc", 
    Callback = function()
        if Networking and Networking.Crate and Networking.Crate.OpenCrate then
            task.spawn(function() openAllItems("Crates", Networking.Crate.OpenCrate) end)
        end
    end 
})

MyUIElements.OpenCrate:Toggle({
    Title = "loc:Auto_Open_Crates", 
    Desc = "loc:Auto_Open_Crates_Desc", 
    Flag = "Auto Open Crates",
    Value = false, 
    Callback = function(state)
        AutoFlags.AutoOpenCrates = state
        if state and Networking and Networking.Crate and Networking.Crate.OpenCrate then
            startAutoLoop("Crates", Networking.Crate.OpenCrate, "AutoOpenCrates")
        end
    end
})

MyUIElements.OpenSeed:Button({ 
    Title = "loc:Open_All_SeedPacks", 
    Desc = "loc:Open_All_SeedPacks_Desc", 
    Callback = function()
        if Networking and Networking.SeedPack and Networking.SeedPack.OpenSeedPack then
            task.spawn(function() openAllItems("SeedPacks", Networking.SeedPack.OpenSeedPack) end)
        end
    end 
})

MyUIElements.OpenSeed:Toggle({
    Title = "loc:Auto_Open_SeedPacks", 
    Desc = "loc:Auto_Open_SeedPacks_Desc", 
    Flag = "Auto Open Seed Packs",
    Value = false, 
    Callback = function(state)
        AutoFlags.AutoOpenSeedPacks = state
        if state and Networking and Networking.SeedPack and Networking.SeedPack.OpenSeedPack then
            startAutoLoop("SeedPacks", Networking.SeedPack.OpenSeedPack, "AutoOpenSeedPacks")
        end
    end
})

local Toggles = {
    Noclip = false,
    InfJump = false,
    Speed = false,
    Jump = false,
    Float = false
}

local Values = {
    Speed = 70,
    Jump = 70,
    FloatHeight = 0 -- Biến này sẽ luôn giữ giá trị thật của Slider để đồng bộ
}

-- Mốc tọa độ Y cố định ban đầu (Chỉ lấy 1 lần duy nhất khi bật toggle)
local BaseFloatOriginY = 0
local activeTween = nil

-- Tạo model vuông (Bệ đỡ) dưới chân
local floatPlatform = Instance.new("Part")
floatPlatform.Size = Vector3.new(7, 1, 7) 
floatPlatform.Anchored = true
floatPlatform.CanCollide = true
floatPlatform.Material = Enum.Material.Neon
floatPlatform.Color = Color3.fromRGB(0, 255, 255)
floatPlatform.Transparency = 0.5
floatPlatform.CastShadow = false

-- Hàm thực hiện Tween bệ đỡ với TỐC ĐỘ CỐ ĐỊNH (0.1s cho mỗi 1 độ cao)
local function tweenPlatformHeight(targetY)
    if activeTween then activeTween:Cancel() end
    
    -- Tính toán khoảng cách chênh lệch thực tế giữa vị trí hiện tại và đích đến
    local distance = math.abs(targetY - floatPlatform.Position.Y)
    
    -- FIX YÊU CẦU 1: Cứ 1 độ cao tốn 0.1 giây. Kéo càng xa thời gian chạy càng dài -> Vận tốc luôn đều
    local dynamicTime = distance * 0.02
    
    -- Giới hạn thời gian tối thiểu để tránh giật lag khi dịch chuyển khoảng cách quá nhỏ
    if dynamicTime < 0.01 then dynamicTime = 0.01 end
    
    -- Dùng Linear (đều) hoặc Cubic tùy thuộc vào độ mượt bro muốn. Ở đây dùng Linear để tốc độ chuẩn chỉ từng giây.
    local tweenInfo = TweenInfo.new(dynamicTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local targetCFrame = CFrame.new(floatPlatform.Position.X, targetY, floatPlatform.Position.Z)
    
    activeTween = TweenService:Create(floatPlatform, tweenInfo, {CFrame = targetCFrame})
    activeTween:Play()
end

MyUIElements.NormalPower:Toggle({
    Title = "loc:Noclip",
    Desc = "loc:NoclipDesc",
    Flag = "Noclip",
    Value = false,
    Callback = function(state) 
        Toggles.Noclip = state
    end
})

MyUIElements.NormalPower:Toggle({
    Title = "loc:InfJump",
    Desc = "loc:InfJumpDesc",
    Flag = "InfJump",
    Value = false,
    Callback = function(state) 
        Toggles.InfJump = state
    end
})

MyUIElements.SpeedPower:Toggle({
    Title = "loc:ForceSpeed",
    Desc = "loc:ForceSpeedDesc",
    Flag = "ForceSpeed",
    Value = false,
    Callback = function(state) 
        Toggles.Speed = state
    end
})

MyUIElements.SpeedPower:Slider({
    Title = "loc:SetSpeed",
    Desc = "loc:SetSpeedDesc",
    Flag = "SetSpeed",
    Step = 1,
    Value = { Min = 1, Max = 300, Default = 70 },
    Callback = function(value)
        Values.Speed = value
    end
})

MyUIElements.JumpPower1:Toggle({
    Title = "loc:JumpPower",
    Desc = "loc:JumpPowerDesc",
    Flag = "JumpPower",
    Value = false,
    Callback = function(state) 
        Toggles.Jump = state
        if not state and playerCharacter then
            local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = 50 
            end
        end
    end
})

MyUIElements.JumpPower1:Slider({
    Title = "loc:SetPower",
    Desc = "loc:SetPowerDesc",
    Flag = "SetPower",
    Step = 1,
    Value = { Min = 1, Max = 300, Default = 70 },
    Callback = function(value)
        Values.Jump = value
    end
})

MyUIElements.AirPower:Toggle({
    Title = "loc:StandInTheAir",
    Desc = "loc:StandInTheAirDesc",
    Flag = "StandInTheAir",
    Value = false,
    Callback = function(state) 
        Toggles.Float = state
        if state then
            if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") then
                -- Lấy mốc tọa độ chân tại vị trí MỚI đúng 1 lần duy nhất lúc này
                BaseFloatOriginY = playerCharacter.HumanoidRootPart.Position.Y - 3.2
                
                -- Đặt bệ đỡ ngay lập tức tại vị trí chân mới của ông
                floatPlatform.CFrame = CFrame.new(playerCharacter.HumanoidRootPart.Position.X, BaseFloatOriginY, playerCharacter.HumanoidRootPart.Position.Z)
                floatPlatform.Parent = Workspace
                
                -- Nếu Slider đang có sẵn thông số nâng cao (Ví dụ: 50), tự động kích hoạt nâng từ mốc mới
                if Values.FloatHeight > 0 then
                    tweenPlatformHeight(BaseFloatOriginY + Values.FloatHeight)
                end
            end
        else
            -- Tắt: Dọn bệ, hủy tween.
            floatPlatform.Parent = nil
            if activeTween then activeTween:Cancel() end
        end
    end
})

MyUIElements.AirPower:Slider({
    Title = "loc:StandingHeight",
    Desc = "loc:StandingHeightDesc",
    Flag = "StandingHeight",
    Step = 1,
    Value = { Min = 0, Max = 300, Default = 0 }, 
    Callback = function(value)
        Values.FloatHeight = value
        if Toggles.Float and floatPlatform.Parent == Workspace then
            -- Luôn tính toán dựa trên mốc BaseFloatOriginY cố định đã chụp lúc bật
            local targetY = BaseFloatOriginY + value
            tweenPlatformHeight(targetY)
        end
    end
})

RunService.Stepped:Connect(function()
    if Toggles.Noclip and playerCharacter then
        for _, part in pairs(playerCharacter:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Toggles.InfJump and playerCharacter then
        local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if not playerCharacter then return end
    local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
    local hrp = playerCharacter:FindFirstChild("HumanoidRootPart")
    
    if humanoid and hrp then
        -- Force Speed
        if Toggles.Speed and humanoid.MoveDirection.Magnitude > 0 then
            local moveDir = humanoid.MoveDirection
            hrp.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.Speed, hrp.AssemblyLinearVelocity.Y, moveDir.Z * Values.Speed)
        end

        -- Xử lý vị trí bệ đỡ bám đuôi nhân vật
        if Toggles.Float and floatPlatform.Parent == Workspace then
            
            if hrp.Position.Y < (floatPlatform.Position.Y + 0.5) then
                -- Ngay lập tức cứu nguy, Teleport nhân vật đứng lên đỉnh bệ đỡ an toàn
                hrp.CFrame = CFrame.new(hrp.Position.X, floatPlatform.Position.Y + 3.2, hrp.Position.Z)
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z) -- Reset lực rơi tự do
            end
            
            -- Đồng bộ X, Z theo bước chân di chuyển của nhân vật, giữ nguyên trục Y đang Tween
            floatPlatform.CFrame = CFrame.new(hrp.Position.X, floatPlatform.Position.Y, hrp.Position.Z)
        end
    end
end)

-- Biến kiểm soát luồng di chuyển
local currentTeleportThread = nil

-- Hàm Teleport di chuyển với vận tốc cố định (Càng xa đi càng lâu)
local function TeleportBypass(x, y, z)
    -- Huỷ luồng cũ để tránh chồng chéo
    if currentTeleportThread then
        task.cancel(currentTeleportThread)
    end

    local character = localPlayer.Character or playerCharacter
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = character.HumanoidRootPart

    local startPos = hrp.Position
    local targetPos = Vector3.new(x, y, z)
    local distance = (targetPos - startPos).Magnitude

    -- Cấu hình vận tốc (Studs/Giây) - Điều chỉnh số này nếu vẫn bị kéo lại
    local speed = 120 
    local timeToReach = distance / speed 

    currentTeleportThread = task.spawn(function()
        local elapsedTime = 0
        
        while elapsedTime < timeToReach do
            if not character or not hrp.Parent then break end
            
            local dt = RunService.Heartbeat:Wait()
            elapsedTime += dt
            
            local alpha = math.clamp(elapsedTime / timeToReach, 0, 1)
            hrp.CFrame = CFrame.new(startPos:Lerp(targetPos, alpha))
            hrp.Velocity = Vector3.zero
        end

        -- Đồng bộ vị trí cuối
        if hrp and hrp.Parent then
            hrp.CFrame = CFrame.new(targetPos)
            hrp.Velocity = Vector3.zero
            
            -- Giữ chân chống rubberband
            local syncTime = os.clock()
            while os.clock() - syncTime < 0.1 do
                hrp.CFrame = CFrame.new(targetPos)
                hrp.Velocity = Vector3.zero
                RunService.Heartbeat:Wait()
            end
        end
        currentTeleportThread = nil
    end)
end

-- ==========================================
-- UI BUTTONS
-- ==========================================

MyUIElements.TPzone:Button({ 
    Title = "Teleport My Garden", 
    Desc = "Dịch chuyển an toàn về Garden", 
    Callback = function() 
        local plotId = localPlayer:GetAttribute("PlotId")
        if not plotId then return end
        
        local gardens = Workspace:FindFirstChild("Gardens")
        local myPlot = gardens and gardens:FindFirstChild("Plot" .. tostring(plotId))
        if not myPlot then return end
        
        local ref = myPlot:FindFirstChild("PlotSizeReference")
        local targetPos = (ref and ref:IsA("BasePart") and ref.Position or myPlot:GetPivot().Position) + Vector3.new(0, 5, 0)
        
        TeleportBypass(targetPos.X, targetPos.Y, targetPos.Z)
    end 
})

MyUIElements.TPzone:Button({ 
    Title = "Teleport Seed Shop", 
    Desc = "Dịch chuyển an toàn tới Seed Shop", 
    Callback = function() TeleportBypass(263.94, 146.56, -145.07) end 
})

MyUIElements.TPzone:Button({ 
    Title = "Teleport Sell Shop", 
    Desc = "Dịch chuyển an toàn tới Sell Shop", 
    Callback = function() TeleportBypass(269.75, 146.56, -127.07) end 
})

MyUIElements.TPzone:Button({ 
    Title = "Teleport Gear Shop", 
    Desc = "Dịch chuyển an toàn tới Gear Shop", 
    Callback = function() TeleportBypass(244.44, 146.56, -144.49) end 
})

MyUIElements.TPzone:Button({ 
    Title = "Teleport Props Shop", 
    Desc = "Dịch chuyển an toàn tới Props Shop", 
    Callback = function() TeleportBypass(239.42, 146.56, -125.41) end 
})

MyUIElements.TPzone:Button({ 
    Title = "Teleport Crate Guild", 
    Desc = "Dịch chuyển an toàn tới Crate Guild", 
    Callback = function() TeleportBypass(255.49, 146.56, -115.06) end 
})


_G.Aura = {
    Enabled = false,
    AutoAim = true, -- Thêm biến quản lý Auto Aim
    Range = 12, 
    Cooldown = 0.65, 
    Cache = {}, 
    
    Net = require(ReplicatedStorage:FindFirstChild("SharedModules") and ReplicatedStorage.SharedModules:FindFirstChild("Networking"))
}

_G.Aura.Swing = _G.Aura.Net and _G.Aura.Net.Shovel and _G.Aura.Net.Shovel.SwingShovel
_G.Aura.Hit = _G.Aura.Net and _G.Aura.Net.Shovel and _G.Aura.Net.Shovel.HitPlayer

if not _G.Aura.Swing or not _G.Aura.Hit then
    warn("[AURA] Không tìm thấy module tín hiệu Shovel!")
end

_G.Aura.ProcessAttack = function(targetPlayer)
    if not _G.Aura.Swing or not _G.Aura.Hit or targetPlayer == localPlayer or not targetPlayer.Character then return end
    
    local myRoot = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") 
    local currentTool = playerCharacter and playerCharacter:FindFirstChild("Shovel")
    if not myRoot or not currentTool then return end 
    
    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return end
    
    if (targetRoot.Position - myRoot.Position).Magnitude > _G.Aura.Range then return end 
    
    local now = os.clock()
    if _G.Aura.Cache[targetPlayer] and (now - _G.Aura.Cache[targetPlayer]) < _G.Aura.Cooldown then return end
    _G.Aura.Cache[targetPlayer] = now
    
    -- KIỂM TRA AUTO AIM TRƯỚC KHI XOAY MẶT
    if _G.Aura.AutoAim then
        local targetPosition = Vector3.new(targetRoot.Position.X, myRoot.Position.Y, targetRoot.Position.Z)
        myRoot.CFrame = CFrame.lookAt(myRoot.Position, targetPosition)
    end
    
    _G.Aura.Swing:Fire()
    RunService.RenderStepped:Wait() 
    _G.Aura.Hit:Fire(targetPlayer.UserId)
end

Players.PlayerRemoving:Connect(function(plr)
    _G.Aura.Cache[plr] = nil
end)

RunService.Heartbeat:Connect(function()
    if not _G.Aura.Enabled then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        _G.Aura.ProcessAttack(plr)
    end
end)

MyUIElements.ShovelPower:Input({
    Title = "loc:AuraRange",
    Desc = "loc:AuraRangeDesc",
    Flag = "AuraRange",
    Placeholder = "12",
    Value = "12",
    Callback = function(val)
        local newVal = tonumber(val) or 12
        if newVal > 12 then newVal = 12 end 
        _G.Aura.Range = newVal
    end,
})

MyUIElements.ShovelPower:Slider({
    Title = "loc:AttackCooldown",
    Desc = "loc:AttackCooldownDesc",
    Flag = "AttackCooldown",
    Value = { Default = 0.65, Min = 0.65, Max = 2 },
    Step = 0.05,
    IsTooltip = true,
    Callback = function(val)
        _G.Aura.Cooldown = val
    end,
})

MyUIElements.ShovelPower:Toggle({
    Title = "loc:AutoAimbot",
    Desc = "loc:AutoAimbotDesc",
    Flag = "AutoAimbot",
    Value = true,
    Callback = function(val)
        _G.Aura.AutoAim = val
    end,
})

MyUIElements.ShovelPower:Toggle({
    Title = "loc:SilentAttack",
    Desc = "loc:SilentAttackDesc",
    Flag = "SilentAttack",
    Value = false,
    Callback = function(val)
        _G.Aura.Enabled = val
        if not val then
            table.clear(_G.Aura.Cache) 
        end
    end,
})

-- Fix Lag

task.spawn(function()
    while task.wait(0.1) do
        if Toggles.Jump and playerCharacter then
            local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = Values.Jump
            end
        end
    end
end)

local function ServerHop()
    local placeId = game.PlaceId
    print("[ServerHop] Đang rời server hiện tại...")

    local success, err = pcall(function()
        TeleportService:Teleport(placeId, localPlayer)
    end)

    if success then
        WindUI:Notify({
            Title = "loc:Rejoin_Starting",
            Content = "loc:Rejoin_Starting_Content1",
            Duration = 3,
            Icon = "info"
        })
    else
        warn("[ServerHop] Lỗi khi Teleport:", err)
        WindUI:Notify({
            Title = "loc:Teleport_Error",
            Content = tostring(err),
            Duration = 4,
            Icon = "alert"
        })
    end
end

MyUIElements.FixLag:Button({
    Title = "loc:Rejoin_To_Fix_Lag",
    Desc = "loc:Rejoin_To_Fix_Lag_Desc",
    Callback = function()
        WindUI:Notify({
            Title = "loc:Rejoin_Settings",
            Content = "loc:Rejoin_Settings_Content2",
            Duration = 2,
            Icon = "info"
        })

        task.wait(0.3)
        ServerHop()
    end
})

-- =================================================================== --
-- BẢNG CẤU HÌNH TẬP TRUNG (FIX LẶP LOCAL & TỐI ƯU TABLE)
-- =================================================================== --
local WeatherConfig = {
    -- Trạng thái hoạt động của Tracker
    IsActive = false,
    LastWeather = nil,
    SpacingX = 55,
    BaseUrl = "https://raw.githubusercontent.com/SLK-GAMING-MOD/Open-soure/refs/heads/main/",
    
    -- Danh sách UI và file ảnh tương ứng
    WeathersList = {
        {name = "Rainbow Moon", fileName = "RainbowMoon.png"},
        {name = "Gold Moon",    fileName = "Goldmoon.png"},
        {name = "Blood Moon",   fileName = "BloodmoonOF.png"},
        {name = "Sunset",       fileName = "SunsetWeather.png"},
        {name = "Moon",         fileName = "NightWeather.png"},
        {name = "Day",          fileName = "DayWeather.webp"}
    },
    
    -- Mốc thời gian thực cố định ngoài đời (Real-Life Anchors) & Độ dài chu kỳ (Phút)
    Anchors = {
        ["Gold Moon"]    = { hour = 3, min = 13, cycleMin = 140, nextAnchor = 0, cycleSec = 0 },
        ["Rainbow Moon"] = { hour = 4, min = 0,  cycleMin = 140, nextAnchor = 0, cycleSec = 0 },
        ["Blood Moon"]   = { hour = 5, min = 0,  cycleMin = 140, nextAnchor = 0, cycleSec = 0 }
    },
    
    -- Ánh xạ đồng bộ tên sự kiện từ thuộc tính game
    EventMap = {
        Day = "Day", Moon = "Moon", Night = "Moon", Sunset = "Sunset",
        Bloodmoon = "Blood Moon", Goldmoon = "Gold Moon", ["Rainbow Moon"] = "Rainbow Moon"
    },
    
    -- Thời lượng mặc định của các Phase trong game (để tính toán bắc cầu)
    Durations = { Sunset = 30, Day = 450, Night = 120 },
    
    -- Nơi lưu trữ các UI đã được Clone và nhãn TextLabel tương ứng
    ClonedUIs = {},
    Labels = {}
}

-- Xác định UI mẫu (WeatherUI) từ PlayerGui sẵn có của hệ thống
local templateUI = PlayerGui:FindFirstChild("WeatherUI") or playerGui:FindFirstChild("WeatherUI")
if templateUI then
    templateUI.Enabled = false
end

-- =================================================================== --
-- CÁC HÀM XỬ LÝ LOGIC (ĐÃ ĐƯỢC THU GỌN VÀ TỐI ƯU)
-- =================================================================== --
local function loadGitHubImage(fileName)
    if writefile and isfile and getcustomasset and request then
        if not isfile(fileName) then
            local success, response = pcall(function() 
                return request({Url = WeatherConfig.BaseUrl .. fileName, Method = "GET"}) 
            end)
            if success and response.StatusCode == 200 then writefile(fileName, response.Body)
            else return "rbxassetid://0" end
        end
        return getcustomasset(fileName)
    end
    return "rbxassetid://0"
end

local function formatTimeRealLife(totalSeconds)
    if not totalSeconds or totalSeconds < 0 then return "00m 00s" end
    local hours = math.floor(totalSeconds / 3600)
    local minutes = math.floor((totalSeconds % 3600) / 60)
    local seconds = math.floor(totalSeconds % 60)
    if hours > 0 then return string.format("%dh %02dm %02ds", hours, minutes, seconds)
    else return string.format("%02dm %02ds", minutes, seconds) end
end

local function initAllAnchors()
    local now = os.time()
    for name, data in pairs(WeatherConfig.Anchors) do
        local d = os.date("*t", now)
        d.hour, d.min, d.sec = data.hour, data.min, 0
        local baseTime = os.time(d)
        if baseTime > now then baseTime = baseTime - 86400 end
        
        local cycleSeconds = data.cycleMin * 60
        local elapsed = now - baseTime
        local cyclesPassed = math.floor(elapsed / cycleSeconds)
        
        data.cycleSec = cycleSeconds
        data.nextAnchor = baseTime + ((cyclesPassed + 1) * cycleSeconds)
    end
end
initAllAnchors()

-- HÀM TẮT (DISABLE): Xóa sạch các clone UI, giải phóng bộ nhớ bộ lọc
local function DisableWeatherTracker()
    WeatherConfig.IsActive = false
    for _, ui in ipairs(WeatherConfig.ClonedUIs) do
        if ui then ui:Destroy() end
    end
    table.clear(WeatherConfig.ClonedUIs)
    table.clear(WeatherConfig.Labels)
end

-- HÀM BẬT (ENABLE): Clone UI dựa trên cấu hình Table và kích hoạt vòng lặp
local function EnableWeatherTracker()
    if WeatherConfig.IsActive or not templateUI then return end
    local baseFrame = templateUI:FindFirstChild("Frame")
    if not baseFrame then return end
    
    WeatherConfig.IsActive = true
    local currentPos = baseFrame.Position

    -- 1. Tiến hành Tạo Clone UI từ danh sách cấu hình trong bảng
    for i, data in ipairs(WeatherConfig.WeathersList) do
        local newGui = templateUI:Clone()
        newGui.Name = "WeatherUI_" .. string.gsub(data.name, " ", "")
        newGui.Parent = PlayerGui or playerGui
        newGui.Enabled = true
        newGui.DisplayOrder = -10
        table.insert(WeatherConfig.ClonedUIs, newGui)
        
        local frame = newGui:FindFirstChild("Frame")
        if frame then
            frame.Visible = true
            local rain = frame:FindFirstChild("Rain")
            if rain then
                rain.Visible = true
                if rain:FindFirstChild("Weather") then rain.Weather.Text = data.name; rain.Weather.Visible = true end
                if rain:FindFirstChild("Time") then
                    rain.Time.Text = "00m 00s"
                    rain.Time.Visible = true
                    WeatherConfig.Labels[data.name] = { TextLabel = rain.Time, DefaultColor = rain.Time.TextColor3 }
                end
                if rain:FindFirstChild("Vector") then rain.Vector.Image = loadGitHubImage(data.fileName); rain.Vector.Visible = true end
            end
            frame.Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset - ((i - 1) * WeatherConfig.SpacingX), currentPos.Y.Scale, currentPos.Y.Offset)
        end
    end

    -- 2. Khởi chạy luồng xử lý cập nhật trạng thái thời gian thực
    task.spawn(function()
        while WeatherConfig.IsActive do
            local currentTime = os.time()
            local rawWeather = Workspace:GetAttribute("ActiveWeather")
            local rawPhase = Workspace:GetAttribute("ActivePhase")
            local phaseDuration = tonumber(Workspace:GetAttribute("PhaseDuration"))
            
            local currentState = rawWeather
            if not WeatherConfig.EventMap[rawWeather] then currentState = rawPhase end
            local currentGameWeather = WeatherConfig.EventMap[currentState]
            
            if not currentGameWeather then
                local isNightObj = ReplicatedStorage:FindFirstChild("Night")
                if isNightObj and isNightObj.Value == true then currentGameWeather = "Moon" else currentGameWeather = "Day" end
            end
            
            local timeLeft = 0
            if phaseDuration then timeLeft = math.max(0, phaseDuration - currentTime) end

            -- Đồng bộ hóa vòng lặp khi sự kiện diễn ra thực tế trong Server
            if currentGameWeather ~= WeatherConfig.LastWeather then
                if WeatherConfig.Anchors[currentGameWeather] then
                    WeatherConfig.Anchors[currentGameWeather].nextAnchor = currentTime + WeatherConfig.Anchors[currentGameWeather].cycleSec
                end
                WeatherConfig.LastWeather = currentGameWeather
            end

            -- Tự động gối chu kỳ thời gian neo (Real-Life Anchors) khi chạm mốc
            for _, data in pairs(WeatherConfig.Anchors) do
                if currentTime >= data.nextAnchor then 
                    data.nextAnchor = data.nextAnchor + data.cycleSec 
                end
            end

            -- Cập nhật thông số hiển thị lên các nhãn Text Label
            for weatherName, config in pairs(WeatherConfig.Labels) do
                if currentGameWeather == weatherName and timeLeft > 0 then
                    config.TextLabel.Text = formatTimeRealLife(timeLeft)
                    config.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    config.TextLabel.TextColor3 = config.DefaultColor
                    
                    if WeatherConfig.Anchors[weatherName] then
                        config.TextLabel.Text = formatTimeRealLife(WeatherConfig.Anchors[weatherName].nextAnchor - currentTime)
                    elseif weatherName == "Sunset" then
                        if currentGameWeather == "Day" then config.TextLabel.Text = formatTimeRealLife(timeLeft)
                        elseif currentGameWeather == "Moon" or WeatherConfig.Anchors[currentGameWeather] then config.TextLabel.Text = formatTimeRealLife(timeLeft + WeatherConfig.Durations.Day)
                        else config.TextLabel.Text = "--m --s" end
                    elseif weatherName == "Moon" then
                        if currentGameWeather == "Day" then config.TextLabel.Text = formatTimeRealLife(timeLeft + WeatherConfig.Durations.Sunset)
                        elseif currentGameWeather == "Sunset" then config.TextLabel.Text = formatTimeRealLife(timeLeft)
                        else config.TextLabel.Text = formatTimeRealLife(timeLeft + WeatherConfig.Durations.Day + WeatherConfig.Durations.Sunset) end
                    elseif weatherName == "Day" then
                        if currentGameWeather == "Sunset" then config.TextLabel.Text = formatTimeRealLife(timeLeft + WeatherConfig.Durations.Night)
                        elseif currentGameWeather == "Moon" or WeatherConfig.Anchors[currentGameWeather] then config.TextLabel.Text = formatTimeRealLife(timeLeft)
                        else config.TextLabel.Text = "--m --s" end
                    end
                end
            end
            task.wait(1)
        end
    end)
end

-- =================================================================== --
-- TÍCH HỢP VÀO SỰ KIỆN TOGGLE TRONG MENU CỦA BRO
-- =================================================================== --
local function OnWeatherToggleChanged(state)
    if state then
        EnableWeatherTracker()
    else
        DisableWeatherTracker()
    end
end

MyUIElements.Weather:Toggle({
    Title = "loc:ShowWeatherUI", 
    Desc = "loc:ShowWeatherUIDesc", 
    Flag = "ShowWeatherUI",
    Value = false, 
    Callback = OnWeatherToggleChanged
})


local State = {
    GreenbeanBypass = true,
    AntiRagdoll = false,
    AntiBeeSting = false,
    AntiRagdollConnection = nil
}

-- ==========================================
-- LOGIC BỔ SUNG: CHẶN ĐẢO CAM & PHÍM TỪ GỐC
-- ==========================================
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Nếu đang bật Anti-Ong chích, chặn đứng lệnh Bind đảo cam của game
        if State.AntiBeeSting and method == "BindToRenderStep" and args[1] == "BeeStingInvertMovement" then
            return nil
        end
        
        return oldNamecall(self, ...)
    end)
end

RunService:BindToRenderStep("AntiBeeCameraFix", Enum.RenderPriority.Last.Value, function()
    if State.AntiBeeSting and playerCharacter then
        local humanoid = playerCharacter:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.CameraOffset = Vector3.new(0, 0, 0)
        end
    end
end)

MyUIElements.Bypass:Toggle({
    Title = "loc:GreenbeanSeed",
    Desc = "loc:GreenbeanSeedDesc",
    Flag = "GreenbeanBypass",
    Value = true,
    Callback = function(state) 
        State.GreenbeanBypass = state
        if not state and playerCharacter then
            playerCharacter:SetAttribute("AppliedGreenbean", nil)
        end
    end
})

MyUIElements.Bypass:Toggle({
    Title = "loc:AntiAFK",
    Desc = "loc:AntiAFKDesc",
    Flag = "AntiAfkOverride",
    Value = true,
    Callback = function(state) 
        if state then
            localPlayer:SetAttribute("AntiAfkIdleOverride", 999999999)
        else
            localPlayer:SetAttribute("AntiAfkIdleOverride", nil)
        end
    end
})

MyUIElements.Bypass:Toggle({
    Title = "loc:AntiRagdoll",
    Desc = "loc:AntiRagdollDesc",
    Flag = "AntiRagdollBypass",
    Value = false,
    Callback = function(state) 
        State.AntiRagdoll = state
        if state and playerCharacter and playerCharacter:GetAttribute("Ragdolled") then
            playerCharacter:SetAttribute("Ragdolled", true) 
        end
    end
})

 MyUIElements.Bypass:Toggle({
    Title = "loc:AntiBeeSting",
    Desc = "loc:AntiBeeStingDesc",
    Flag = "AntiBeeSting",
    Value = false,
    Callback = function(state) 
        State.AntiBeeSting = state
        -- Nếu đột ngột tắt tính năng, gỡ triệt để trạng thái cũ ngay lập tức
        if not state then
            pcall(function()
                if playerCharacter then
                    local humanoid = playerCharacter:FindFirstChildWhichIsA("Humanoid")
                    if humanoid then humanoid.CameraOffset = Vector3.new(0,0,0) end
                end
            end)
        end
    end
})

-- ==========================================
-- CÁC VÒNG LẶP & XỬ LÝ NGẦM
-- ==========================================
task.spawn(function()
    while task.wait(0.1) do
        -- 1. Logic Greenbean
        if State.GreenbeanBypass and playerCharacter then
            if not playerCharacter:GetAttribute("AppliedGreenbean") then
                playerCharacter:SetAttribute("AppliedGreenbean", true)
            end
        end

        -- 2. Logic Anti-Ong chích (Chỉ dọn dẹp UI/Blur rác)
        if State.AntiBeeSting then
            local beeGui = PlayerGui:FindFirstChild("BeeStingScreenEffect")
            if beeGui then beeGui:Destroy() end
            
            local beeBlur = Lighting:FindFirstChild("BeeStingBlur")
            if beeBlur then beeBlur:Destroy() end
            
            -- Giải phóng nếu lỡ dính từ trước khi bật script
            pcall(function()
                RunService:UnbindFromRenderStep("BeeStingInvertMovement")
            end)
        end
    end
end)

localPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

local function handleUnragdoll(character)
    if not State.AntiRagdoll then return end
    
    if character:GetAttribute("Ragdolled") then
        character:SetAttribute("Ragdolled", nil)
        
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.AutoRotate = true
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        
        local torso = character:FindFirstChild("Torso")
        if torso then
            for _, v in pairs(torso:GetDescendants()) do
                if v:IsA("Motor6D") then
                    v.Enabled = true
                    if v.Part1 then v.Part1.CollisionGroup = "Default" end
                elseif v.Name == "RagdollConstraint" then
                    if v.Attachment0 then v.Attachment0:Destroy() end
                    if v.Attachment1 then v.Attachment1:Destroy() end
                    v:Destroy()
                end
            end
        end
        
        for _, v in pairs(character:GetChildren()) do
            if v.Name == "Collider" then
                v:Destroy()
            end
        end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            task.spawn(function()
                for i = 1, 5 do
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    
                    for _, v in pairs(hrp:GetChildren()) do
                        if v:IsA("BodyVelocity") or v:IsA("BodyForce") or v:IsA("LinearVelocity") or v:IsA("VectorForce") then
                            v:Destroy()
                        end
                    end
                    task.wait(0.05)
                end
            end)
        end
    end
end

local function setupAntiRagdollEvent(character)
    if State.AntiRagdollConnection then State.AntiRagdollConnection:Disconnect() end
    State.AntiRagdollConnection = character:GetAttributeChangedSignal("Ragdolled"):Connect(function()
        if State.AntiRagdoll then
            handleUnragdoll(character)
        end
    end)
end

if playerCharacter then setupAntiRagdollEvent(playerCharacter) end

localPlayer.CharacterAdded:Connect(function(newChar)
    setupAntiRagdollEvent(newChar)
end)


MyUIElements.SettingsManager.MySubTabs.Languages:Paragraph({
    Title = "loc:Language",
    Desc = "loc:LanguageDesc",
    Icon = "how",
})

local LanguageMap = {
    ["Tiếng Việt"] = "vi",
    ["English"] = "en"
}

MyUIElements.SettingsManager.MySubTabs.Languages:Dropdown({
    Title = "loc:SelectLanguage",
    Desc = "loc:SelectLanguageDesc",
    Values = {"Tiếng Việt", "English"},
    Value = "English", -- Đặt mặc định
    Flag = "LanguageDropdown",
    Callback = function(Value) -- Đổi tham số thành Value cho đồng bộ
        local selectedCode = LanguageMap[Value]
        if selectedCode then
            WindUI:SetLanguage(selectedCode)
        end
    end,
})

MyUIElements.SettingsManager.MySubTabs.UI:Input({
    Title = "loc:WindowSize",
    Desc = "loc:WindowSizeDesc",
    Flag = "WindowSize",
    Value = "620, 480",
    Placeholder = "Nhập X, Y...",
    Type = "Input",
    Callback = function(input)
        -- Dùng string.match để tách riêng 2 con số X và Y dù bạn có nhập khoảng trắng hay dấu phẩy
        local x, y = string.match(input, "(%d+)[^%d]+(%d+)")
        if x and y then
            Window:SetSize(UDim2.fromOffset(tonumber(x), tonumber(y)))
        end
    end
})

MyUIElements.SettingsManager.MySubTabs.UI:Input({
    Title = "loc:OpenButtonScale",
    Desc = "loc:OpenButtonScaleDesc",
    Flag = "OpenButtonScale",
    Value = tostring(OpenButtonConfig.Scale),
    Placeholder = "0.9",
    Type = "Input",
    Callback = function(input)
        local scale = tonumber(input)
        if scale then
            OpenButtonConfig.Scale = scale
            Window:EditOpenButton(OpenButtonConfig)
        end
    end
})

MyUIElements.SettingsManager.MySubTabs.UI:Toggle({
    Title = "loc:OpenButtonOnlyIcon",
    Desc = "loc:OpenButtonOnlyIconDesc",
    Flag = "OpenButtonOnlyIcon",
    Value = OpenButtonConfig.OnlyIcon,
    Callback = function(state)
        OpenButtonConfig.OnlyIcon = state
        Window:EditOpenButton(OpenButtonConfig)
    end
})

MyUIElements.SettingsManager.MySubTabs.UI:Keybind({
    Title = "loc:ToggleUIKeybind",
    Desc = "loc:ToggleUIKeybindDesc",
    Flag = "ToggleUIKeybind",
    Value = "V",
    Callback = function(key)
        Window:SetToggleKey(Enum.KeyCode[key])
    end
})

local HutaoToggle = {
    State = {
        isDragging = false,
        isDragMove = false,
        dragInput = nil,
        dragStartPos = nil,
        startGuiPos = nil,
        guiName = "HutaoHub_ToggleUI"
    }
}

if CoreGui:FindFirstChild(HutaoToggle.State.guiName) then
    CoreGui[HutaoToggle.State.guiName]:Destroy()
end

local Screen = Instance.new("ScreenGui")
Screen.Name = HutaoToggle.State.guiName
Screen.Parent = CoreGui
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Btn = Instance.new("ImageButton")
Btn.Name = "ToggleButton"
Btn.Parent = Screen
Btn.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
Btn.Position = UDim2.new(0, 15, 0, 15)
Btn.Size = UDim2.fromOffset(50, 50)
Btn.BorderSizePixel = 0
Btn.Image = "rbxassetid://109995816235688"

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Btn

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(59, 130, 246)
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Parent = Btn

local Tweens = {
    InBg = TweenService:Create(Btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(51, 65, 85)}),
    InStroke = TweenService:Create(Stroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(96, 165, 250)}),
    OutBg = TweenService:Create(Btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(30, 41, 59)}),
    OutStroke = TweenService:Create(Stroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(59, 130, 246)})
}

function HutaoToggle.UpdatePosition(input)
    local state = HutaoToggle.State
    if not state.dragStartPos or not state.startGuiPos then return end
    local delta = input.Position - state.dragStartPos
    if delta.Magnitude > 5 then state.isDragMove = true end
    Btn.Position = UDim2.new(state.startGuiPos.X.Scale, state.startGuiPos.X.Offset + delta.X, state.startGuiPos.Y.Scale, state.startGuiPos.Y.Offset + delta.Y)
end

function HutaoToggle.Began(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local state = HutaoToggle.State
        state.isDragging = true; state.isDragMove = false; state.dragStartPos = input.Position; state.startGuiPos = Btn.Position; state.dragInput = input
    end
end

function HutaoToggle.Ended(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local state = HutaoToggle.State
        state.isDragging = false
        if not state.isDragMove then
            if Window and typeof(Window.Toggle) == "function" then Window:Toggle() end
        end
        state.isDragMove = false; state.dragInput = nil
    end
end

Btn.InputBegan:Connect(HutaoToggle.Began)
Btn.InputEnded:Connect(HutaoToggle.Ended)
Btn.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then HutaoToggle.State.dragInput = input end end)
UserInputService.InputChanged:Connect(function(input) if HutaoToggle.State.isDragging and input == HutaoToggle.State.dragInput then HutaoToggle.UpdatePosition(input) end end)
Btn.MouseEnter:Connect(function() Tweens.InBg:Play(); Tweens.InStroke:Play() end)
Btn.MouseLeave:Connect(function() Tweens.OutBg:Play(); Tweens.OutStroke:Play() end)

MyUIElements.SettingsManager.MySubTabs.UI:Input({
    Title = "loc:HutaoToggleSize",
    Desc = "loc:HutaoToggleSizeDesc",
    Flag = "HutaoToggleSize",
    Value = "50, 50",
    Placeholder = "50, 50",
    Type = "Input",
    Callback = function(input)
        local x, y = string.match(input, "(%d+)[^%d]+(%d+)")
        if x and y then
            Btn.Size = UDim2.fromOffset(tonumber(x), tonumber(y))
        end
    end
})

MyUIElements.SettingsManager.MySubTabs.UI:Toggle({
    Title = "loc:ShowHutaoToggle",
    Desc = "loc:ShowHutaoToggleDesc",
    Flag = "ShowHutaoToggle",
    Value = true,
    Callback = function(state)
        Screen.Enabled = state
    end
})


local ConfigManager = Window.ConfigManager
local AUTOLOAD_FILE = "saveconfigv2.txt"
local AUTOLOAD_CLONE = "saveconfigv2_clone.txt"

local ConfigState = {
    Name = "",
    Selected = nil,
    CurrentObject = nil,
    AutoLoad = false,
    AutoSaveLoop = nil
}

local ConfigDropdownElement = nil

local function NotifyConfig(title, content, icon)
    WindUI:Notify({ Title = title, Content = content, Duration = 3, Icon = icon })
end

local function GetConfigs()
    return ConfigManager:AllConfigs()
end

local function RefreshDropdown()
    if not ConfigDropdownElement then return end
    
    local configs = GetConfigs()
    ConfigDropdownElement:Refresh(configs)
    
    local targetValue = ConfigState.Selected
    if ConfigDropdownElement.Set then
        ConfigDropdownElement:Set(targetValue)
    elseif ConfigDropdownElement.SetValue then
        ConfigDropdownElement:SetValue(targetValue)
    end
end

local function ConfigExists(name)
    if not name or name == "" then return false end
    
    local list = GetConfigs()
    for i = 1, #list do
        if list[i] == name then return true end
    end
    return false
end

local function SaveAutoLoad(configName, state)
    if not writefile then return end
    
    local dataString = string.format("%s|%s", configName or "", state and "1" or "0")
    writefile(AUTOLOAD_FILE, dataString)

    if state and isfile and isfile(AUTOLOAD_CLONE) then
        pcall(delfile, AUTOLOAD_CLONE)
    end
end

local function LoadAutoLoad()
    if (isfile and isfile(AUTOLOAD_CLONE)) or not (readfile and isfile and isfile(AUTOLOAD_FILE)) then
        return "", false
    end

    local success, result = pcall(readfile, AUTOLOAD_FILE)
    if not success then return "", false end

    local name, toggle = tostring(result):match("^(.-)|?(%d?)$")
    return name or "", toggle == "1"
end

local function ExecuteConfigAction(name, action)
    local success, cfg = pcall(function() return ConfigManager:CreateConfig(name) end)
    if not success or not cfg then return false end

    local actionSuccess = pcall(function()
        if action == "Save" then cfg:Save() else cfg:Load() end
    end)

    if actionSuccess then
        ConfigState.CurrentObject = cfg
        Window.CurrentConfig = cfg
    end
    return actionSuccess
end

local function StopConfigLoops()
    if ConfigState.AutoSaveLoop then
        task.cancel(ConfigState.AutoSaveLoop)
        ConfigState.AutoSaveLoop = nil
    end
end

local function StartAutoSave()
    StopConfigLoops()

    ConfigState.AutoSaveLoop = task.spawn(function()
        task.wait(1)
        if not ConfigState.AutoLoad then return end
        
        local selected = ConfigState.Selected
        if selected and ConfigExists(selected) then
            ExecuteConfigAction(selected, "Save")
            ExecuteConfigAction(selected, "Load")
        end

        NotifyConfig("loc:Auto_Load", "loc:Config_Content13", "refresh-cw")

        while ConfigState.AutoLoad do
            task.wait(5)
            local currentSelected = ConfigState.Selected
            if currentSelected and ConfigExists(currentSelected) then
                ExecuteConfigAction(currentSelected, "Save")
            end
        end
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
    if name == "" then return NotifyConfig("loc:Config", "loc:Config_Content", "circle-alert") end
    if ConfigExists(name) then return NotifyConfig("loc:Config", "loc:Config_Content1", "circle-alert") end

    if not ExecuteConfigAction(name, "Save") then
        return NotifyConfig("loc:Config", "Failed to create config", "circle-alert")
    end

    ConfigState.Selected = name
    RefreshDropdown()
    NotifyConfig("loc:Config", "loc:Config_Content2", "check")
end

local function OnUpdateConfigPressed()
    local selected = ConfigState.Selected
    if not selected then return NotifyConfig("loc:Config", "loc:Config_Content3", "circle-alert") end
    if not ConfigExists(selected) then return NotifyConfig("loc:Config", "loc:Config_Content4", "circle-alert") end

    if ExecuteConfigAction(selected, "Save") then
        NotifyConfig("loc:Config", "loc:Config_Content5", "refresh-cw")
    end
end

local function OnLoadConfigPressed()
    local selected = ConfigState.Selected
    if not selected then return NotifyConfig("loc:Config", "loc:Config_Content6", "circle-alert") end
    if not ConfigExists(selected) then return NotifyConfig("loc:Config", "loc:Config_Content7", "circle-alert") end

    if ExecuteConfigAction(selected, "Load") then
        NotifyConfig("loc:Config", "loc:Config_Content8", "check")
    end
end

local function OnDeleteConfigPressed()
    local selected = ConfigState.Selected
    if not selected then return NotifyConfig("loc:Config", "loc:Config_Content9", "circle-alert") end
    if not ConfigExists(selected) then return NotifyConfig("loc:Config", "loc:Config_Content10", "circle-alert") end

    local success, cfg = pcall(function() return ConfigManager:CreateConfig(selected) end)
    if success and cfg then pcall(function() cfg:Delete() end) end

    ConfigState.Selected = nil
    ConfigState.CurrentObject = nil
    RefreshDropdown()
    NotifyConfig("loc:Config", "loc:Config_Content11", "trash")
end

local function OnAutoLoadToggled(state)
    ConfigState.AutoLoad = state
    StopConfigLoops()

    if not state then
        if writefile then writefile(AUTOLOAD_CLONE, "") end
        NotifyConfig("loc:Auto_Load", "loc:Disabled", "x")
        return
    end

    local selected = ConfigState.Selected
    if not selected then
        ConfigState.AutoLoad = false
        NotifyConfig("loc:Auto_Load", "loc:Config_Content12", "circle-alert")
        return
    end

    SaveAutoLoad(selected, true)
    NotifyConfig("loc:Auto_Load", "Enabled: " .. selected, "check")
    StartAutoSave()
end

MyUIElements.SettingsManager.MySubTabs.Config:Input({
    Title = "loc:Config_Name", Desc = "loc:Config_Name_Desc", Flag = "Config Name",
    Placeholder = "Enter new config name", Value = "", Callback = OnConfigNameChanged
})

ConfigDropdownElement = MyUIElements.SettingsManager.MySubTabs.Config:Dropdown({
    Title = "loc:Config_List", Desc = "loc:Config_List_Desc", Flag = "Config List",
    Values = GetConfigs(), Value = nil, Callback = OnConfigSelected
})

MyUIElements.SettingsManager.MySubTabs.Config:Button({ Title = "loc:Make_Config", Desc = "loc:Make_Config_Desc", Callback = OnMakeConfigPressed })
MyUIElements.SettingsManager.MySubTabs.Config:Button({ Title = "loc:Update_Config", Desc = "loc:Update_Config_Content", Callback = OnUpdateConfigPressed })
MyUIElements.SettingsManager.MySubTabs.Config:Button({ Title = "loc:Load_Config", Desc = "loc:Load_Config_Desc", Callback = OnLoadConfigPressed })
MyUIElements.SettingsManager.MySubTabs.Config:Button({ Title = "loc:Delete_Config", Desc = "loc:Delete_Config_Desc", Callback = OnDeleteConfigPressed })

MyUIElements.SettingsManager.MySubTabs.Config:Toggle({
    Title = "loc:Auto_Load_Config", Desc = "loc:Auto_Load_Config_Desc", Flag = "Auto Load Config v2",
    Value = false, Callback = OnAutoLoadToggled
})

task.delay(1, function()
    local saved, enabled = LoadAutoLoad()
    if saved == "" or not ConfigExists(saved) then return end

    ConfigState.Selected = saved
    ConfigState.AutoLoad = enabled

    ExecuteConfigAction(saved, "Load")
    RefreshDropdown()

    if enabled then
        StartAutoSave()
        NotifyConfig("loc:Auto_Load", "Loaded: " .. saved .. " (enabled)", "check")
    else
        NotifyConfig("loc:Auto_Load", "Loaded: " .. saved .. " (disabled)", "circle-alert")
    end
end)

getgenv().showpingandfps = getgenv().showpingandfps ~= false

if getgenv().showpingandfps then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SLK-GAMING-MOD/Open-soure/refs/heads/main/fps%2Bping.luau"))()
end
