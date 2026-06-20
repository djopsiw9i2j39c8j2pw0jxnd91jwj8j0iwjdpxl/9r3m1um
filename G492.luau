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

localPlayer = Players.LocalPlayer
PlayerGui = localPlayer:WaitForChild("PlayerGui", 10)
playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()

localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)

Camera = Workspace.CurrentCamera

getgenv().SprinklerList = {"Common Sprinkler", "Uncommon Sprinkler", "Rare Sprinkler", "Legendary Sprinkler", "Super Sprinkler" }

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
            Visual = "Visual",
            Player = "Player",
            Teleport = "Teleport",
            Main = "Main",
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
            Visual = "Hiển thị",
            Player = "Người chơi",
            Teleport = "Dịch chuyển",
            Main = "Chính",
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
            Power = "Sức mạnh nhân vật",
            PowerDesc = "Điều chỉnh khả năng di chuyển nâng cao và các kỹ năng đặc biệt của nhân vật.",
            SettingsManager = "Quản lý cài đặt",
            SettingsManagerDesc = "Cấu hình và tùy chỉnh các tính năng tiện ích.",
            Update_Info = "Thông tin cập nhật",
            Update_Info_Desc = "Dùng để cập nhật thông tin Discord.",
            Update_Notify = "Đã cập nhật!",
            Update_Notify_Content = "Đã làm mới thống kê",
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

