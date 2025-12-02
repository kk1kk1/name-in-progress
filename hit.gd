extends Area2D

signal hit


func _on_area_2d_body_entered(body: Node2D):
	#hide() #hides player
	print("test")
	hit.emit()
