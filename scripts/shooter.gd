extends CharacterBody3D
class_name Shooter

#@export var faction: Faction.Type
@export var faction_id : String
#signal shoot_request(origin: Vector3, direction, Vector3, source)

func request_shoot():
	var combat_system = get_tree().get_first_node_in_group("combat_system")
	if combat_system:
		var origin = global_transform.origin
		var direction = -global_transform.basis.z
		
		combat_system.handle_shoot_request(origin, direction, self)
	#shoot_request.emit(origin, direction, self)

func get_faction():
	return faction_id
