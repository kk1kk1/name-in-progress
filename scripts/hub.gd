extends Node2D

func _on_through_door_body_entered(body: Player) -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_stairs_up_body_entered(body: Player) -> void:
	if($TileMapLayer3.is_visible_in_tree() == false):
		$TileMapLayer3.show()
		$TileMapLayer2.set_modulate(Color(0.5,0.5,0.5,1))
	else:
		$TileMapLayer3.hide()
		$TileMapLayer2.set_modulate(Color(1,1,1,1))




func _on_upper_rooms_body_entered(body: Player) -> void:
	if($TileMapLayer2/WallsUpperRooms.is_visible_in_tree() == false):
		$TileMapLayer2/WallsMainRooms.hide()
		$TileMapLayer2/WallsUpperRooms.show()
	else:
		$TileMapLayer2/WallsMainRooms.show()
		$TileMapLayer2/WallsUpperRooms.hide()
