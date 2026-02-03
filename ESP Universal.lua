--[[ Universal Hub LMG2L - Hitbox Funcional + ESP Really Blue ]]--

local LMG2L = {}

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ScreenGui
LMG2L["ScreenGui"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
LMG2L["ScreenGui"].Name = "UniversalHub"
LMG2L["ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- MainFrame
local main = Instance.new("Frame", LMG2L["ScreenGui"])
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0.15,0)
header.BackgroundColor3 = Color3.fromRGB(0,0,0)
header.BorderSizePixel = 0
Instance.new("UICorner", header)

-- Header inner frame
local headerInner = Instance.new("Frame", header)
headerInner.Size = UDim2.new(0.96,0,0.77,0)
headerInner.Position = UDim2.new(0.02,0,0.11,0)
headerInner.BackgroundColor3 = Color3.fromRGB(84,84,84)
headerInner.BorderSizePixel = 0
Instance.new("UICorner", headerInner)

-- Title
local title = Instance.new("TextLabel", headerInner)
title.Size = UDim2.new(0.4,0,1,0)
title.Position = UDim2.new(0.01,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Universal Hub"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.DenkOne
title.TextSize = 30
title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local toggleBtn = Instance.new("TextButton", header)
toggleBtn.Size = UDim2.new(0.13,0,0.7,0)
toggleBtn.Position = UDim2.new(0.83,0,0.14,0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
toggleBtn.BackgroundTransparency = 0.8
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Text = "-"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 35
Instance.new("UICorner", toggleBtn)

-- Open button when minimized
local openBtn = Instance.new("TextButton", LMG2L["ScreenGui"])
openBtn.Size = UDim2.new(0,50,0,50)
openBtn.Position = UDim2.new(0,10,0,10)
openBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
openBtn.TextColor3 = Color3.fromRGB(255,255,255)
openBtn.Text = "+"
openBtn.Visible = false
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextScaled = true

toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)
openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn.Visible = false
end)

-- Left panel with tabs
local leftFrame = Instance.new("Frame", main)
leftFrame.Size = UDim2.new(0.32,0,0.79,0)
leftFrame.Position = UDim2.new(0.02,0,0.165,0)
leftFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
leftFrame.BorderSizePixel = 0
Instance.new("UICorner", leftFrame)

-- Tab buttons
local hitboxBtn = Instance.new("TextButton", leftFrame)
hitboxBtn.Size = UDim2.new(0.87,0,0.16,0)
hitboxBtn.Position = UDim2.new(0.07,0,0.03,0)
hitboxBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
hitboxBtn.BackgroundTransparency = 0.8
hitboxBtn.TextColor3 = Color3.fromRGB(255,255,255)
hitboxBtn.Text = "Hitbox"
hitboxBtn.Font = Enum.Font.DenkOne
hitboxBtn.TextSize = 30
Instance.new("UICorner", hitboxBtn)

local espBtn = Instance.new("TextButton", leftFrame)
espBtn.Size = UDim2.new(0.87,0,0.16,0)
espBtn.Position = UDim2.new(0.07,0,0.22,0)
espBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
espBtn.BackgroundTransparency = 0.8
espBtn.TextColor3 = Color3.fromRGB(255,255,255)
espBtn.Text = "ESP"
espBtn.Font = Enum.Font.DenkOne
espBtn.TextSize = 30
Instance.new("UICorner", espBtn)

-- Right frame to hold tab content
local rightFrame = Instance.new("Frame", main)
rightFrame.Size = UDim2.new(0.61,0,0.79,0)
rightFrame.Position = UDim2.new(0.37,0,0.165,0)
rightFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
rightFrame.BorderSizePixel = 0
Instance.new("UICorner", rightFrame)

-- Hitbox Content
local hitboxContent = Instance.new("Frame", rightFrame)
hitboxContent.Size = UDim2.new(1,0,1,0)
hitboxContent.BackgroundTransparency = 1
hitboxContent.Visible = true

-- ESP Content
local espContent = Instance.new("Frame", rightFrame)
espContent.Size = UDim2.new(1,0,1,0)
espContent.BackgroundTransparency = 1
espContent.Visible = false

hitboxBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = true
    espContent.Visible = false
end)
espBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = true
end)

-- ================= Hitbox Script (FUNCIONAL) =================
local HeadSize = 10
local HitboxEnabled = false
local PlayerList = {}

-- TextBox for head size
local headBox = Instance.new("TextBox", hitboxContent)
headBox.Size = UDim2.new(0.9,0,0,30)
headBox.Position = UDim2.new(0.05,0,0,10)
headBox.BackgroundColor3 = Color3.fromRGB(84,84,84)
headBox.TextColor3 = Color3.fromRGB(255,255,255)
headBox.Font = Enum.Font.DenkOne
headBox.TextSize = 18
headBox.Text = tostring(HeadSize)
Instance.new("UICorner", headBox)

-- Toggle Hitbox
local toggleHitbox = Instance.new("TextButton", hitboxContent)
toggleHitbox.Size = UDim2.new(0.9,0,0,30)
toggleHitbox.Position = UDim2.new(0.05,0,0,50)
toggleHitbox.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggleHitbox.TextColor3 = Color3.fromRGB(255,255,255)
toggleHitbox.Font = Enum.Font.DenkOne
toggleHitbox.TextSize = 18
toggleHitbox.Text = "Enable Hitbox"
Instance.new("UICorner", toggleHitbox)

-- Update PlayerList
local function updatePlayers()
    PlayerList = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(PlayerList, p)
        end
    end
end

updatePlayers()
Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)

-- Update HeadSize from TextBox
headBox.FocusLost:Connect(function()
    local sz = tonumber(headBox.Text)
    if sz then
        HeadSize = sz
    else
        headBox.Text = tostring(HeadSize)
    end
end)

-- Toggle Hitbox
toggleHitbox.MouseButton1Click:Connect(function()
    HitboxEnabled = not HitboxEnabled
    toggleHitbox.Text = HitboxEnabled and "Disable Hitbox" or "Enable Hitbox"
end)

-- Apply Hitbox
RunService.RenderStepped:Connect(function()
    if HitboxEnabled then
        for _, p in pairs(PlayerList) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                hrp.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
                hrp.BrickColor = BrickColor.new("Really blue")
                hrp.Material = Enum.Material.Neon
                hrp.CanCollide = false
            end
        end
    end
end)
