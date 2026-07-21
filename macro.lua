--// SPEED macro (ROBLOX)
--// Official version - Compact Toggle Button
 
-- Initial Configuration
local maxSpeed = 3 
local enabled = false
 
local player = game.Players.LocalPlayer

-- Clean up old interfaces
if player.PlayerGui:FindFirstChild("SpeedGhostsGui") then
    player.PlayerGui["SpeedGhostsGui"]:Destroy()
end
if player.PlayerGui:FindFirstChild("SpeedMacroGui") then
    player.PlayerGui["SpeedMacroGui"]:Destroy()
end
 
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedMacroGui"
screenGui.ResetOnSpawn = false 
screenGui.Parent = player.PlayerGui
 
-- Compact main button (Combined frame and button for easier dragging)
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 130, 0, 50) -- Compact size, easy to tap
toggleButton.Position = UDim2.new(0, 30, 0, 150)
toggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Dark sleek background
toggleButton.BorderSizePixel = 0
toggleButton.Text = "Macro" -- Initial text
toggleButton.TextColor3 = Color3.fromRGB(20, 110, 255) -- Bright blue
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 22
toggleButton.Active = true
toggleButton.Draggable = true -- Allows smooth dragging anywhere on the button
toggleButton.Parent = screenGui
 
-- Smooth rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12) -- Rounded shape, modern look
uiCorner.Parent = toggleButton

-- Subtle stroke border
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(20, 110, 255)
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = toggleButton
 
toggleButton.ZIndex = 10
screenGui.DisplayOrder = 1000
 
toggleButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        toggleButton.Text = "Unenabled"
        toggleButton.BackgroundColor3 = Color3.fromRGB(20, 110, 255) -- Turns blue when ON
        toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Text turns white
    else
        toggleButton.Text = "Enabled"
        toggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Turns dark when OFF
        toggleButton.TextColor3 = Color3.fromRGB(20, 110, 255) -- Text turns blue
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
        end
    end
end)
 
game:GetService("RunService").RenderStepped:Connect(function()
    if enabled and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = maxSpeed
    end
end)
