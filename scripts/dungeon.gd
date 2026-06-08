extends Node2D

func _on_through_door_body_entered(body: Player) -> void:
	print("test")
	get_tree().change_scene_to_file("res://scenes/game.tscn")
