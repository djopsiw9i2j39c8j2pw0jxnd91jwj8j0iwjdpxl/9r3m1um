local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer
local countryCode = "US"

local success, result = pcall(function()
    return LocalizationService:GetCountryRegionForPlayerAsync(player)
end)

if success and result then
    countryCode = result
end

if countryCode == "VN" then
    player:Kick("Script Đã Tạm Dừng Hoạt Động")
else
    player:Kick("The Script Has Paused")
end
