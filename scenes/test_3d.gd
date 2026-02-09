extends Node3D

var _1s_timer : Timer

func _ready() -> void:
	_1s_timer = Timer.new()
	_1s_timer.autostart = true
	_1s_timer.wait_time = 1
	add_child(_1s_timer)
	
	_1s_timer.timeout.connect(_on_1s_timeout)
	_1s_timer.start()
	
	
func _on_1s_timeout() -> void:
	print("1초마다 실행됨")
