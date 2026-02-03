--// Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer


---

-- GUI BASE

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer.PlayerGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.38,0.55) -- largura menor, altura igual
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)


---

-- SIDEBAR

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.fromScale(0.28,1)
sidebar.BackgroundColor3 = Color3.fromRGB(15,15,15)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,18)

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0,10)


---

-- CONTEÚDO

local content = Instance.new("Frame", main)
content.Size = UDim2.fromScale(0.72,1)
content.Position = UDim2.fromScale(0.28,0)
content.BackgroundColor3 = Color3.fromRGB(25,25,25)
content.BorderSizePixel = 0
Instance.new("UICorner", content).CornerRadius = UDim.new(0,18)

local layout = Instance.new("UIListLayout", content)
layout.Padding = UDim.new(0,12)


---

-- FUNÇÕES DE UI

local function newPage()
local p = Instance.new("Frame", content)
p.Size = UDim2.fromScale(1,1)
p.BackgroundTransparency = 1
p.Visible = false

local layout = Instance.new("UIListLayout", p)  
layout.Padding = UDim.new(0,10)  

return p

end

local function createTab(name)
local btn = Instance.new("TextButton", sidebar)
btn.Size = UDim2.new(1,-20,0,50)
btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
btn.Text = name
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

local page = newPage()  

btn.MouseButton1Click:Connect(function()  
	for _,v in pairs(content:GetChildren()) do  
		if v:IsA("Frame") then v.Visible = false end  
	end  
	page.Visible = true  
end)  

return page

end

local function createToggle(parent,text,callback)
local frame = Instance.new("Frame", parent)
frame.Size = UDim2.new(1,-40,0,55)
frame.Position = UDim2.new(0,20,0,0)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local label = Instance.new("TextLabel", frame)  
label.Size = UDim2.fromScale(0.6,1)  
label.BackgroundTransparency = 1  
label.Text = text  
label.TextColor3 = Color3.new(1,1,1)  
label.Font = Enum.Font.Gotham  

local btn = Instance.new("TextButton", frame)  
btn.Size = UDim2.fromOffset(70,28)  
btn.Position = UDim2.new(1,-90,0.5,-14)  
btn.BackgroundColor3 = Color3.fromRGB(60,60,60)  
btn.Text = ""  
Instance.new("UICorner", btn).CornerRadius = UDim.new(1,0)  

local state=false  

btn.MouseButton1Click:Connect(function()  
	state = not state  
	btn.BackgroundColor3 = state and Color3.fromRGB(0,170,255) or Color3.fromRGB(60,60,60)  
	callback(state)  
end)

end

local function createBox(parent,text,default)
local frame = Instance.new("Frame", parent)
frame.Size = UDim2.new(1,-40,0,55)
frame.Position = UDim2.new(0,20,0,0)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local label = Instance.new("TextLabel", frame)  
label.Size = UDim2.new(0.6,0,1,0)  
label.BackgroundTransparency = 1  
label.Text = text  
label.TextColor3 = Color3.new(1,1,1)  
label.Font = Enum.Font.Gotham  

local box = Instance.new("TextBox", frame)  
box.Size = UDim2.new(0.3,0,0.7,0)  
box.Position = UDim2.new(0.68,0,0.15,0)  
box.BackgroundColor3 = Color3.fromRGB(50,50,50)  
box.TextColor3 = Color3.new(1,1,1)  
box.Text = default or ""  
box.ClearTextOnFocus=false  
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)  

return box

end


---

-- ABAS

local hitboxPage = createTab("Hitbox")
local espPage = createTab("ESP")
hitboxPage.Visible = true


---

-- HITBOX (novo script)

local HeadSize = 10
local hitboxEnabled = false
local playersList = {}

-- Input box para tamanho
local sizeBox = createBox(hitboxPage,"Tamanho do Hitbox",tostring(HeadSize))
sizeBox.FocusLost:Connect(function()
local val = tonumber(sizeBox.Text)
if val then HeadSize = val end
end)

