/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Раунд с режимом **[SSticker.mode ? SSticker.mode.name : "Unknown"]** только что закончился\n\n"
	if(data)
		var/s_escaped =  "Эвакуированных"
		if(!evacuation_controller.emergency_evacuation)
			s_escaped = "Транспортированных"
		if(data["survivors"] > 0)
			desc += "Выживших: **[data["survivors"]]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "**Никто не пережил этот раунд**\n"
		desc += "Призраков: **[data["ghosts"]]**\n"
		desc += "Игроков: **[LAZYLEN(GLOB.clients)]**\n"
		desc += "Продолжительность: **[roundduration2text()]**"

	.["embeds"] = list(list(
		"title" = "Раунд под номером [game_id] окончен",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
