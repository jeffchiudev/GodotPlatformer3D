extends CharacterBody3D

var move_speed : float = 4.0
var jump_force : float = 8.0
var gravity : float = 20.0

var facing_angle : float

@onready var model : MeshInstance3D = get_node("Model")

func _physics_process(delta: float) -> void:
	# apply gravity if not on floor
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# apply logic for jumping
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# get keyboard inputs
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	# calculate move direction
	var dir = Vector3(input.x, 0, input.y)
	
	# assign direction to velocity on vectors
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	# apply velocity
	move_and_slide()
	
	# if input inserted, change facing angle
	if input.length() > 0: 
		facing_angle = Vector2(input.y, input.x).angle()
	
	# smooth model rotation to facing direction
	model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.3)
	
	# set game over logic for falling
	if global_position.y < -5: 
		game_over()

func game_over (): 
	get_tree().reload_current_scene()
