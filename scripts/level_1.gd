extends Node2D

var game_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	checkEnd()
	
	pass


func checkEnd():
	if game_end == false:
		var spots =$Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -=1
		
		if spots == 0:
			var post = preload("res://scenes/http.tscn")
			var postScene = post.instantiate()
			%Fin.add_child(postScene)
			postScene.send_data(createData())
			var finScene = preload("res://scenes/fin.tscn")
			var win = finScene.instantiate()
			%Fin.add_child(win)
			
			print("end")
			game_end = true
			
func createData():
	var data ={
	  "Codigo":str(GameManager.codigo),
	  "Nombre":str(GameManager.nombre),
	  "Nivel":str(GameManager.nivel_seleccionado),
	  "Tiempo":str(GameManager.tiempo),
	  "Movimientos":str(GameManager.movimientos),
	  "Reinicios":str(GameManager.reinicios)
	}
	
	return data
	

	
