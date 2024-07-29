local ScriptName = "Sober Shaders"
local Speed = 0.001 -- Do 0.001 for realistic, 0.005 for it to be faster


local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local Lighting = game:GetService("Lighting")

local Atmosphere = Instance.new("Atmosphere")
local Sky = Instance.new("Sky")
local Bloom = Instance.new("BloomEffect")
local Blur = Instance.new("BlurEffect")
local ColorCorrection = Instance.new("ColorCorrectionEffect")
local SunRays = Instance.new("SunRaysEffect")
local newScript = Instance.new("Script")

for _,i in ipairs(Lighting:GetDescendants()) do
	if i:IsA("Sky") or i:IsA("Atmosphere") or i:IsA("BloomEffect") or i:IsA("BlurEffect") or i:IsA("ColorCorrectionEffect") or i:IsA("SunRaysEffect") then
		i:Destroy()
	end
end
-- Parenting/Naming

Atmosphere.Parent = Lighting
Sky.Parent = Lighting
Bloom.Parent = Lighting
Blur.Parent = Lighting
ColorCorrection.Parent = Lighting
SunRays.Parent = Lighting

-- Lighting
Lighting.Ambient = Color3.fromRGB(251, 255, 255)
Lighting.Brightness = 0.01
Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)

Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
Lighting.ShadowSoftness = 1
Lighting.ExposureCompensation = -0.67

Lighting.FogEnd = 500000

-- Atmosphere
Atmosphere.Density = 0
Atmosphere.Offset = 0

Atmosphere.Color = Color3.fromRGB(158, 245, 255)
Atmosphere.Decay = Color3.fromRGB(92, 92, 92)
Atmosphere.Glare = 0

-- Sky
Sky.CelestialBodiesShown = true

Sky.MoonAngularSize = 6 -- You can change these
Sky.SunAngularSize = 6 -- You can change these

Sky.MoonTextureId = "http://www.roblox.com/asset/?id=14251805232" -- You can change these
Sky.SunTextureId = "http://www.roblox.com/asset/?id=18303465935" -- You can change these

-- I WOULDN'T CHANGE THESE
Sky.SkyboxBk = "rbxassetid://653719502"
Sky.SkyboxDn = "rbxassetid://653718790"
Sky.SkyboxFt = "rbxassetid://653719067"
Sky.SkyboxLf = "rbxassetid://653719190"
Sky.SkyboxRt = "rbxassetid://653718931"
Sky.SkyboxUp = "rbxassetid://653719321"

Sky.StarCount = 10000 -- You can do more

-- Bloom
Bloom.Intensity = 1
Bloom.Size = 35
Bloom.Threshold = 0.8

-- Blur
Blur.Size = 3

-- ColorCorrection

ColorCorrection.Brightness = -0.17
ColorCorrection.Contrast = 1

ColorCorrection.Enabled = true
ColorCorrection.Saturation = -0.08

ColorCorrection.TintColor = Color3.fromRGB(131, 149, 171)

-- Sunrays CHANGE THESE DOWN IF THEY HURT YOUR EYES

SunRays.Enabled = true

SunRays.Intensity = 0.090
SunRays.Spread = 0.660





script.Parent = ServerScriptService -- DO NOT CHANGE IT WILL NOT WORK

if ScriptName == "Sober Shaders" and script.Parent == ServerScriptService and script.RunContext == Enum.RunContext.Server then
	print("Sober Shaders by Synatty loaded! join: dsg.gg/lumixteam for more scripts")
else
	print("Sober Shaders by Synatty could not load! join: dsg.gg/lumixteam and create a ticket if you see this!")
end

local function updateTime()
	local currentTime = Lighting.ClockTime
	local timeInterval = Speed
	local newTime = currentTime + timeInterval
	Lighting.ClockTime = newTime
end

RunService.Heartbeat:Connect(updateTime)
