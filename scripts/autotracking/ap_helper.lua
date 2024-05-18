function resetItems() 
	for _, v in pairs(ITEM_MAPPING) do
		if v then
			local obj = Tracker:FindObjectForCode(v)
			if obj then
				obj.Active = false
			end
		end
	end
end

function resetLocations() 
	for _, v in pairs(LOCATION_MAPPING) do
		if v then
			local obj = Tracker:FindObjectForCode(v)
			if obj then
				obj.AvailableChestCount = 1
			end
		end
	end
end

MAP_TOGGLE={[0]=0,[1]=1}
MAP_TRIPLE={[0]=1,[1]=1,[2]=2}
MAP_TOGGLE_REVERSE={[0]=1,[1]=0}
-- MAP_TRIPLE_REVERSE={[0]=2,[1]=1,[2]=0}
-- MAP_FREEFLY={[0]=0,[5]=1,[6]=2,[7]=3,[8]=4,[9]=5,[10]=6,[11]=7,[12]=8,[13]=9,[15]=10}
MAP_BADGES={}
for i=0,8 do MAP_BADGES[i]=i end

SLOT_CODES = {
	randomize_hidden_items={
		code="hiddenitems", 
		mapping=MAP_TOGGLE
	},
	elite_four_badges={
		code="e4_badges", 
		mapping=MAP_BADGES
	},
	red_badges={
		code="red_badges", 
		mapping=MAP_BADGES
	},
	goal={
		code="goal", 
		mapping=MAP_TOGGLE
	},
	randomize_badges={
		code="badges", 
		mapping=MAP_TRIPLE
	},
	randomize_pokegear={
		code="pokegear", 
		mapping=MAP_TOGGLE
	},
	trainersanity={
		code="trainersanity", 
		mapping=MAP_TOGGLE
	},
	hm_badge_requirements={
		code="badgereqs", 
		mapping=MAP_TRIPLE
	},
	require_itemfinder={
		code="reqitemfinder", 
		mapping=MAP_TOGGLE_REVERSE
	},
	johto_only={
		code="johto_only", 
		mapping=MAP_TOGGLE
	}
}
