extends Area3D

var spin_speed : float = 2.0 #rev per minute
var bob_height : float = 0.2 #how much coin moves
var bob_speed : float = 5 #how fast coin moves

@onready var start_y : float = global_position.y
var t : float = 0.0 #timer for sine wave, keeps track of elapsed time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(Vector3.UP, spin_speed * delta)
