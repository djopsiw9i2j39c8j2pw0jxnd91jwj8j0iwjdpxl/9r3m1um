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
            GameTitle = "Grow A Garden 2",
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
            Settings = "Settings",
            Seed = "Seed",
            SeedSections = "Claim special seeds automatically and configure related options.",
            Shop = "Shop",
            Shop_Sections = "Configure automatic buying, selling, and shop-related features.",
            Harvest = "Harvest",
            Harvest_Sections = "Manage harvesting features and automation.",
            Steal = "Steal",
            Steal_Sections = "Manage stealing features and automation.",
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
            SeclectSeed = "Seclect Seed",
            SeclectSeedDesc = "Choose the seed to purchase automatically.",
            AutoBuySeed = "Auto Buy Seed",
            AutoBuySeedDesc = "Automatically purchase the selected seed.",
            BuySeedSpeed = "Buy Seed Speed",
            BuySeedSpeedDesc = "Adjust the speed of automatic seed purchases.",
            SeclectGear = "Seclect Gear",
            SeclectGearDesc = "Choose the gear to purchase automatically.",
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
            SeclectLanguage = "Select Language",
            SeclectLanguageDesc = "Select your preferred language",
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
        },
        vi = {
            HubTitle = "Hutao Hub",
            ThemeChanged = "Đã đổi giao diện",
            TransparencyTitle = "Độ trong suốt",
            TransparencyDisabled = "Đã tắt độ trong suốt",
            TransparencyEnabled = "Đã bật độ trong suốt",
            SettingsTab = "Cài đặt",
            SelectLanguage = "Chọn ngôn ngữ",
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

Window:Tag({Title = "Free", Icon = "gift", Color = Color3.fromHex("#30ff6a")})
Window:Tag({Title = "v1.0.3", Icon = "cog", Color = Color3.fromHex("#30ff6a")})

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
        Title = "loc:Main", Icon = "crown", Desc = "Phần Chính", IconThemed = true, 
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
            Icon = "sprout",
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
        ID = "Power",
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
    
    -- 2. Một MultiSection
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
        -- Cấu hình luôn các tab con bên trong MultiSection này
        SubTabs = {
            { ID = "Languages", Title = "Languages", Icon = "languages" },
            { ID = "UI", Title = "UI", Icon = "monitor" },
            { ID = "Config", Title = "Config", Icon = "wrench" }
        }
    },
    
    -- 3. Có thể thêm tiếp một Section khác ở đây
    -- { Type = "Section", ... }
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

local FarmSettings = {
    AutoHarvest = false,
    HarvestRadius = 50,
    HarvestSpeed = 0.1,
    AutoSteal = false,
    TeleportSteal = false,
    StealRadius = 50,
    StealSpeed = 0.2,
    MaxCapacity = 100,
    AutoGoldSeed = false,
    AutoRainbowSeed = false
}

local lastHarvestTime = 0
local lastStealTime = 0
local cachedPrompts = {}

-- Biến kiểm soát trạng thái KHÓA bypass Anti-cheat
local activeTargetData = nil -- [ĐÃ SỬA] Đổi thành lưu nguyên cụm data thay vì chỉ Prompt
local activeTargetType = nil

-- Danh sách vật phẩm hợp lệ ban đầu
local ValidItems = {
    ["Carrot"] = true, ["Strawberry"] = true, ["Tomato"] = true, ["Blueberry"] = true, ["Apple"] = true,
    ["Pinetree"] = true, ["Bamboo"] = true, ["Pumpkin"] = true, ["Cactus"] = true, ["Pineapple"] = true,
    ["Green Bean"] = true, ["Banana"] = true, ["Grape"] = true, ["Mushroom"] = true, ["Coconut"] = true,
    ["Mango"] = true, ["Thorn Rose"] = true, ["Dragon Fruit"] = true, ["Acorn"] = true, ["Cherry"] = true,
    ["Sunflower"] = true, ["Venus Fly Trap"] = true, ["Lotus"] = true, ["Pomegranate"] = true, ["Beanstalk"] = true,
    ["Poison Apple"] = true, ["Moon Bloom"] = true, ["Dragon's Breath"] = true, ["Poison Ivy"] = true, ["Glow Mushroom"] = true,
    ["Ghost Pepper"] = true, ["Horned Melon"] = true, ["Corn"] = true, ["Baby Cactus"] = true, ["Tulip"] = true, ["Romanesco"] = true
}

