extends CharacterBody2D

@onready var ray: RayCast2D = $RayCast2D

var gridSize = GameManager.gridSize
var inputs = {
	"ui_up":Vector2.UP,
	"ui_down":Vector2.DOWN ,
	"ui_left":Vector2.LEFT ,
	"ui_right":Vector2.RIGHT 
	}

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	
func move(dir):
	var game = get_parent()
	var vector_pos =inputs[dir] * gridSize
	
	ray.target_position = vector_pos
	ray.force_raycast_update()
	
	if !ray.is_colliding():
		position += vector_pos
		GameManager.movimientos += 1
		
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("box"):
			if collider.move(dir):
				position += vector_pos
				GameManager.movimientos += 1
