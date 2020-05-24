-- Made by Donrskbb --

-- ONLY EDIT BELOW THIS --

local DISCORD_WEBHOOK = "YOUR WEBHOOK"
local DISCORD_NAME = "YOUR BOT NAME"
local DISCORD_IMAGE = "YOUR FOOTER IMAGE" -- Image must end on .png --
local communityname = "Discord Bot By Donrskbb"
local STEAM_KEY = "YOUR STEAM API"


---DON'T EDIT BELOW THIS---

PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = "FiveM kill Logger is **ONLINE**", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

RegisterServerEvent('playerDied')
AddEventHandler('playerDied',function(message)
    sendToDiscord("Death log", message, 16711680)
end)

function GetIDFromSource(Type, ID)
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function sendToDiscord(name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = DISCORD_IMAGE,
            },
        }
    }
  PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end