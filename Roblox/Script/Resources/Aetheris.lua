local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    print(1 + 1)
else
    print(2 + 2)
end
