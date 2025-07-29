extends Area3D

var spin_speed : float = 2.0 #rev per minute
var bob_height : float = 0.2 #how much coin moves
var bob_speed : float = 5 #how fast coin moves

@onready var start_y : float = global_position.y
var t : float = 0.0 #timer for sine wave, keeps track of elapsed time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(Vector3.UP, spin_speed * delta)
	
	t += delta
	var d = (sin(t * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)
	
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.add_score(1)
		queue_free()
