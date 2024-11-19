extends Control



#var reinicios = GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actualizarDatos()
	pass
	
func actualizarDatos():
	%Nivel.text = str(GameManager.nivel_seleccionado)
	%Movimientos.text = str(GameManager.movimientos)
	%Tiempo.text= str(GameManager.tiempo)
	%Intentos.text = str(GameManager.reinicios)
	pass
	#%Movimientos.text = movimientos
	
	


func _on_level_timer_timeout() -> void:
	GameManager.tiempo += 1
	

func _on_reset_pressed() -> void:
	resetStats()
	get_tree().reload_current_scene()
	
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	resetStats()
	GameManager.reinicios = 0
	GameManager.datos = true
	get_tree().change_scene_to_file("res://scenes/inicio.tscn")
	
	pass # Replace with function body.

func resetStats():
	GameManager.tiempo = 0
	GameManager.movimientos = 0
	GameManager.reinicios += 1
	
