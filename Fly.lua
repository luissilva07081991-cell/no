-- Fly UI Compact
local P=game:GetService("Players").LocalPlayer
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local TS=game:GetService("TweenService")

local C=P.Character or P.CharacterAdded:Wait()
local H=C:WaitForChild("Humanoid")
local R=C:WaitForChild("HumanoidRootPart")

local fly=false
local speed=60
local bv,bg

local function start()
	bv=Instance.new("BodyVelocity",R)
	bv.MaxForce=Vector3.new(1e5,1e5,1e5)
	bg=Instance.new("BodyGyro",R)
	bg.MaxTorque=Vector3.new(1e5,1e5,1e5)
	bg.P=1e4
	H.PlatformStand=true

	RS:BindToRenderStep("FLY",0,function()
		local cam=workspace.CurrentCamera
		local v=Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then v+=cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then v-=cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then v-=cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then v+=cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space) then v+=Vector3.new(0,1,0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then v-=Vector3.new(0,1,0) end
		bv.Velocity=v.Magnitude>0 and v.Unit*speed or Vector3.zero
		bg.CFrame=cam.CFrame
	end)
end

local function stop()
	fly=false
	H.PlatformStand=false
	RS:UnbindFromRenderStep("FLY")
	if bv then bv:Destroy() end
	if bg then bg:Destroy() end
end

-- UI
local g=Instance.new("ScreenGui",P.PlayerGui)
g.ResetOnSpawn=false
local f=Instance.new("Frame",g)
f.Size=UDim2.new(0,230,0,240)
f.Position=UDim2.new(0,20,0.35,0)
f.BackgroundColor3=Color3.fromRGB(20,20,25)
f.Active=true
f.Draggable=true
Instance.new("UICorner",f).CornerRadius=UDim.new(0,16)
Instance.new("UIStroke",f).Color=Color3.fromRGB(80,80,90)

local function btn(t,y)
	local b=Instance.new("TextButton",f)
	b.Size=UDim2.new(1,-30,0,38)
	b.Position=UDim2.new(0,15,0,y)
	b.Text=t
	b.Font=Enum.Font.GothamBold
	b.TextSize=14
	b.TextColor3=Color3.new(1,1,1)
	b.BackgroundColor3=Color3.fromRGB(45,45,55)
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
	return b
end

local flyB=btn("🟢 ATIVAR FLY",20)
local up=btn("➕ VELOCIDADE +",70)
local down=btn("➖ VELOCIDADE -",120)
local min=btn("📦 MINIMIZAR",170)

local close=Instance.new("TextButton",f)
close.Size=UDim2.new(0,28,0,28)
close.Position=UDim2.new(1,-38,0,10)
close.Text="✖"
close.BackgroundTransparency=1
close.TextColor3=Color3.fromRGB(255,90,90)

flyB.MouseButton1Click:Connect(function()
	fly=not fly
	flyB.Text=fly and "🔴 DESATIVAR FLY" or "🟢 ATIVAR FLY"
	if fly then start() else stop() end
end)

up.MouseButton1Click:Connect(function() speed+=10 end)
down.MouseButton1Click:Connect(function() speed=math.max(20,speed-10) end)

local m=false
min.MouseButton1Click:Connect(function()
	m=not m
	for _,v in pairs(f:GetChildren()) do
		if v:IsA("TextButton") and v~=min and v~=close then
			v.Visible=not m
		end
	end
	TS:Create(f,TweenInfo.new(.25),{
		Size=m and UDim2.new(0,230,0,60) or UDim2.new(0,230,0,240)
	}):Play()
end)

close.MouseButton1Click:Connect(function()
	stop()
	g:Destroy()
end)