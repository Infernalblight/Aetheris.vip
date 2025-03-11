local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Aetheris.vip", "Default")

if game.PlaceId == 72857483350036 then
local GameBattletab = DrRayLibrary.newTab("Admin+", "")

GameBattletab.newButton("Admin", "Gives access to admin menu", function()
    game.Players.LocalPlayer.PlayerGui.Settings.Settings.Visible = true
end)
end

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Aimbottab = DrRayLibrary.newTab("Aimbot", "")

local AimbotEnabled = false
local TargetPart = "Head"
local FovVisible = true
local FovSize = 100

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(TargetPart) then
            local part = player.Character[TargetPart]
            local screenPosition, onScreen = Camera:WorldToViewportPoint(part.Position)
            local mousePosition = UserInputService:GetMouseLocation()
            local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
            
            if onScreen and distance < FovSize then
                closestPlayer = part
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end

Aimbottab.newToggle("Aimbot", "Toggles aimbot.", true, function(toggleState)
    AimbotEnabled = toggleState
end)

Aimbottab.newDropdown("Target", "Select one of these options!", {"Head", "Torso", "Random"}, function(selectedOption)
    if selectedOption == "Random" then
        TargetPart = math.random(1, 2) == 1 and "Head" or "Torso"
    else
        TargetPart = selectedOption
    end
end)

Aimbottab.newToggle("Fov", "Toggles Fov visibility", true, function(toggleState)
    FovVisible = toggleState
end)

Aimbottab.newSlider("Fov Size", "Changes Fov Size", 1000, false, function(num)
    FovSize = num
end)

if UserInputService.TouchEnabled then
    local AimbotButton = Instance.new("TextButton")
    AimbotButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    AimbotButton.Position = UDim2.new(0.8, 0, 0.8, 0)
    AimbotButton.Text = "Toggle Aimbot"
    AimbotButton.Parent = game.CoreGui
    AimbotButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

    AimbotButton.MouseButton1Click:Connect(function()
        AimbotEnabled = not AimbotEnabled
        AimbotButton.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
else
    Aimbottab.newKeybind("Keybind", "Key to hold to lock on", function(key)
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode[key] then
                AimbotEnabled = true
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode[key] then
                AimbotEnabled = false
            end
        end)
    end)
end

RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local target = getClosestPlayer()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)
