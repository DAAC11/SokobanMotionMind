extends Area2D

var occupied = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("box"):
		occupied = true
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("box"):
		occupied = false
	pass # Replace with function body.