local ValidItemsLower = {}
for item, _ in pairs(ValidItems) do
    ValidItemsLower[string.lower(item)] = true
end

MyUIElements.Harvest:Toggle({
    Title = "loc:Auto_Harvest", Desc = "loc:Auto_Harvest_Desc", Flag = "Auto Harvest v2",
    Value = false, Callback = function(val) FarmSettings.AutoHarvest = val end
})

MyUIElements.Harvest:Input({
    Title = "loc:Harvest_Radius", Desc = "loc:Harvest_Radius_Desc", Flag = "Harvest Radius Config",
    Placeholder = "Enter harvest radius (Default: 50)", Value = "50", 
    Callback = function(val) FarmSettings.HarvestRadius = tonumber(val) or 50 end
})

MyUIElements.Harvest:Input({
    Title = "loc:Harvest_Speed", Desc = "loc:Harvest_Speed_Desc", Flag = "Harvest Speed Config",
    Placeholder = "Delay between harvests (Default: 0.1)", Value = "0.1", 
    Callback = function(val) FarmSettings.HarvestSpeed = tonumber(val) or 0.1 end
})

MyUIElements.Harvest:Input({
    Title = "loc:Max_Inventory_Capacity", Desc = "loc:Max_Inventory_Capacity_Desc", Flag = "Max Capacity Config",
    Placeholder = "Default: 100", Value = "100", 
    Callback = function(val) FarmSettings.MaxCapacity = tonumber(val) or 100 end
})

-- [ STEAL CONFIGS ]
MyUIElements.Steal:Toggle({
    Title = "loc:Auto_Steal", Desc = "loc:Auto_Steal_Desc", Flag = "Auto Steal v2",
    Value = false, Callback = function(val) FarmSettings.AutoSteal = val end
})

MyUIElements.Steal:Toggle({
    Title = "loc:Teleport_to_Steal", Desc = "loc:Teleport_to_Steal_Desc", Flag = "Teleport Steal Config",
    Value = false, Callback = function(val) FarmSettings.TeleportSteal = val end
})

MyUIElements.Steal:Input({
    Title = "loc:Steal_Radius", Desc = "loc:Steal_Radius_Desc", Flag = "Steal Radius Config",
    Placeholder = "Enter steal radius (Default: 50)", Value = "50", 
    Callback = function(val) FarmSettings.StealRadius = tonumber(val) or 50 end
})

MyUIElements.Steal:Input({
    Title = "loc:Steal_Speed", Desc = "loc:Steal_Speed_Desc", Flag = "Steal Speed Config",
    Placeholder = "Delay between steals (Default: 0.2)", Value = "0.2", 
    Callback = function(val) FarmSettings.StealSpeed = tonumber(val) or 0.2 end
})

MyUIElements.Seed:Toggle({
    Title = "loc:AutoClaimGoldSeed", Desc = "loc:AutoClaimGoldSeedDesc", Flag = "Auto Gold Seed Config",
    Value = false, Callback = function(val) FarmSettings.AutoGoldSeed = val end
})

MyUIElements.Seed:Toggle({
    Title = "loc:AutoClaimRainbowSeed", Desc = "loc:AutoClaimRainbowSeedDesc", Flag = "Auto Rainbow Seed Config",
    Value = false, Callback = function(val) FarmSettings.AutoRainbowSeed = val end
})

