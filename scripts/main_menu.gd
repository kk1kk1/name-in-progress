extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func new_game() -> void:
	get_tree().change_scene_to_file("res://scenes/hub.tscn")


func options() -> void:
	$Label/VBoxContainer.hide()
	$Label/Optionsgrid.show()


func close_game() -> void:
	get_tree().quit()


func _on_check_box_toggled(toggled_on: bool) -> void:
	if (toggled_on == true):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_button_pressed() -> void:
	$Label/Optionsgrid.hide()
	$Label/VBoxContainer.show()
