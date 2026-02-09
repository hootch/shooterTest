extends Area3D
class_name Laser

@export var speed := 60.0
@export var damage := 10
@export var s_dmg := 1

var direction : Vector3
var source
var source_faction_id : String
var faction_system

func setup(dir: Vector3, shooter):
	direction = dir.normalized()
	source = shooter
	
	source_faction_id = shooter.get_faction()
	faction_system = get_tree().get_first_node_in_group("faction_system")

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta


func _on_body_entered(body):
	if body == source:
		return
	
	if body.has_method("get_faction"):
		var target_faction = body.get_faction()
		var state = faction_system.get_relation_state(source_faction_id, target_faction)
		
		if state == "ally":
			return

		#var target_faction = body.get_faction()
		#if not FactionRelations.is_hostile(source_faction, target_faction):
			#return
	
	if body.has_method("apple_damage"):
		body.apply_damage(damage, source)
		
	queue_free()
