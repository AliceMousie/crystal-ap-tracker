ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/flag_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/ap_helper.lua")

BASE_OFFSET = 7680000

CUR_INDEX = -1
-- PLAYER_ID = -1
-- TEAM_NUMBER = 0

EVENT_ID=""
KEY_ID=""

function onClear(slot_data)
	CUR_INDEX = -1
	resetLocations()
	resetItems()

	if slot_data == nil then
		print("its fucked")
		return
	end

	-- PLAYER_ID = Archipelago.PlayerNumber or -1
	-- TEAM_NUMBER = Archipelago.TeamNumber or 0
	
	--print(dump_table(slot_data))

	for k,v in pairs(slot_data) do
		if SLOT_CODES[k] then
			Tracker:FindObjectForCode(SLOT_CODES[k].code).CurrentStage = SLOT_CODES[k].mapping[v]
		end
	end
end

function onItem(index, item_id, item_name, player_number)
	if index <= CUR_INDEX then
		return
	end
	CUR_INDEX = index;
	local v = ITEM_MAPPING[item_id - BASE_OFFSET]
	if not v then
		--print(string.format("onItem: could not find item mapping for id %s", item_id))
		return
	end
	local obj = Tracker:FindObjectForCode(v)
	if obj then
		obj.Active = true
	else
		print(string.format("onItem: could not find object for code %s", v[1]))
	end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
	local v = LOCATION_MAPPING[location_id - BASE_OFFSET]
	if not v then
		print(string.format("onLocation: could not find location mapping for id %s", location_id))
		return
	end
	local obj = Tracker:FindObjectForCode(v)
	if obj then
		obj.AvailableChestCount = 0
	else
		print(string.format("onLocation: could not find object for code %s", v[1]))
	end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)