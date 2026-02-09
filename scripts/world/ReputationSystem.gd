extends Node

class_name ReputationSystem

@onready var faction_system = get_tree().get_first_node_in_group("faction_system")

func apply_action(actor_faction: String, target_faction: String, amount: float):
	var current = faction_system.get_relation(actor_faction, target_faction)
	faction_system.set_relation(actor_faction, target_faction, current+amount)
