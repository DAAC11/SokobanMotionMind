extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	LastLevelbuttom()
	stats()
	title()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stats():
	var salida = ""
	salida += "\n"+"Nivel: " +str(GameManager.nivel_seleccionado) + "\n"
	salida += "Tiempo: " +str(GameManager.tiempo) + "\n"
	salida += "Movimientos: " +str(GameManager.movimientos) + "\n"
	salida += "Reinicios: " +str(GameManager.reinicios) + "\n"
	%Stats.text = salida

func title():
	%Titulo.text = "Felicitaciones "+ str(GameManager.nombre)
	
func resetStats():
	
	GameManager.tiempo = 0
	GameManager.movimientos = 0
	GameManager.reinicios = 0

func _on_inicio_pressed() -> void:
	GameManager.datos = true
	get_tree().change_scene_to_file("res://scenes/inicio.tscn")
	pass # Replace with function body.


func siguiente_nivel():
	if GameManager.nivel_seleccionado == 1:
		GameManager.nivel_seleccionado = 2
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
		
	elif GameManager.nivel_seleccionado == 2:
		GameManager.nivel_seleccionado = 3
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	elif GameManager.nivel_seleccionado == 3:
		GameManager.nivel_seleccionado = 4
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")

func LastLevelbuttom():
	if GameManager.nivel_seleccionado == 4:
		%Siguiente.visible = false


func _on_siguiente_pressed() -> void:
	siguiente_nivel()
	resetStats()

	pass # Replace with function body.