local function executeActionDirectly(data)
    if not data then return end
    
    if data.IsHarvest and data.PlantId then
        Networking.Garden.CollectFruit:Fire(data.PlantId, data.FruitId)
        
    elseif data.IsSteal and data.OwnerUserId and data.PlantId then
        -- Gửi Remote ăn trộm (Gửi Begin trước rồi Complete luôn)
        Networking.Steal.BeginSteal:Fire(data.OwnerUserId, data.PlantId, data.FruitId)
        Networking.Steal.CompleteSteal:Fire()
        
    else
        -- Fallback dùng lại Prompt Click cho mấy hạt giống lặt vặt (nếu cần)
        if data.Prompt and data.Prompt.Parent then
            if fireproximityprompt then
                fireproximityprompt(data.Prompt)
            else
                data.Prompt:InputHoldBegin()
                task.wait(data.Prompt.HoldDuration or 0)
                data.Prompt:InputHoldEnd()
            end
        end
    end
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
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")
    local character = localPlayer.Character
    
    local function countValidTools(parentFolder)
        if not parentFolder then return end
        local children = parentFolder:GetChildren()
        
        for i = 1, #children do
            local item = children[i]
            local itemNameLower = string.lower(item.Name)
            for validNameLower, _ in pairs(ValidItemsLower) do
                if string.find(itemNameLower, validNameLower, 1, true) then
                    local amountNode = item:FindFirstChild("Amount") or item:FindFirstChild("Quantity") or item:FindFirstChild("Value")
                    if amountNode and (amountNode:IsA("IntValue") or amountNode:IsA("NumberValue")) then
                        count = count + amountNode.Value
                    else
                        count = count + 1
                    end
                    break
                end
            end
        end
    end
    
    countValidTools(backpack)
    countValidTools(character)
    return count
end

--=============================================
-- 3. HỆ THỐNG BYPASS ANTI-CHEAT THÔNG MINH
--=============================================
RunService.Heartbeat:Connect(function()
    local isLockValid = false

    -- Kiểm tra tính hợp lệ của Khóa liên tục mỗi frame
    if activeTargetData and activeTargetData.Part and activeTargetData.Part.Parent then
        -- Thêm check coi Prompt còn tồn tại và Enabled ko, hoặc cây đã thu hoạch mất rễ
        local prompt = activeTargetData.Prompt
        if prompt and prompt.Parent and prompt.Enabled then
            if activeTargetType == "Rainbow" and FarmSettings.AutoRainbowSeed then
                isLockValid = true
            elseif activeTargetType == "Gold" and FarmSettings.AutoGoldSeed then
                isLockValid = true
            elseif activeTargetType == "Steal" and FarmSettings.AutoSteal and FarmSettings.TeleportSteal then
                local timeNow = Lighting.ClockTime
                if timeNow >= 18 or timeNow <= 6 then
                    isLockValid = true
                end
            end
        end
    end

    if isLockValid then
        local character = localPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = activeTargetData.Part.CFrame + Vector3.new(0, 3, 0)
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end
    else
        activeTargetData = nil
        activeTargetType = nil
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        local activeHarvestSteal = FarmSettings.AutoHarvest or FarmSettings.AutoSteal
        local activeSeeds = FarmSettings.AutoGoldSeed or FarmSettings.AutoRainbowSeed
        if not activeHarvestSteal and not activeSeeds then continue end
        
        local newCache = {}
        local myName, myDisplayName, myUserId = localPlayer.Name, localPlayer.DisplayName, tostring(localPlayer.UserId)

        local function processPrompt(obj, plotOwner, isMyPlot)
            if not obj:IsA("ProximityPrompt") then return end
            
            local nameLower = string.lower(obj.Name)
            local actionLower = string.lower(obj.ActionText)
            local objectLower = string.lower(obj.ObjectText)
            
            local isHarvest = (nameLower == "harvest" or actionLower == "harvest" or objectLower == "harvest")
            local isSteal = (nameLower == "steal" or actionLower == "steal" or objectLower == "steal")
            local isGold = (string.find(objectLower, "gold", 1, true) and string.find(actionLower, "claim", 1, true)) or string.find(nameLower, "gold", 1, true)
            local isRainbow = (string.find(objectLower, "rainbow", 1, true) and string.find(actionLower, "claim", 1, true)) or string.find(nameLower, "rainbow", 1, true)

            if isHarvest or isSteal or isGold or isRainbow then
                -- [MỚI] Bóc Data từ Model mẹ để nạp cho Remote Event
                local model = obj:FindFirstAncestorWhichIsA("Model")
                local ownerUserId = model and tonumber(model:GetAttribute("UserId")) or nil
                local plantId = model and model:GetAttribute("PlantId") or nil
                local fruitId = model and model:GetAttribute("FruitId") or ""

                table.insert(newCache, {
                    Prompt = obj,
                    Part = obj.Parent,
                    PlotOwner = plotOwner,
                    IsMyPlot = isMyPlot,
                    IsHarvest = isHarvest,
                    IsSteal = isSteal,
                    IsGoldSeed = isGold,
                    IsRainbowSeed = isRainbow,
                    OwnerUserId = ownerUserId,
                    PlantId = plantId,
                    FruitId = fruitId
                })
            end
        end

        local gardens = Workspace:FindFirstChild("Gardens")
        if gardens then
            for _, plot in pairs(gardens:GetChildren()) do
                local plotOwner = getPlotOwner(plot)
                local isMyPlot = (plotOwner == myName or plotOwner == myDisplayName or plotOwner == myUserId)
                
                for _, obj in pairs(plot:GetDescendants()) do
                    processPrompt(obj, plotOwner, isMyPlot)
                end
            end
        end

        if activeSeeds then
            for _, child in pairs(Workspace:GetChildren()) do
                if child ~= gardens and child.Name ~= "Players" and child.Name ~= "Terrain" and child ~= Camera then
                    for _, obj in pairs(child:GetDescendants()) do
                        processPrompt(obj, nil, false)
                    end
                end
            end
        end

        cachedPrompts = newCache
    end
end)

