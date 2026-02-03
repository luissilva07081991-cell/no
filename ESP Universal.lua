--[[ Universal Hub LMG2L - Completo e funcional (ESP Really Blue + Hitbox Tab) ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// ScreenGui
LMG2L["ScreenGui"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
LMG2L["ScreenGui"].Name = "UniversalHub"
LMG2L["ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--// MainFrame
local main = Instance.new("Frame", LMG2L["ScreenGui"])
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

--// Header
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

-- ================= Hitbox Script inside Hitbox Tab =================
local headSize = 10
local hitboxEnabled = false
local playersList = {}

-- UI inside hitboxContent
local textBox = Instance.new("TextBox", hitboxContent)
textBox.Size = UDim2.new(0.9,0,0,30)
textBox.Position = UDim2.new(0.05,0,0,10)
textBox.BackgroundColor3 = Color3.fromRGB(84,84,84)
textBox.TextColor3 = Color3.fromRGB(255,255,255)
textBox.Font = Enum.Font.DenkOne
textBox.TextSize = 18
textBox.Text = tostring(headSize)
Instance.new("UICorner", textBox)

local toggleHitboxBtn = Instance.new("TextButton", hitboxContent)
toggleHitboxBtn.Size = UDim2.new(0.9,0,0,30)
toggleHitboxBtn.Position = UDim2.new(0.05,0,0,50)
toggleHitboxBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggleHitboxBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleHitboxBtn.Font = Enum.Font.DenkOne
toggleHitboxBtn.TextSize = 18
toggleHitboxBtn.Text = "Enable Hitbox"
Instance.new("UICorner", toggleHitboxBtn)

-- Function to populate player list
local function updatePlayers()
    playersList = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(playersList, p)
        end
    end
end

updatePlayers()
Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)

-- Update head size from TextBox
textBox.FocusLost:Connect(function()
    local size = tonumber(textBox.Text)
    if size then
        headSize = size
    else
        textBox.Text = tostring(headSize)
    end
end)

-- Toggle Hitbox
toggleHitboxBtn.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    toggleHitboxBtn.Text = hitboxEnabled and "Disable Hitbox" or "Enable Hitbox"
end)

-- Apply hitbox
RunService.RenderStepped:Connect(function()
    if hitboxEnabled then
        for _, p in pairs(playersList) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                hrp.Size = Vector3.new(headSize, headSize, headSize)
                hrp.BrickColor = BrickColor.new("Really blue")
                hrp.Material = Enum.Material.Neon
                hrp.CanCollide = false
            end
        end
    end
end)

-- ================= ESP Tab Logic =================
local ESPSettings = {Box=false,Outline=false,Name=false,Distance=false,Teammates=false}
local ESPElements = {}

-- Function to create toggles in ESP tab
local function createESPUI(parent)
    local y = 10
    for k,v in pairs({"Box","Outline","Name","Distance","Teammates"}) do
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(0.95,0,0,30)
        btn.Position = UDim2.new(0.025,0,0,y)
        btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
        btn.BackgroundTransparency = 0.5
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.DenkOne
        btn.TextSize = 14
        btn.Text = v.." OFF"
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(function()
            ESPSettings[v] = not ESPSettings[v]
            btn.Text = v.." "..(ESPSettings[v] and "ON" or "OFF")
        end)
        table.insert(ESPElements, btn)
        y = y + 40
    end
end

createESPUI(espContent)

-- ESP Logic
local ESP = {}
local function shouldESP(p)
    if p==LocalPlayer then return false end
    if not ESPSettings.Teammates then
        if LocalPlayer.Team and p.Team and LocalPlayer.Team==p.Team then return false end
    end
    return true
end

local function getColor(p)
    return Color3.fromRGB(0,0,255) -- Really Blue
end

local function setupESP(p)
    if ESP[p] then return end
    local box = Instance.new("SelectionBox")
    box.LineThickness = 0.05
    box.SurfaceTransparency = 1
    box.Parent = workspace

    local hl = Instance.new("Highlight")
    hl.FillTransparency = 1
    hl.Parent = workspace

    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0,200,0,40)
    bb.StudsOffset = Vector3.new(0,3,0)
    bb.AlwaysOnTop = true
    bb.Parent = workspace

    local txt = Instance.new("TextLabel", bb)
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.Gotham
    txt.TextSize = 13

    ESP[p] = {Box=box,HL=hl,BB=bb,TXT=txt}
end

for _,p in pairs(Players:GetPlayers()) do
    if p~=LocalPlayer then setupESP(p) end
end
Players.PlayerAdded:Connect(setupESP)
Players.PlayerRemoving:Connect(function(p)
    if ESP[p] then for _,v in pairs(ESP[p]) do v:Destroy() end ESP[p]=nil end
end)

RunService.RenderStepped:Connect(function()
    for p,e in pairs(ESP) do
        local c = p.Character
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        local hum = c and c:FindFirstChildOfClass("Humanoid")
        local isVisible = hum and hum.Health>0 and hrp and c and shouldESP(p)
        if isVisible then
            local col = getColor(p)
            e.Box.Color3 = col
            e.HL.OutlineColor = col
            e.TXT.TextColor3 = col

            e.Box.Visible = ESPSettings.Box
            e.Box.Adornee = ESPSettings.Box and c or nil

            e.HL.Enabled = ESPSettings.Outline
            e.HL.Adornee = ESPSettings.Outline and c or nil

            local showBB = ESPSettings.Name or ESPSettings.Distance
            e.BB.Enabled = showBB
            e.BB.Adornee = showBB and hrp or nil

            if showBB then
                local t = ""
                if ESPSettings.Name then t=p.Name end
                if ESPSettings.Distance then
                    local dist = math.floor((Camera.CFrame.Position-hrp.Position).Magnitude)
                    if ESPSettings.Name then t=t.." ["..dist.." studs]" else t=dist.." studs" end
                end
                e.TXT.Text = t
            end
        else
            e.Box.Visible=false
            e.Box.Adornee=nil
            e.HL.Enabled=false
            e.HL.Adornee=nil
            e.BB.Enabled=false
            e.BB.Adornee=nil
        end
    end
end)

return LMG2L["ScreenGui"], require
