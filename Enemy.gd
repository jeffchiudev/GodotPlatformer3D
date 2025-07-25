extends Area3D

@export var move_speed : float = 2.0
@export var move_dir : Vector3

var start_pos : Vector3 #starting position
var target_pos : Vector3 #ending position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position
	target_pos = start_pos + move_dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else:
			target_pos = start_pos
		
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.game_over()