-- [ NÚT BẬT/TẮT ĐỘ TRONG SUỐT ] --
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
Window:Tag({Title = "v1.1.0", Icon = "cog", Color = Color3.fromHex("#30ff6a")})

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
    
    Player = Tabs.Gameplay:Tab({ 
        Title = "loc:Player", Icon = "user", Desc = "Người Chơi", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 2 
    }),
    
    Teleport = Tabs.Gameplay:Tab({ 
        Title = "loc:Teleport", Icon = "map", Desc = "Dịch Chuyển", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Visual = Tabs.Gameplay:Tab({ 
        Title = "loc:Visual", Icon = "eye", Desc = "Thị Giác", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 3 
    }),
    
    Misc = Tabs.System:Tab({ 
        Title = "loc:Misc", Icon = "menu", Desc = "Linh Tinh", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 1 
    }),
    
    Settings = Tabs.System:Tab({ 
        Title = "loc:Settings", Icon = "settings", Desc = "Cài Đặt", IconThemed = true, 
        Locked = false, ShowTabTitle = true, Border = true, LayoutOrder = 2 
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
            Icon = "package",
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
            Icon = "briefcase",
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

Info:Button({
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

Info:Divider()

Info:Section({
    Title = "loc:Dev_Script",
    TextXAlignment = "Center",
    TextSize = 17
})

Info:Divider()

Info:Paragraph({
    Title = "loc:Main_Owner",
    Desc = "@72ms.",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Paragraph({
    Title = "loc:Support_Owner",
    Desc = "@datpro7253",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Paragraph({
    Title = "loc:Security_Owner",
    Desc = "@shadevex",
    Image = "rbxassetid://137817619970621",
    ImageSize = 30,
})

Info:Divider()

Info:Section({
    Title = "loc:My_Link",
    TextXAlignment = "Center",
    TextSize = 17
})

Info:Divider()

Info:Paragraph({
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
                    setclipboard("https://www.youtube.com/@slkgamingssr")
                end
            end
        }
    }
})

Info:Paragraph({
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

Info:Paragraph({
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
                    setclipboard("https://tiktok.com/@slkgamingssr")
                end
            end
        }
    }
})

local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))

-- 1. BẢNG DỮ LIỆU ĐỒNG BỘ GỘP CHUNG (1 BẢNG DUY NHẤT)
local Config = {
    -- Harvest Configs
    AutoHarvest = false, HarvestRadius = 50, HarvestSpeed = 0.1, MaxCapacity = 100,
    TargetSeeds = {}, TargetEffects = {}, EffectCount = 1, FilterByEffect = false,
    -- Steal Configs
    AutoSteal = false, TeleportSteal = false, StealRadius = 50, StealSpeed = 0.2, 
    Steal_TargetSeeds = {}, Steal_TargetEffects = {}, Steal_EffectCount = 1, Steal_FilterByEffect = false,
    -- Seed Configs
    AutoGoldSeed = false, AutoRainbowSeed = false,
    -- Pet Configs
    WildPet_TargetPets = {}, WildPet_AutoTp = false, WildPet_AutoInteract = false
}

local SysData = {
    LastHarvest = 0, LastSteal = 0, CachedTargets = {},
    ActiveTarget = nil, ActiveType = nil
}

-- 2. DANH SÁCH & HÀM BỔ TRỢ
local ValidItemsLower = {
    ["carrot"] = true, ["strawberry"] = true, ["tomato"] = true, ["blueberry"] = true, ["apple"] = true,
    ["pinetree"] = true, ["bamboo"] = true, ["pumpkin"] = true, ["cactus"] = true, ["pineapple"] = true,
    ["green bean"] = true, ["banana"] = true, ["grape"] = true, ["mushroom"] = true, ["coconut"] = true,
    ["mango"] = true, ["thorn rose"] = true, ["dragon fruit"] = true, ["acorn"] = true, ["cherry"] = true,
    ["sunflower"] = true, ["venus fly trap"] = true, ["lotus"] = true, ["pomegranate"] = true, ["beanstalk"] = true,
    ["poison apple"] = true, ["moon bloom"] = true, ["dragon's breath"] = true, ["poison ivy"] = true, ["glow mushroom"] = true,
    ["ghost pepper"] = true, ["horned melon"] = true, ["corn"] = true, ["baby cactus"] = true, ["tulip"] = true, ["romanesco"] = true
}

local SeedList = {}
for k, _ in pairs(ValidItemsLower) do table.insert(SeedList, k) end
table.sort(SeedList)

local EffectList = {"Shiny", "Giant", "Albino", "Overgrown", "Perfect", "Radioactive", "Gold", "Rainbow", "Mutated"}

local allPets = {}
pcall(function()
    local PetModules = require(ReplicatedStorage:WaitForChild("SharedModules", 5):WaitForChild("PetModules", 5))
    for petName, _ in pairs(PetModules) do
        if type(petName) == "string" then table.insert(allPets, petName) end
    end
    table.sort(allPets)
end)

local function isTargetPet(petName)
    if type(Config.WildPet_TargetPets) == "table" then
        for key, selected in pairs(Config.WildPet_TargetPets) do
            if (type(key) == "number" and selected == petName) or (type(key) == "string" and key == petName and selected == true) then
                return true
            end
        end
    elseif type(Config.WildPet_TargetPets) == "string" and Config.WildPet_TargetPets == petName then
        return true
    end
    return false
end

local function isSeedMatched(seedName, configTable)
    if not configTable or type(configTable) ~= "table" then return true end
    local hasSelection = false
    for k, v in pairs(configTable) do
        local targetName = type(k) == "string" and k or v
        local isSelected = true
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
            local effectName = type(k) == "string" and k or v
            local isSelected = true
            if type(k) == "string" then isSelected = v end
            
            if isSelected and string.find(string.lower(effectString), string.lower(effectName), 1, true) then
                return true
            end
        end
    end
    return false
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

local function getInventoryCount()
    local count = 0
    local function countValid(folder)
        if not folder then return end
        for _, item in ipairs(folder:GetChildren()) do
            local itemNameLower = string.lower(item.Name)
            for validNameLower, _ in pairs(ValidItemsLower) do
                if string.find(itemNameLower, validNameLower, 1, true) then
                    local amtNode = item:FindFirstChild("Amount") or item:FindFirstChild("Quantity") or item:FindFirstChild("Value")
                    count = count + (amtNode and (amtNode:IsA("IntValue") or amtNode:IsA("NumberValue")) and amtNode.Value or 1)
                    break
                end
            end
        end
    end
    countValid(localPlayer:FindFirstChildOfClass("Backpack"))
    countValid(localPlayer.Character)
    return count
end

local function executeActionDirectly(data)
    if not data then return end
    if data.IsHarvest and data.PlantId then
        Networking.Garden.CollectFruit:Fire(data.PlantId, data.FruitId)
    elseif data.IsSteal and data.OwnerUserId and data.PlantId then
        Networking.Steal.BeginSteal:Fire(data.OwnerUserId, data.PlantId, data.FruitId)
        Networking.Steal.CompleteSteal:Fire()
    elseif data.Prompt and data.Prompt.Parent then
        if fireproximityprompt then
            fireproximityprompt(data.Prompt)
        else
            data.Prompt:InputHoldBegin()
            task.wait(data.Prompt.HoldDuration or 0)
            data.Prompt:InputHoldEnd()
        end
    end
end

-- 3. GIAO DIỆN UI (Đã sắp xếp đúng order)
MyUIElements.Harvest:Dropdown({
    Title = "loc:SelectFruit", Desc = "loc:SelectFruitDesc", 
    Flag = "Harvest_TargetSeeds", Values = SeedList, Value = {}, Multi = true, AllowNone = true,
    Callback = function(val) Config.TargetSeeds = val end
})

MyUIElements.Harvest:Dropdown({
    Title = "loc:SelectMutations", Desc = "loc:SelectMutationsDesc", 
    Flag = "Harvest_TargetEffects", Values = EffectList, Value = {}, Multi = true, AllowNone = true,
    Callback = function(val) Config.TargetEffects = val end
})

MyUIElements.Harvest:Input({
    Title = "loc:Countofmutations", Desc = "loc:CountofmutationsDesc", 
    Flag = "Harvest_EffectCount", Value = "1", 
    Callback = function(val) Config.EffectCount = tonumber(val) or 1 end
})

MyUIElements.Harvest:Toggle({
    Title = "loc:Auto_Harvest", Desc = "loc:Auto_Harvest_Desc", Flag = "Auto Harvest v2",
    Value = false, Callback = function(val) Config.AutoHarvest = val end
})

MyUIElements.Harvest:Toggle({
    Title = "loc:OnlyHarvestMutations", Desc = "loc:OnlyHarvestMutationsDesc", Flag = "Harvest_EffectFilter",
    Value = false, Callback = function(val) Config.FilterByEffect = val end
})

MyUIElements.Harvest:Input({
    Title = "loc:Harvest_Radius", Desc = "loc:Harvest_Radius_Desc", Flag = "Harvest Radius Config",
    Placeholder = "Enter harvest radius", Value = "50", 
    Callback = function(val) Config.HarvestRadius = tonumber(val) or 50 end
})

MyUIElements.Harvest:Input({
    Title = "loc:Harvest_Speed", Desc = "loc:Harvest_Speed_Desc", Flag = "Harvest Speed Config",
    Placeholder = "Delay between harvests", Value = "0.1", 
    Callback = function(val) Config.HarvestSpeed = tonumber(val) or 0.1 end
})

MyUIElements.Harvest:Input({
    Title = "loc:Max_Inventory_Capacity", Desc = "loc:Max_Inventory_Capacity_Desc", Flag = "Max Capacity Config",
    Placeholder = "Default: 100", Value = "100", 
    Callback = function(val) Config.MaxCapacity = tonumber(val) or 100 end
})

-- Steal UI Section
MyUIElements.Steal:Dropdown({
    Title = "loc:SelectFruit", Desc = "loc:SelectFruitDesc", 
    Flag = "Steal_TargetSeeds", Values = SeedList, Value = {}, Multi = true, AllowNone = true,
    Callback = function(val) Config.Steal_TargetSeeds = val end
})

MyUIElements.Steal:Dropdown({
    Title = "loc:SelectMutations", Desc = "loc:SelectMutationsDesc", 
    Flag = "Steal_TargetEffects", Values = EffectList, Value = {}, Multi = true, AllowNone = true,
    Callback = function(val) Config.Steal_TargetEffects = val end
})

MyUIElements.Steal:Input({
    Title = "loc:Countofmutations", Desc = "loc:CountofmutationsDesc", 
    Flag = "Steal_EffectCount", Value = "1", 
    Callback = function(val) Config.Steal_EffectCount = tonumber(val) or 1 end
})

MyUIElements.Steal:Toggle({
    Title = "loc:Auto_Steal", Desc = "loc:Auto_Steal_Desc", Flag = "Auto Steal v2",
    Value = false, Callback = function(val) Config.AutoSteal = val end
})

MyUIElements.Steal:Toggle({
    Title = "loc:OnlyStealMutations", Desc = "loc:OnlyStealMutationsDesc", Flag = "Steal_EffectFilter",
    Value = false, Callback = function(val) Config.Steal_FilterByEffect = val end
})

MyUIElements.Steal:Toggle({
    Title = "loc:Teleport_to_Steal", Desc = "loc:Teleport_to_Steal_Desc", Flag = "Teleport Steal Config",
    Value = false, Callback = function(val) Config.TeleportSteal = val end
})

MyUIElements.Steal:Input({
    Title = "loc:Steal_Radius", Desc = "loc:Steal_Radius_Desc", Flag = "Steal Radius Config",
    Placeholder = "Enter steal radius", Value = "50", 
    Callback = function(val) Config.StealRadius = tonumber(val) or 50 end
})

MyUIElements.Steal:Input({
    Title = "loc:Steal_Speed", Desc = "loc:Steal_Speed_Desc", Flag = "Steal Speed Config",
    Placeholder = "Delay between steals", Value = "0.2", 
    Callback = function(val) Config.StealSpeed = tonumber(val) or 0.2 end
})

MyUIElements.Seed:Toggle({
    Title = "loc:AutoClaimGoldSeed", Desc = "loc:AutoClaimGoldSeedDesc", Flag = "Auto Gold Seed Config",
    Value = false, Callback = function(val) Config.AutoGoldSeed = val end
})

MyUIElements.Seed:Toggle({
    Title = "loc:AutoClaimRainbowSeed", Desc = "loc:AutoClaimRainbowSeedDesc", Flag = "Auto Rainbow Seed Config",
    Value = false, Callback = function(val) Config.AutoRainbowSeed = val end
})

MyUIElements.Pets:Dropdown({
    Title = "loc:SelectPets", Desc = "loc:SelectPetsDesc", Flag = "WildPet_Select",
    Values = allPets, Value = {}, Multi = true, AllowNone = true,
    Callback = function(val) Config.WildPet_TargetPets = val end
})

MyUIElements.Pets:Toggle({
    Title = "loc:TeleportToPets", Desc = "loc:TeleportToPetsDesc", Flag = "WildPet_AutoTp",
    Value = false, Callback = function(state) Config.WildPet_AutoTp = state end
})

MyUIElements.Pets:Toggle({
    Title = "loc:AutoBuyPets", Desc = "loc:AutoBuyPetsDesc", Flag = "WildPet_AutoInteract",
    Value = false, Callback = function(state) Config.WildPet_AutoInteract = state end
})

-- 4. BỘ KHÓA CFRAME ĐỒNG BỘ
RunService.Heartbeat:Connect(function()
    local isLockValid = false

    if SysData.ActiveTarget then
        local data = SysData.ActiveTarget
        if data.Prompt and data.Prompt.Parent and data.Prompt.Enabled then
            if SysData.ActiveType == "Rainbow" and Config.AutoRainbowSeed then isLockValid = true
            elseif SysData.ActiveType == "Gold" and Config.AutoGoldSeed then isLockValid = true
            elseif SysData.ActiveType == "Steal" and Config.AutoSteal and Config.TeleportSteal then
                local timeNow = Lighting.ClockTime
                if timeNow >= 18 or timeNow <= 6 then isLockValid = true end
            elseif SysData.ActiveType == "WildPet" and Config.WildPet_AutoTp and data.RefPart and data.RefPart.Parent then
                isLockValid = true
            end
        end
    end

    if isLockValid then
        local playerCharacter = localPlayer.Character
        local hrp = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
        if hrp then
            local targetCFrame = (SysData.ActiveTarget.RefPart and SysData.ActiveTarget.RefPart.CFrame or SysData.ActiveTarget.Part.CFrame)
            local offset = (SysData.ActiveType == "WildPet") and Vector3.new(0, 2.5, 0) or Vector3.new(0, 3, 0)
            
            hrp.CFrame = targetCFrame + offset
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end
    else
        SysData.ActiveTarget = nil
        SysData.ActiveType = nil
    end
end)

-- 5. QUÉT VÀ LƯU TRỮ (CACHE) MỌI THỨ CÓ TÍCH HỢP LỌC SEED/EFFECT
task.spawn(function()
    while task.wait(0.5) do
        local isAnyFarmActive = Config.AutoHarvest or Config.AutoSteal or Config.AutoGoldSeed or Config.AutoRainbowSeed
        local isPetActive = Config.WildPet_AutoTp or Config.WildPet_AutoInteract
        if not isAnyFarmActive and not isPetActive then continue end
        
        local newCache = {}
        
        if isPetActive then
            local wildPetRef = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WildPetRef")
            local wildPetSpawns = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WildPetSpawns")
            
            if wildPetRef and wildPetSpawns then
                for _, refPart in pairs(wildPetRef:GetChildren()) do
                    if refPart:IsA("BasePart") then
                        local petName = refPart:GetAttribute("PetName")
                        local ownerId = refPart:GetAttribute("OwnerUserId")
                        if (not ownerId or ownerId == 0 or ownerId == localPlayer.UserId) and isTargetPet(petName) then
                            for _, petModel in pairs(wildPetSpawns:GetChildren()) do
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

        if isAnyFarmActive then
            local myId = tostring(localPlayer.UserId)
            local function processPrompt(obj, plotOwner, isMyPlot)
                if not obj:IsA("ProximityPrompt") then return end
                local nameL, actL, objL = string.lower(obj.Name), string.lower(obj.ActionText), string.lower(obj.ObjectText)
                
                local isHarvest = (nameL == "harvest" or actL == "harvest" or objL == "harvest")
                local isSteal = (nameL == "steal" or actL == "steal" or objL == "steal")
                local isGold = (string.find(objL, "gold", 1, true) and string.find(actL, "claim", 1, true)) or string.find(nameL, "gold", 1, true)
                local isRainbow = (string.find(objL, "rainbow", 1, true) and string.find(actL, "claim", 1, true)) or string.find(nameL, "rainbow", 1, true)

                if isHarvest or isSteal or isGold or isRainbow then
                    local model = obj:FindFirstAncestorWhichIsA("Model")
                    local isValidAction = true
                    
                    if (isHarvest or isSteal) and model then
                        local cfgSeeds, cfgFilterByEffect, cfgEffects, cfgEffectCount
                        
                        if isHarvest then
                            cfgSeeds = Config.TargetSeeds
                            cfgFilterByEffect = Config.FilterByEffect
                            cfgEffects = Config.TargetEffects
                            cfgEffectCount = Config.EffectCount
                        elseif isSteal then
                            cfgSeeds = Config.Steal_TargetSeeds
                            cfgFilterByEffect = Config.Steal_FilterByEffect
                            cfgEffects = Config.Steal_TargetEffects
                            cfgEffectCount = Config.Steal_EffectCount
                        end

                        -- Lọc hạt giống (Seed)
                        local sName = model:GetAttribute("CorePartName") or model:GetAttribute("SeedName") or model.Name
                        isValidAction = isSeedMatched(sName, cfgSeeds)

                        -- Lọc theo hiệu ứng (Effect/Mutation)
                        if isValidAction and cfgFilterByEffect then
                            local effectCount = 0
                            local matchedTargetEffect = false
                            
                            -- Quét các Attribute
                            for k, v in pairs(model:GetAttributes()) do
                                local kL, vL = string.lower(tostring(k)), string.lower(tostring(v))
                                if string.find(kL, "mutation") or string.find(kL, "effect") then
                                    effectCount = effectCount + 1
                                    if isEffectMatched(vL, cfgEffects) or isEffectMatched(kL, cfgEffects) then matchedTargetEffect = true end
                                end
                            end
                            
                            -- Quét dự phòng các object con
                            local effFolder = model:FindFirstChild("Mutations") or model:FindFirstChild("Effects")
                            if effFolder then
                                for _, child in ipairs(effFolder:GetChildren()) do
                                    effectCount = effectCount + 1
                                    if isEffectMatched(child.Name, cfgEffects) or (child:IsA("StringValue") and isEffectMatched(child.Value, cfgEffects)) then
                                        matchedTargetEffect = true
                                    end
                                end
                            end

                            -- Kiểm tra điều kiện có được phép nhặt/trộm hay không
                            local hasRequiredEffectsSelected = false
                            if type(cfgEffects) == "table" then
                                for k, v in pairs(cfgEffects) do
                                    if (type(k) == "string" and v) or (type(k) == "number") then hasRequiredEffectsSelected = true break end
                                end
                            end

                            if effectCount < cfgEffectCount then
                                isValidAction = false
                            elseif hasRequiredEffectsSelected and not matchedTargetEffect then
                                isValidAction = false
                            end
                        end
                    end

                    if (isHarvest and isValidAction) or (isSteal and isValidAction) or isGold or isRainbow then
                        table.insert(newCache, {
                            Prompt = obj, Part = obj.Parent, PlotOwner = plotOwner, IsMyPlot = isMyPlot,
                            IsHarvest = isHarvest, IsSteal = isSteal, IsGoldSeed = isGold, IsRainbowSeed = isRainbow,
                            OwnerUserId = model and tonumber(model:GetAttribute("UserId")),
                            PlantId = model and model:GetAttribute("PlantId"),
                            FruitId = model and model:GetAttribute("FruitId") or ""
                        })
                    end
                end
            end

            local gardens = Workspace:FindFirstChild("Gardens")
            if gardens then
                for _, plot in pairs(gardens:GetChildren()) do
                    local plotOwner = getPlotOwner(plot)
                    local isMyPlot = (plotOwner == localPlayer.Name or plotOwner == localPlayer.DisplayName or plotOwner == myId)
                    for _, obj in pairs(plot:GetDescendants()) do processPrompt(obj, plotOwner, isMyPlot) end
                end
            end

            if Config.AutoGoldSeed or Config.AutoRainbowSeed then
                for _, child in pairs(Workspace:GetChildren()) do
                    if child ~= gardens and child.Name ~= "Players" and child.Name ~= "Terrain" and child ~= Workspace.CurrentCamera then
                        for _, obj in pairs(child:GetDescendants()) do processPrompt(obj, nil, false) end
                    end
                end
            end
        end

        SysData.CachedTargets = newCache
    end
end)

-- 6. THỰC THI (ĐÃ PHÂN QUYỀN ƯU TIÊN)
task.spawn(function()
    while task.wait(0.05) do
        local playerCharacter = localPlayer.Character
        local hrp = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local hrpPos, timeNow = hrp.Position, os.clock()
        
        if SysData.ActiveTarget then
            task.spawn(executeActionDirectly, SysData.ActiveTarget)
            continue
        end

        local isNight = (Lighting.ClockTime >= 18 or Lighting.ClockTime <= 6)
        local canSteal = Config.AutoSteal and (timeNow - SysData.LastSteal >= Config.StealSpeed)
        local canHarvest = Config.AutoHarvest and (timeNow - SysData.LastHarvest >= Config.HarvestSpeed) and (getInventoryCount() < Config.MaxCapacity)

        local activePlayersPos = {}
        if canSteal and isNight then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pos = p.Character.HumanoidRootPart.Position
                    activePlayersPos[p.Name] = pos
                    activePlayersPos[p.DisplayName] = pos
                    activePlayersPos[tostring(p.UserId)] = pos
                end
            end
        end

        local closest = { Rainbow = nil, Gold = nil, Pet = nil, Steal = nil, Harvest = nil }
        local dists = { Rainbow = math.huge, Gold = math.huge, Pet = math.huge, Steal = (Config.TeleportSteal and math.huge or Config.StealRadius), Harvest = Config.HarvestRadius }

        for _, data in ipairs(SysData.CachedTargets) do
            if not data.Prompt or not data.Part or not data.Prompt.Parent or not data.Prompt.Enabled then continue end
            local pos = data.RefPart and data.RefPart.Position or data.Part.Position
            if not pos then continue end
            local distance = (hrpPos - pos).Magnitude

            if Config.AutoRainbowSeed and data.IsRainbowSeed and distance < dists.Rainbow then 
                closest.Rainbow = data; dists.Rainbow = distance
            elseif Config.AutoGoldSeed and data.IsGoldSeed and distance < dists.Gold then 
                closest.Gold = data; dists.Gold = distance
            elseif (Config.WildPet_AutoTp or Config.WildPet_AutoInteract) and data.IsWildPet and distance < dists.Pet then 
                closest.Pet = data; dists.Pet = distance
            elseif canSteal and data.IsSteal and not data.IsMyPlot and distance < dists.Steal and isNight then
                local ownerPos = data.PlotOwner and activePlayersPos[data.PlotOwner]
                if not ownerPos or (ownerPos - pos).Magnitude > 50 then
                    closest.Steal = data; dists.Steal = distance
                end
            elseif canHarvest and data.IsHarvest and data.IsMyPlot and distance < dists.Harvest then 
                closest.Harvest = data; dists.Harvest = distance
            end
        end

        if closest.Rainbow then
            SysData.ActiveTarget, SysData.ActiveType = closest.Rainbow, "Rainbow"
            task.spawn(executeActionDirectly, closest.Rainbow)
        elseif closest.Gold then
            SysData.ActiveTarget, SysData.ActiveType = closest.Gold, "Gold"
            task.spawn(executeActionDirectly, closest.Gold)
        elseif closest.Pet then
            if Config.WildPet_AutoTp then SysData.ActiveTarget, SysData.ActiveType = closest.Pet, "WildPet" end
            if Config.WildPet_AutoInteract then task.spawn(executeActionDirectly, closest.Pet) end
        elseif closest.Steal and Config.TeleportSteal then
            SysData.ActiveTarget, SysData.ActiveType = closest.Steal, "Steal"
            task.spawn(executeActionDirectly, closest.Steal); SysData.LastSteal = timeNow
        elseif closest.Steal and not Config.TeleportSteal then
            task.spawn(executeActionDirectly, closest.Steal); SysData.LastSteal = timeNow
        elseif closest.Harvest then
            task.spawn(executeActionDirectly, closest.Harvest); SysData.LastHarvest = timeNow
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


local KeepUIOpen = {
    GearShop = false,
    SeedShop = false,
    WeatherUI = false
}

local SellSettings = {
    AutoSellAll = false,
    AutoSellNormal = false,
    SellAllSpeed = 1.0,     
    SellNormalSpeed = 1.0   
}

local Networking = nil
pcall(function()
    Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
end)

local cachedWeatherData = nil

local function getLiveWeatherData()
    if cachedWeatherData then return cachedWeatherData end -- Trả về luôn nếu đã tìm thấy trước đó
    
    local weatherModule = ReplicatedStorage:FindFirstChild("WeatherData", true)
    
    if weatherModule and weatherModule:IsA("ModuleScript") then
        local success, result = pcall(require, weatherModule)
        if success and type(result) == "table" then
            if result.Data then
                cachedWeatherData = result.Data
            elseif type(result[1]) == "table" then
                cachedWeatherData = result
            end
        end
    end
    
    return cachedWeatherData
end

-- Hàm chuyển đổi số giây sang định dạng thời gian trực quan (MM:SS hoặc HH:MM:SS)
local function formatTime(seconds)
    if seconds <= 0 then return "00:00" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = seconds % 60
    if h > 0 then
        return string.format("%02d:%02d:%02d", h, m, s)
    else
        return string.format("%02d:%02d", m, s)
    end
end

task.spawn(function()
    -- Gắn biến UI bên ngoài vòng lặp để tránh FindFirstChild hàng chục lần 1 giây
    local gearShopUI = PlayerGui:WaitForChild("GearShop", 5)
    local seedShopUI = PlayerGui:WaitForChild("SeedShop", 5)
    local weatherUI = PlayerGui:WaitForChild("WeatherUI", 5)

    while task.wait(0.5) do
        -- 1. Ghim Gear Shop
        if KeepUIOpen.GearShop and gearShopUI then
            -- Chỉ gán bằng true nếu nó đang false (tránh bắt máy tính set liên tục)
            if not gearShopUI.Enabled then gearShopUI.Enabled = true end
            local frame = gearShopUI:FindFirstChildWhichIsA("Frame")
            if frame and not frame.Visible then frame.Visible = true end
        end
        
        -- 2. Ghim Seed Shop
        if KeepUIOpen.SeedShop and seedShopUI then
            if not seedShopUI.Enabled then seedShopUI.Enabled = true end
            local frame = seedShopUI:FindFirstChildWhichIsA("Frame")
            if frame and not frame.Visible then frame.Visible = true end
        end
        
        -- 3. Ghim Weather UI & ÉP CHẠY TIME
        if KeepUIOpen.WeatherUI and weatherUI then
            if not weatherUI.Enabled then weatherUI.Enabled = true end
            local frame = weatherUI:FindFirstChild("Frame")
            
            if frame then
                if not frame.Visible then frame.Visible = true end
                
                local weatherDataList = getLiveWeatherData()
                
                for _, child in pairs(frame:GetChildren()) do
                    local timeLabel = child:FindFirstChild("Time")
                    if timeLabel and timeLabel:IsA("TextLabel") then
                        -- Check trạng thái Visible trước khi gán
                        if not timeLabel.Visible then timeLabel.Visible = true end
                        if not child.Visible then child.Visible = true end
                        if not timeLabel.TextScaled then timeLabel.TextScaled = true end
                        
                        local matchedData = nil
                        
                        if weatherDataList then
                            local childNameLower = string.lower(child.Name)
                            
                            -- Cách 1: Đối chiếu tên
                            for _, wData in ipairs(weatherDataList) do
                                if string.find(childNameLower, string.lower(wData.Name)) then
                                    matchedData = wData
                                    break
                                end
                            end
                            
                            -- Cách 2: TỐI ƯU HÓA - Thay GetDescendants bằng GetChildren để quét mượt hơn
                            if not matchedData then
                                for _, desc in pairs(child:GetChildren()) do
                                    if desc:IsA("TextLabel") and desc.Name ~= "Time" then
                                        local textLower = string.lower(desc.Text)
                                        for _, wData in ipairs(weatherDataList) do
                                            local wNameLower = string.lower(wData.Name)
                                            if string.find(textLower, wNameLower) or textLower == wNameLower then
                                                matchedData = wData
                                                break
                                            end
                                        end
                                    end
                                    if matchedData then break end
                                end
                            end
                        end
                        
                        -- Hiển thị dữ liệu
                        if matchedData then
                            if matchedData.AlwaysOn then
                                if timeLabel.Text ~= "Always Active" then
                                    timeLabel.Text = "Always Active"
                                    timeLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
                                end
                            else
                                local now = os.time()
                                local occuranceSecs = (matchedData.Occurance or 60) * 60
                                local durationSecs = matchedData.Last or 300
                                local timeMod = now % occuranceSecs
                                
                                if timeMod < durationSecs then
                                    local left = durationSecs - timeMod
                                    timeLabel.Text = "Active: " .. formatTime(left)
                                    timeLabel.TextColor3 = Color3.fromRGB(85, 255, 85)
                                else
                                    local left = occuranceSecs - timeMod
                                    timeLabel.Text = formatTime(left)
                                    timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                end
                            end
                        else
                            local fallbackLoop = os.time() % 3600
                            timeLabel.Text = formatTime(3600 - fallbackLoop)
                            timeLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        if SellSettings.AutoSellAll and Networking then
            pcall(function()
                Networking.NPCS.SellAll:Fire()
            end)
            task.wait(SellSettings.SellAllSpeed)
        else
            task.wait(0.5) 
        end
    end
end)

task.spawn(function()
    while true do
        if SellSettings.AutoSellNormal and Networking then
            pcall(function()
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

MyUIElements.Shop:Toggle({
    Title = "loc:ShowGearShop", 
    Desc = "loc:ShowGearShopDesc", 
    Flag = "Toggle_GearShop",
    Value = false, 
    Callback = function(val) 
        KeepUIOpen.GearShop = val
        if not val then
            local ui = PlayerGui:FindFirstChild("GearShop")
            if ui then ui.Enabled = false end
        end
    end 
})

MyUIElements.Shop:Toggle({
    Title = "loc:ShowSeedShop", 
    Desc = "loc:ShowSeedShopDesc", 
    Flag = "Toggle_SeedShop",
    Value = false, 
    Callback = function(val) 
        KeepUIOpen.SeedShop = val
        if not val then
            local ui = PlayerGui:FindFirstChild("SeedShop")
            if ui then ui.Enabled = false end
        end
    end 
})

MyUIElements.Shop:Toggle({
    Title = "loc:ShowWeatherUI", 
    Desc = "loc:ShowWeatherUIDesc", 
    Flag = "Toggle_WeatherUI",
    Value = false, 
    Callback = function(val)
        KeepUIOpen.WeatherUI = val
        if not val then
            local weatherUI = PlayerGui:FindFirstChild("WeatherUI")
            if weatherUI then
                weatherUI.Enabled = false
                local frame = weatherUI:FindFirstChild("Frame")
                if frame then 
                    frame.Visible = false 
                    for _, child in pairs(frame:GetChildren()) do
                        local timeLabel = child:FindFirstChild("Time")
                        if timeLabel and timeLabel:IsA("TextLabel") then
                            timeLabel.Visible = false
                            child.Visible = false 
                        end
                    end
                end
            end
        end
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

-- ==========================================
-- HỆ THỐNG CHẶN ÂM THANH THEO ID
-- ==========================================
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
-- ==========================================

local ShopConfig = {
    Net = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking")),
    PlayerReplica = require(ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("PlayerStateClient")):WaitForLocalReplica(30),
    
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

local function GetMoney()
    return (ShopConfig.PlayerReplica and ShopConfig.PlayerReplica.Data) and (ShopConfig.PlayerReplica.Data.Sheckles or 0) or 0
end

task.spawn(function()
    while true do
        task.wait(ShopConfig.Seed.SpeedDelay) 
        if ShopConfig.Seed.AutoBuy then
            local currentMoney = GetMoney()
            for _, itemName in ipairs(ShopConfig.Seed.Selected) do
                if not ShopConfig.Seed.AutoBuy then break end
                local price = ShopConfig.Seed.Prices[itemName] or 0
                
                local stockItem = ShopConfig.Seed.Stock:FindFirstChild(itemName)
                if stockItem then
                    -- Lấy tổng số lượng trên kệ (Max Stock) của đợt refresh này
                    local maxStock = stockItem.Value
                    
                    -- Check trong dữ liệu người chơi xem đợt này đã mua bao nhiêu cái rồi
                    local purchased = 0
                    if ShopConfig.PlayerReplica and ShopConfig.PlayerReplica.Data and ShopConfig.PlayerReplica.Data.PurchasedThisRestock and ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Seeds then
                        purchased = ShopConfig.PlayerReplica.Data.PurchasedThisRestock.Seeds[itemName] or 0
                    end
                    
                    -- Tính toán số lượng hàng thực tế còn lại (giống hệt code gốc của game)
                    local remainingStock = math.max(maxStock - purchased, 0)
                    
                    -- Lặp đúng số lần bằng số lượng hàng còn lại
                    for i = 1, remainingStock do
                        -- Check lại tiền và trạng thái AutoBuy trước khi fire từng cái một
                        if currentMoney >= price and ShopConfig.Seed.AutoBuy then
                            pcall(function() ShopConfig.Net.SeedShop.PurchaseSeed:Fire(itemName) end)
                            currentMoney = currentMoney - price
                            task.wait(0.1) -- Delay nhỏ để server không kick vì spam
                        else
                            -- Nếu giữa chừng mà hết tiền hoặc bị tắt AutoBuy thì break vòng lặp luôn
                            break 
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(ShopConfig.Gear.SpeedDelay)
        if ShopConfig.Gear.AutoBuy then
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
                    if currentMoney >= price then
                        local stockItem = ShopConfig.Gear.Stock:FindFirstChild(itemName)
                        if stockItem and stockItem.Value > 0 then
                            pcall(function() ShopConfig.Net.GearShop.PurchaseGear:Fire(itemName) end)
                            currentMoney = currentMoney - price
                            task.wait(0.2)
                        end
                    end
                end
            end
        end
    end
end)

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

local greenbeanBypassEnabled = true 
local antiRagdollEnabled = false 

-- [1] NÚT GREENBEAN
MyUIElements.Bypass:Toggle({
    Title = "loc:GreenbeanSeed",
    Desc = "loc:GreenbeanSeedDesc",
    Flag = "GreenbeanBypass",
    Value = true,
    Callback = function(state) 
        greenbeanBypassEnabled = state
        if not state and playerCharacter then
            playerCharacter:SetAttribute("AppliedGreenbean", nil)
        end
    end
})

-- [2] NÚT ANTI-AFK
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

-- [3] NÚT ANTI-RAGDOLL (ĐÃ NÂNG CẤP ANTI-KNOCKBACK)
MyUIElements.Bypass:Toggle({
    Title = "Anti-Ragdoll",
    Desc = "Chống té ngã & Chống đẩy lùi",
    Flag = "AntiRagdollBypass",
    Value = false,
    Callback = function(state) 
        antiRagdollEnabled = state
        if state and playerCharacter and playerCharacter:GetAttribute("Ragdolled") then
            playerCharacter:SetAttribute("Ragdolled", true) 
        end
    end
})

-- ==========================================
-- CÁC VÒNG LẶP & EVENT XỬ LÝ NGẦM BÊN DƯỚI
-- ==========================================

-- Logic chạy ngầm cho Greenbean
task.spawn(function()
    while task.wait(0.5) do
        if greenbeanBypassEnabled and playerCharacter then
            if not playerCharacter:GetAttribute("AppliedGreenbean") then
                playerCharacter:SetAttribute("AppliedGreenbean", true)
            end
        end
    end
end)

-- Logic chạy ngầm cho Anti-AFK
localPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

-- Logic xử lý ngầm cho Anti-Ragdoll
local antiRagdollConnection = nil

local function handleUnragdoll(character)
    if not antiRagdollEnabled then return end
    
    if character:GetAttribute("Ragdolled") then
        -- 1. Xóa cờ ngã
        character:SetAttribute("Ragdolled", nil)
        
        -- 2. Đánh thức Humanoid
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.AutoRotate = true
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        
        -- 3. Nối lại xương
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
        
        -- 4. Bỏ các cục collider tạ
        for _, v in pairs(character:GetChildren()) do
            if v.Name == "Collider" then
                v:Destroy()
            end
        end

        -- 5. PHANH GẤP - TRIỆT TIÊU LỰC ĐẨY (ANTI-KNOCKBACK)
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            task.spawn(function()
                -- Lặp nhanh vài lần để đảm bảo Server không đè lại lực đẩy
                for i = 1, 5 do
                    -- Ép vận tốc bay & vận tốc xoay về 0
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    
                    -- Quét và tiêu diệt các Object tạo lực hất mà Dev có thể giấu vào
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

-- Hàm setup Event nghe lóng khi bị Server gắn cờ Ragdoll
local function setupAntiRagdollEvent(character)
    if antiRagdollConnection then antiRagdollConnection:Disconnect() end
    antiRagdollConnection = character:GetAttributeChangedSignal("Ragdolled"):Connect(function()
        if antiRagdollEnabled then
            handleUnragdoll(character)
        end
    end)
end

-- Áp dụng cho nhân vật hiện tại và cập nhật lại biến playerCharacter mỗi khi hồi sinh
if playerCharacter then setupAntiRagdollEvent(playerCharacter) end
localPlayer.CharacterAdded:Connect(function(newChar)
    playerCharacter = newChar 
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
