extends CanvasLayer
signal star_game

func show_message(text:String):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")	
	await ($MessageTimer.timeout)
	$Message.show()
	$Message.text = "Dodge the Creeps!"
	$NombreAlumno.show()
	await get_tree().create_timer(1.0).timeout
	
	$StartButton.show()
	
	
func update_score(score:int):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed() -> void:
	$SonidoBoton.play()
	$StartButton.hide()
	star_game.emit()
	$NombreAlumno.hide()


func _on_message_timer_timeout() -> void:
	$Message.hide()
