/decl/webhook/server_start
	id = WEBHOOK_SERVER_START
// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/server_start/get_message(var/list/data)
	. = ..()
	var/desc = "Новый раунд скоро начнётся\n"
	desc += "Объект: **[station_name()]**\n"
	desc += "Адрес: <[get_world_url()]>"
//	desc += "."
	.["content"] = "@here"
	.["embeds"] = list(list(
		"title" = "Сервер запущен",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))