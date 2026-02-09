extends Node3D

var laser_scene : PackedScene = preload("res://scenes/laser.tscn")
@onready var combat_system = $CombatSystem


func register_shooter(shooter):
	shooter.shoot_request.connect(combat_system.handle_shoot_request)


func _ready() -> void:
	pass


func _on_player_shoot(pos:Vector3):
	pass
