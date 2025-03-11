local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Aetheris.vip", "Default")

local GameBattletab = DrRayLibrary.newTab("Admin+", "")

GameBattletab.newButton("Admin", "Gives access to admin menu", function()
    game.Players.LocalPlayer.PlayerGui.Settings.Settings.Visible = true
end)

GameBattletab.newButton("no cooldown", "No cooldown on moves", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:FindFirstChild("NoCoolDown")

    if remoteEvent and remoteEvent:IsA("RemoteEvent") then
        remoteEvent:FireServer()
    else
        warn("NoCoolDown RemoteEvent not found!")
    end
end)
