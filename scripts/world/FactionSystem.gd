extends Node
class_name FactionSystem

var factions = {}
var relations = {}

func register_faction(faction: FactionData):
	factions[faction.id] = faction
	if not relations.has(faction.id):
		relations[faction.id] = {}

func set_relation(a: String, b: String, value: float):
	relations[a][b] = clamp(value, -100, 100)
	relations[b][a] = clamp(value, -100, 100)
	
func get_relation(a: String, b: String) -> float:
	if relations.has(a) and relations[a].has(b):
		return relations[a][b]
	return 0

func get_relation_state(a: String, b: String) -> String:
	var v = get_relation(a,b)
	
	if v >= 50:
		return "ally"
	elif v <= -50:
		return "enemy"
	else:
		return "neutral"
	
