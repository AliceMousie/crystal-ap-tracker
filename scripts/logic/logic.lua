function badges()
	return Tracker:ProviderCountForCode("ZEPHYR_BADGE") + 
	Tracker:ProviderCountForCode("HIVE_BADGE") + 
	Tracker:ProviderCountForCode("PLAIN_BADGE") + 
	Tracker:ProviderCountForCode("FOG_BADGE") + 
	Tracker:ProviderCountForCode("STORM_BADGE") + 
	Tracker:ProviderCountForCode("MINERAL_BADGE") + 
	Tracker:ProviderCountForCode("GLACIER_BADGE") + 
	Tracker:ProviderCountForCode("RISING_BADGE") + 

	Tracker:ProviderCountForCode("BOULDER_BADGE") + 
	Tracker:ProviderCountForCode("CASCADE_BADGE") + 
	Tracker:ProviderCountForCode("THUNDER_BADGE") + 
	Tracker:ProviderCountForCode("RAINBOW_BADGE") + 
	Tracker:ProviderCountForCode("SOUL_BADGE") + 
	Tracker:ProviderCountForCode("MARSH_BADGE") + 
	Tracker:ProviderCountForCode("VOLCANO_BADGE") + 
	Tracker:ProviderCountForCode("EARTH_BADGE")
end

function hid()
	return (has("ITEMFINDER") or has("reqitemfinder_off"))
end

function cut_badge()
	return (
		(has("badgereqs_vanilla") and has("HIVE_BADGE")) or
		(has("badgereqs_kanto") and (has("HIVE_BADGE") or has("CASCADE_BADGE"))) or
		has("badgereqs_none")
	)
end

function can_cut()
	return (has("HM_CUT") and cut_badge())
end

function flash_badge()
	return (
		(has("badgereqs_vanilla") and has("ZEPHYR_BADGE")) or
		(has("badgereqs_kanto") and (has("ZEPHYR_BADGE") or has("BOULDER_BADGE"))) or
		has("badgereqs_none")
	)
end

function can_flash()
	return (
		has("HM_FLASH") and flash_badge()
	)
end

function strength_badge()
	return (
		(has("badgereqs_vanilla") and has("PLAIN_BADGE")) or
		(has("badgereqs_kanto") and (has("PLAIN_BADGE") or has("RAINBOW_BADGE"))) or
		has("badgereqs_none")
	)
end

function can_strength()
	return (has("HM_STRENGTH") and strength_badge())
end

function surf_badge()
	return (
		(has("badgereqs_vanilla") and has("FOG_BADGE")) or
		(has("badgereqs_kanto") and (has("FOG_BADGE") or has("SOUL_BADGE"))) or
		has("badgereqs_none")
	)
end

function can_surf()
	return (has("HM_SURF") and surf_badge())
end

function whirlpool_badge()
	return (
		(has("badgereqs_vanilla") and has("GLACIER_BADGE")) or
		(has("badgereqs_kanto") and has("GLACIER_BADGE") or has("VOLCANO_BADGE")) or
		has("badgereqs_none")
	)
end

function can_whirlpool()
	return (has("HM_WHIRLPOOL") and whirlpool_badge() and can_surf())
end

function waterfall_badge()
	return (
		(has("badgereqs_vanilla") and has("RISING_BADGE")) or
		(has("badgereqs_kanto") and has("RISING_BADGE") or has("EARTH_BADGE")) or
		has("badgereqs_none")
	)
end

function can_waterfall()
	return (has("HM_WATERFALL") and waterfall_badge() and can_surf())
end

function can_rocksmash()
	return has("TM_ROCK_SMASH")
end

function tower_takeover() 
	return badges() > progCount("e4_badges") - 2
end

function ecruteak_access()
	return has("SQUIRTBOTTLE") or (has("PASS") and has("S_S_TICKET"))
end

function tintower_access()
	return ecruteak_access() and has("CLEAR_BELL") and has("EVENT_CLEARED_RADIO_TOWER")
end

function cianwood_access()
	return ecruteak_access() and can_surf()
end

function icepath_access()
	return ecruteak_access() and tower_takeover() 
end

function blackthorn_access()
	return icepath_access() and can_strength()
end

function clear_snorlax()
	return (has("POKE_GEAR") and has("RADIO_CARD") and has("EXPN_CARD"))
end

function elite_four_badges()
	return badges() >= progCount("e4_badges")
end

function victoryroad_access()
	return (can_waterfall() or (clear_snorlax() and saffron_access())) and elite_four_badges()
end

function saffron_access()
	return has("PASS") or (has("S_S_TICKET") and has("SQUIRTBOTTLE"))
end

function powerplant_access()
	return saffron_access() and can_surf() and (can_flash() or can_cut())
end

function viridian_access()
	return clear_snorlax() and saffron_access()
end

function red_badges()
	return badges() >= progCount("red_badges")
end

function all_badges()
	return badges() > 15
end


function red_access()
	return red_badges() and viridian_access()
end