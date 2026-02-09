extends Node
class_name FirePipeline

func fire(origin: Vector3, direction: Vector3, source):
	var space = source.get_world_3d().direct_space_state
	
	var query = PhysicsRayQueryParameters3D.create(
		origin,
		origin + direction * 1000.0
	)

	query.exclude = [source]
	
	var result = space.intersect_ray(query)
	
	if result:
		_resolve_hit(result, source)
		
func _resolve_hit(hit: Dictionary, source):
	var target = hit["collider"]
	
	if target.has_method("apple_damage"):
		target.apply_damage(10, source)
	# 나중에 여기 추가
	# sound
	# effect
	# loot
	# quest
