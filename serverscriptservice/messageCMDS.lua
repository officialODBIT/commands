--Script
local module = require(workspace:WaitForChild("commands"))
local player = game.Players
local prefix = "/"
local commands = {
	c1 = "sword",
	c2 = "drop-baseplate",
	c3 = "zestify"
}

player.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg == prefix .. commands.c1 then
			module.sword(plr)
		elseif msg == prefix .. commands.c2 then
			module.dropBaseplate()
		elseif msg == prefix .. commands.c3 then
			module.zestify(plr)
		elseif msg == prefix .. "cmds" then
			local gui = plr.PlayerGui:WaitForChild("cmds")
			if gui.Enabled == false then
				gui.Enabled = true
			else
				gui.Enabled = false
			end
		end
	end)
end)
