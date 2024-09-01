extends Node

signal language_changed

signal player_contacted(id, location)

signal player_location_requested(npc_requester)
signal player_location_sended(npc_requester, player_location)

signal player_changed_of_the_map(player_location)

signal npc_initiated_dialogue(dialogues)