-- [LOOP 2] Thực thi click và duy trì khóa mục tiêu trộm/hạt hiếm
task.spawn(function()
    while task.wait(0.05) do
        local activeHarvestSteal = FarmSettings.AutoHarvest or FarmSettings.AutoSteal
        local activeSeeds = FarmSettings.AutoGoldSeed or FarmSettings.AutoRainbowSeed
        if not activeHarvestSteal and not activeSeeds then continue end
        
        local character = localPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        
        local hrpPos = hrp.Position
        local timeNow = os.clock()
        
        -- 1. THỰC THI MỤC TIÊU ĐANG BỊ KHÓA BẰNG REMOTE
        if activeTargetData then
            task.spawn(executeActionDirectly, activeTargetData)
            continue
        end

        -- Nếu không có mục tiêu khóa, tiến hành tìm mục tiêu mới gần nhất
        local canHarvest = FarmSettings.AutoHarvest and (timeNow - lastHarvestTime >= FarmSettings.HarvestSpeed)
        local canSteal = FarmSettings.AutoSteal and (timeNow - lastStealTime >= FarmSettings.StealSpeed)
        local isNight = (Lighting.ClockTime >= 18 or Lighting.ClockTime <= 6)
        local isInventoryFull = (getInventoryCount() >= FarmSettings.MaxCapacity)

        local activePlayersPos = {}
        if canSteal and isNight then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pPos = p.Character.HumanoidRootPart.Position
                    activePlayersPos[p.Name] = pPos
                    activePlayersPos[p.DisplayName] = pPos
                    activePlayersPos[tostring(p.UserId)] = pPos
                end
            end
        end

        local closestRainbowData, closestRainbowDist = nil, math.huge
        local closestGoldData, closestGoldDist = nil, math.huge
        local closestStealData, closestStealDist = nil, (FarmSettings.TeleportSteal and math.huge or FarmSettings.StealRadius)
        local closestHarvestData, closestHarvestDist = nil, FarmSettings.HarvestRadius 

        for i = 1, #cachedPrompts do
            local data = cachedPrompts[i]
            if not data.Prompt or not data.Part or not data.Prompt.Parent or not data.Prompt.Enabled then continue end
            
            local distance = (hrpPos - data.Part.Position).Magnitude

            if FarmSettings.AutoRainbowSeed and data.IsRainbowSeed and distance < closestRainbowDist then
                closestRainbowData = data
                closestRainbowDist = distance
            end

            if FarmSettings.AutoGoldSeed and data.IsGoldSeed and distance < closestGoldDist then
                closestGoldData = data
                closestGoldDist = distance
            end

            if canSteal and data.IsSteal and not data.IsMyPlot and distance < closestStealDist and isNight then
                local ownerCurrentPos = data.PlotOwner and activePlayersPos[data.PlotOwner]
                local isOwnerHome = ownerCurrentPos and ((ownerCurrentPos - data.Part.Position).Magnitude <= 50)
                
                if not isOwnerHome then
                    closestStealData = data
                    closestStealDist = distance
                end
            end

            if canHarvest and data.IsHarvest and data.IsMyPlot and distance < closestHarvestDist and not isInventoryFull then
                closestHarvestData = data
                closestHarvestDist = distance
            end
        end

        -- 2. GÁN MỤC TIÊU MỚI VÀO BỘ KHÓA CỨNG (Theo thứ tự ưu tiên)
        if closestRainbowData then
            activeTargetData = closestRainbowData
            activeTargetType = "Rainbow"
            task.spawn(executeActionDirectly, activeTargetData)
            
        elseif closestGoldData then
            activeTargetData = closestGoldData
            activeTargetType = "Gold"
            task.spawn(executeActionDirectly, activeTargetData)
            
        elseif closestStealData and FarmSettings.TeleportSteal then
            activeTargetData = closestStealData
            activeTargetType = "Steal"
            task.spawn(executeActionDirectly, activeTargetData)
            lastStealTime = timeNow
            
        -- Trường hợp Steal không dùng Teleport (Chỉ đứng gần bấm/Fire)
        elseif closestStealData and not FarmSettings.TeleportSteal then
            task.spawn(executeActionDirectly, closestStealData)
            lastStealTime = timeNow
        end

        -- Auto Harvest (Chạy song song bằng bán kính)
        if closestHarvestData then
            task.spawn(executeActionDirectly, closestHarvestData)
            lastHarvestTime = timeNow
        end
    end
end)