-- Botão ON/OFF Hitbox
local hitboxBtn = Instance.new("TextButton", hitboxPage)
hitboxBtn.Size = UDim2.new(0.5,0,0,40)
hitboxBtn.Position = UDim2.new(0.25,0,0.4,0)
hitboxBtn.Text = "Enable Hitbox"
hitboxBtn.Font = Enum.Font.GothamBold
hitboxBtn.TextColor3 = Color3.new(1,1,1)
hitboxBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", hitboxBtn).CornerRadius = UDim.new(0,12)

hitboxBtn.MouseButton1Click:Connect(function()
hitboxEnabled = not hitboxEnabled
hitboxBtn.Text = hitboxEnabled and "Disable Hitbox" or "Enable Hitbox"
end)

-- Atualiza lista de players
local function updatePlayers()
playersList = {}
for _,plr in pairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
table.insert(playersList,plr)
end
end
end

Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)
RunService.RenderStepped:Connect(updatePlayers)

-- Aplicar hitbox
RunService.RenderStepped:Connect(function()
if hitboxEnabled then
for _,plr in pairs(playersList) do
if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
local root = plr.Character.HumanoidRootPart
root.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
root.Transparency = 0
root.BrickColor = BrickColor.new("Medium stone grey")
root.Material = Enum.Material.Plastic
root.CanCollide = true
end
end
end
end)


---

-- ESP

local espEnabled=false
local MAX_DISTANCE=150
local highlights={}

local function removeESP(plr)
if highlights[plr] then
highlights[plr]:Destroy()
highlights[plr]=nil
end
end

local function createESP(plr,char)
if highlights[plr] then return end

local h=Instance.new("Highlight")  
h.Adornee=char  
h.FillColor=Color3.fromRGB(0,170,255)  
h.OutlineColor=h.FillColor  
h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop  
h.Parent=char  

highlights[plr]=h

end

local espToggle = createToggle(espPage,"Ativar ESP",function(state)
espEnabled=state
if not state then
for p in pairs(highlights) do removeESP(p) end
end
end)

RunService.RenderStepped:Connect(function()
if not espEnabled then return end
if not LocalPlayer.Character then return end

local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
if not root then return end  

for _,plr in pairs(Players:GetPlayers()) do  
	if plr~=LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then  
		local dist=(plr.Character.HumanoidRootPart.Position-root.Position).Magnitude  
		if dist<=MAX_DISTANCE then  
			createESP(plr,plr.Character)  
		else  
			removeESP(plr)  
		end  
	end  
end

end)


---

-- MINIMIZAR / ABRIR (estilo imagem)

local originalSize = main.Size
local originalPos = main.Position
local isOpen = true

-- botão "-"
local minimizeBtn = Instance.new("TextButton", main)
minimizeBtn.Size = UDim2.fromOffset(32,32)
minimizeBtn.Position = UDim2.new(1,-40,0,8)
minimizeBtn.AnchorPoint = Vector2.new(0,0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(1,0)

-- botão "+"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.fromOffset(32,32)
openBtn.Position = UDim2.fromScale(0.02,0.85)
openBtn.Text = "+"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 18
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
openBtn.Visible = false
openBtn.BorderSizePixel = 0
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)
openBtn.Active = true
openBtn.Draggable = true

local tweenInfo = TweenInfo.new(
0.25,
Enum.EasingStyle.Quad,
Enum.EasingDirection.Out
)

local function minimizeHub()
if not isOpen then return end
isOpen = false

local tween = TweenService:Create(main, tweenInfo, {  
	Size = UDim2.fromScale(0,0),  
	Position = UDim2.fromScale(0.5,0.5),  
	BackgroundTransparency = 1  
})  
tween:Play()  
tween.Completed:Wait()  
main.Visible = false  
openBtn.Visible = true

end

local function openHub()
if isOpen then return end
isOpen = true

main.Size = UDim2.fromScale(0,0)  
main.Visible = true  
main.BackgroundTransparency = 1  

local tween = TweenService:Create(main, tweenInfo, {  
	Size = originalSize,  
	Position = originalPos,  
	BackgroundTransparency = 0  
})  
tween:Play()  
openBtn.Visible = false

end

minimizeBtn.MouseButton1Click:Connect(minimizeHub)
openBtn.MouseButton1Click:Connect(openHub)
