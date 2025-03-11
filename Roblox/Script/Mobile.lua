local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Aetheris.vip", "Default")

if game.PlaceId == 72857483350036 then
local GameBattletab = DrRayLibrary.newTab("Admin+", "")

GameBattletab.newButton("Admin", "Gives access to admin menu", function()
    game.Players.LocalPlayer.PlayerGui.Settings.Settings.Visible = true
end)
end

local Aimbottab = DrRayLibrary.newTab("Aimbot", "")
