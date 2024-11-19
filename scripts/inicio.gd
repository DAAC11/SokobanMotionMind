extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	fillData()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func checkData():
	var output = "Por favor completar: "
	var control = false
	if %NombreInput.text =="" and %CodigoInput.text =="":
		output += "Codigo y Nombre" 
	elif %NombreInput.text =="":
		output += "Nombre"
	elif %CodigoInput.text =="":
		output += "Codigo"
	else:
		GameManager.codigo = %CodigoInput.text
		GameManager.nombre = %NombreInput.text
		control  = true
	%warning.text = output
	return control
	
func fillData():
	if GameManager.datos:
		%CodigoInput.text= GameManager.codigo
		%NombreInput.text= GameManager.nombre

func resetStats():
	GameManager.nivel_seleccionado = 0
	GameManager.tiempo = 0
	GameManager.movimientos = 0
	GameManager.reinicios = 0

#section signals

func _on_button_nivel_1_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 1
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	pass # Replace with function body.


func _on_button_nivel_2_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 2
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	pass # Replace with function body.


func _on_button_nivel_3_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 3
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	pass # Replace with function body.


func _on_button_nivel_4_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 4
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	pass # Replace with function body.
