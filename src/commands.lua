--!strict
--ModuleScript
local module = {}
local Players = game:GetService("Players")

function module.zestify(plr: Player)
	if not plr then return end
	local char = plr.Character or plr.CharacterAdded:Wait()
	local humanoid = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not humanoid or not hrp then return end
	local bodycolors = char:WaitForChild("Body Colors") :: BodyColors
	bodycolors.HeadColor3 = Color3.fromRGB(202, 203, 209)
	bodycolors.LeftArmColor3 = Color3.fromRGB(202, 203, 209)
	bodycolors.LeftLegColor3 = Color3.fromRGB(202, 203, 209)
	bodycolors.RightArmColor3 = Color3.fromRGB(202, 203, 209)
	bodycolors.RightLegColor3 = Color3.fromRGB(202, 203, 209)
	bodycolors.TorsoColor3 = Color3.fromRGB(202, 203, 209)
	local accessory_names = {
		["hair"] = true,
		["face"] = true
	}
	for _, descendant in ipairs(char:GetDescendants()) do
		if descendant:IsA("Accessory") then
			if not accessory_names[descendant.Name] then
				descendant:Destroy()
			end
		end
	end
	local accessories = {
		hair = game:GetService("ReplicatedStorage"):WaitForChild("zest"):WaitForChild("hair"),
		face = game:GetService("ReplicatedStorage"):WaitForChild("zest"):WaitForChild("face")
	}
	local clonehair = accessories.hair:Clone()
	clonehair.Parent = char
	local cloneface = accessories.face:Clone()
	cloneface.Parent = char
	local SHIRT_ID = 17848996766
	local PANTS_ID = 128207640223051
	local shirt = char:WaitForChild("Shirt")
	local pants = char:WaitForChild("Pants")
	shirt.ShirtTemplate = "rbxassetid://" .. SHIRT_ID
	pants.PantsTemplate = "rbxassetid://" .. PANTS_ID
	if not shirt then
		local new_shirt = Instance.new("Shirt")
		new_shirt.Parent = char
		new_shirt.ShirtTemplate = "rbxassetid://" .. SHIRT_ID
	else
		return
	end
	if not pants then
		local new_pants = Instance.new("Pants")
		new_pants.Parent = char
		new_pants.PantsTemplate = "rbxassetid://" .. PANTS_ID
	end
end

function module.sword(plr: Player)
	print("test")
	if not plr then return end
	local rs = game:GetService("ReplicatedStorage")
	local sword = rs:FindFirstChild("Sword")
	if not sword then return end
	local backpack = plr:FindFirstChild("Backpack")
	if not backpack then
		print("loop")
		backpack = plr:WaitForChild("Backpack")
	end
	if not backpack then return end
	local clone = sword:Clone()
	print("Giving sword to:", plr.Name)
	clone.Parent = backpack
	wait(20)
	clone:Destroy()
end

function module.dropBaseplate ()
	local baseplate = workspace:WaitForChild("Baseplate")
	if not baseplate then error("No baseplate") end
	if baseplate then
		baseplate.Anchored = false
	end
end

return module


--[[
Commands:

zestify
gayify
kill all
kill
give
give bomb
kick
ban
freeze
fatify
drop baseplate
baseplate
material change
sword
permaban
name
btools
cmds
theme
rotatebaseplate
decal all
open gui
explode
invisible
visible
launch
gravity
speed
jump
tp
bring
to
nuke
rainbowify
settime
fling
sparkle
music
mute
unmute
clone
spin
bighead
crash
tools
god
ungod
sit
stun
lag
]]
