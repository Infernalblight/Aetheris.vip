local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Infernalblight/Aetheris.vip/refs/heads/main/Roblox/Script/Mobile.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Infernalblight/Aetheris.vip/refs/heads/main/Roblox/Script/Pc.lua"))()
end
