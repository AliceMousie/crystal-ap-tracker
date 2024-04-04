function badges()
	return Tracker:ProviderCountForCode("zephyrbadge") + 
	Tracker:ProviderCountForCode("hivebadge") + 
	Tracker:ProviderCountForCode("plainbadge") + 
	Tracker:ProviderCountForCode("fogbadge") + 
	Tracker:ProviderCountForCode("stormbadge") + 
	Tracker:ProviderCountForCode("mineralbadge") + 
	Tracker:ProviderCountForCode("glacierbadge") + 
	Tracker:ProviderCountForCode("risingbadge") + 

	Tracker:ProviderCountForCode("boulderbadge") + 
	Tracker:ProviderCountForCode("cascadebadge") + 
	Tracker:ProviderCountForCode("thunderbadge") + 
	Tracker:ProviderCountForCode("rainbowbadge") + 
	Tracker:ProviderCountForCode("soulbadge") + 
	Tracker:ProviderCountForCode("marshbadge") + 
	Tracker:ProviderCountForCode("volcanobadge") + 
	Tracker:ProviderCountForCode("earthbadge")
end

-- function e4_open()
-- 	if (has("op_e4_bdg")) then
-- 		return badges() >= progCount('e4req')
-- 	end
-- 	return progCount('gyms') >= progCount('e4req')
-- end

function hid()
	return (has("itemfinder") or has("reqitemfinder_off"))
end

function can_cut()
	return (has("hm01") and has("hivebadge"))
end

function can_flash()
	return (
		has("op_hm5_off") or (has("hm05") and has("zephyrbadge"))
	)
end

function can_strength()
	return (has("hm04") and has("plainbadge"))
end

function can_surf()
	return (has("hm03") and has("fogbadge"))
end

function can_whirlpool()
	return (has("hm06") and has("glacierbadge") and can_surf())
end

function can_waterfall()
	return (has("hm07") and has("risingbadge") and can_surf())
end

function can_rocksmash()
	return has("tm08")
end

function tower_takeover() 
	return badges() >= 7
end

function ecruteak_access()
	return has("squirtbottle") or (has("pass") and has("ssticket"))
end

function tintower_access()
	return ecruteak_access() and has("clearbell") and has("tower_cleared")
end

function cianwood_access()
	return ecruteak_access() and can_surf()
end

function icepath_access()
	return ecruteak_access() and badges() >= 7
end

function blackthorn_access()
	return icepath_access() and can_strength()
end

function victoryroad_access()
	return (can_waterfall() and badges() >= 8) or (has("expncard") and saffron_access() and can_cut())
end

function saffron_access()
	return has("pass") or (has("ssticket") and has("squirtbottle"))
end

function powerplant_access()
	return saffron_access() and can_surf() and (can_flash() or can_cut())
end

function viridian_access()
	return has("expncard") and ((saffron_access() and can_cut()) or victoryroad_access())
end

function red_badges()
	return badges() == 16
end

function red_access()
	return red_badges() and viridian_access()
end
