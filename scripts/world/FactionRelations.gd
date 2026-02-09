extends Node
class_name FactionRelations

static var relations = {
	Faction.Type.PLAYER: {
		Faction.Type.MERCENARY: "ally",
		Faction.Type.BANDIT: "enemy",
		Faction.Type.MONSTER: "enemy",
		Faction.Type.CORP: "neutral",
		Faction.Type.CULT: "enemy",
		Faction.Type.SCIENTISTS: "neutral",
		Faction.Type.NEUTRAL: "neutral",
	},
	Faction.Type.BANDIT: {
		Faction.Type.MONSTER: "enemy",
		Faction.Type.PLAYER: "enemy",
	}
}

static func is_hostile(a, b) -> bool:
	if relations.has(a) and relations[a].has(b):
		return relations[a][b] == "enemy"
	return false
