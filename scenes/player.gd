extends Shooter

var gravitiy := 0
var speed := 10
var direction : Vector2
var jump := 500
#signal player_shoot(pos: Vector3)


func _ready():
	faction_id = "player"

func _physics_process(delta: float) -> void:
	$craft_speederA.rotation.z = move_toward($craft_speederA.rotation.z, -direction.x / 10.0, delta)
	velocity.y = sin(Time.get_ticks_msec() / 500.0) / 4.0 + sin(Time.get_ticks_msec() / 600.0) / 10.0
	direction = Input.get_vector("press_a","press_d","press_w","press_s")
	
	velocity.x = direction.x * speed

	input_detection(delta)
	#velocity = Vector3(direction.x, jump, direction.y) * speed
	#apply_grivity(delta)
	
	
	move_and_slide()


func input_detection(delta):
	if Input.is_action_just_pressed("shoot"):
		request_shoot()

	if Input.is_action_just_pressed("press_spacebar"):
		velocity.y += jump * delta
		
		#player_shoot.emit(global_position)

func apply_grivity(delta):
	velocity.y -= gravitiy * delta