-- Bảng quản lý trạng thái của các UI và cài đặt tự động bán
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

-- Tải module Networking 1 lần duy nhất
local Networking = nil
pcall(function()
    Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
end)

-- ==================== [TỐI ƯU 1] CACHE WEATHER DATA ====================
-- Thay vì quét toàn bộ thư mục mỗi 0.5s, ta chỉ tìm 1 lần và lưu lại vào biến cache
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

-- ==================== VÒNG LẶP AUTO SELL ====================
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
    Title = "loc:SeclectSeed",
    Desc = "loc:SeclectSeedDesc",
    Values = ShopConfig.Seed.All,
    Value = ShopConfig.Seed.Selected,
    Flag = "SeclectSeed",
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
    Title = "loc:SeclectGear",
    Desc = "loc:SeclectGearDesc",
    Flag = "SeclectGear",
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
                if currentMoney >= price then
                    local stockItem = ShopConfig.Seed.Stock:FindFirstChild(itemName)
                    if stockItem and stockItem.Value > 0 then
                        pcall(function() ShopConfig.Net.SeedShop.PurchaseSeed:Fire(itemName) end)
                        currentMoney = currentMoney - price
                        task.wait(0.1)
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

MyUIElements.Power:Toggle({
    Title = "loc:Noclip",
    Desc = "loc:NoclipDesc",
    Flag = "Noclip",
    Value = false,
    Callback = function(state) 
        Toggles.Noclip = state
    end
})

MyUIElements.Power:Toggle({
    Title = "loc:InfJump",
    Desc = "loc:InfJumpDesc",
    Flag = "InfJump",
    Value = false,
    Callback = function(state) 
        Toggles.InfJump = state
    end
})

MyUIElements.Power:Toggle({
    Title = "loc:ForceSpeed",
    Desc = "loc:ForceSpeedDesc",
    Flag = "ForceSpeed",
    Value = false,
    Callback = function(state) 
        Toggles.Speed = state
    end
})

MyUIElements.Power:Slider({
    Title = "loc:SetSpeed",
    Desc = "loc:SetSpeedDesc",
    Flag = "SetSpeed",
    Step = 1,
    Value = { Min = 1, Max = 300, Default = 70 },
    Callback = function(value)
        Values.Speed = value
    end
})

MyUIElements.Power:Toggle({
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

MyUIElements.Power:Slider({
    Title = "loc:SetPower",
    Desc = "loc:SetPowerDesc",
    Flag = "SetPower",
    Step = 1,
    Value = { Min = 1, Max = 300, Default = 70 },
    Callback = function(value)
        Values.Jump = value
    end
})

MyUIElements.Power:Toggle({
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

MyUIElements.Power:Slider({
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

-- [ LOGIC ] Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Toggles.InfJump and playerCharacter then
        local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- [ LOGIC ] Force Speed & Khóa vị trí bệ đỡ (Theo trục X, Z) + Bảo hiểm chống lọt sàn
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

-- [ LOGIC ] Jump Power Loop
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
    Title = "loc:SeclectLanguage",
    Desc = "loc:SeclectLanguageDesc",
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
