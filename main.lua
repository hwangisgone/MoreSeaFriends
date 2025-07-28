local frillish = {
	name = "frillish", 
	pos = {x = 0, y = 7},
	config = {extra = {chips = 0, chip_mod = 2}, evo_rqmt = 50},
	loc_vars = function(self, info_queue, center)
		type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, self.config.evo_rqmt}}
	end,
	rarity = 2, 
	cost = 3,
	stage = "Basic", 
	ptype = "Water",
	atlas = "Pokedex5",
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers then
			if context.discard and not context.blueprint then
				if context.other_card:is_face() then
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
					return {
						message = localize('k_upgrade_ex'),
						colour = G.C.CHIPS,
						delay = 0.45,
					}
				end
			end

			if context.scoring_hand and context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
					colour = G.C.CHIPS,
					chip_mod = card.ability.extra.chips
				}
			end
		end
		return scaling_evo(self, card, context, "j_sea_poke_jellicent", card.ability.extra.chips, self.config.evo_rqmt)
	end,
}

local jellicent = {
	name = "jellicent", 
	pos = {x = 1, y = 7},
	config = {extra = {chips = 40, chip_mod = 5}},
	loc_vars = function(self, info_queue, center)
		type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
	end,
	rarity = "poke_safari", 
	cost = 6,
	stage = "One", 
	ptype = "Water",
	atlas = "Pokedex5",
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers then
			if context.discard and not context.blueprint then
				if context.other_card:is_face() then
					local card_id = context.other_card:get_id() 

					if card_id == 12 or card_id == 13 then
						card.ability.extra.chips = card.ability.extra.chips + context.other_card:get_chip_bonus()
					else
						card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
					end

					return {
						message = localize('k_upgrade_ex'),
						colour = G.C.CHIPS,
						delay = 0.45,
					}
				end
			end

			if context.scoring_hand and context.joker_main then
				return {
					message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
					colour = G.C.CHIPS,
					chip_mod = card.ability.extra.chips
				}
			end
		end
	end,
}

local quaxly = {
	name = "quaxly", 
	pos = {x = 0, y = 7},
	config = {extra = {chips = 0, chip_mod = 5}, evo_rqmt = 40},
	loc_vars = function(self, info_queue, center)
		type_tooltip(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, self.config.evo_rqmt}}
	end,
	rarity = 2, 
	cost = 3,
	stage = "Basic", 
	ptype = "Water",
	atlas = "Pokedex5",
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers then
			if context.pre_discard and not context.blueprint then
				for _, v in pairs(G.hand.highlighted) do
					if v:is_face() then
						card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
						return {
							message = localize('k_upgrade_ex'),
							colour = G.C.CHIPS
						}
					end
				end
			end

			if context.scoring_hand and context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
					colour = G.C.CHIPS,
					chip_mod = card.ability.extra.chips
				}
			end
		end
		return scaling_evo(self, card, context, "j_sea_poke_jellicent", card.ability.extra.chips, self.config.evo_rqmt)
	end,
}


-- pokermon.Pokemon(quaxly,"sea_poke",false)
pokermon.Pokemon(frillish,"sea_poke",false)
pokermon.Pokemon(jellicent,"sea_poke",false)
pokermon.add_family({"frillish", "jellicent"})