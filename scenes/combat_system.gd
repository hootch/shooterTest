extends Node
class_name CombatSystem

@onready var fire_pipeline = $FirePipeline
@export var laser_scene : PackedScene = preload("res://scenes/laser.tscn")

func _ready():
	add_to_group("combat_system")

func handle_shoot_request(origin: Vector3, direction: Vector3, source):
	fire_pipeline.fire(origin, direction, source)
	spawn_projectile(origin, direction, source)

func spawn_projectile(origin: Vector3, direction: Vector3, source):
	var laser = laser_scene.instantiate()
	get_tree().current_scene.add_child(laser)
	
	laser.global_position = origin
	laser.setup(direction, source)
