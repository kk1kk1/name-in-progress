extends Node2D

@onready var interact_label: Label = $InteractLabel
var current_Interactions := []
var can_interact := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if current_Interactions:
			can_interact = false
			interact_label.hide()
			
			await current_Interactions[0].interact.call()
			
			can_interact = true

func _process(delta: float) -> void:
	if current_Interactions and can_interact:
		current_Interactions.sort_custom(_sort_nearest)
		if current_Interactions[0].is_interactable:
				interact_label.text = current_Interactions[0].interact_name
				interact_label.show()
	else:
		interact_label.hide()


func _sort_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist

func _on_interact_range_area_entered(area: Area2D) -> void:
	current_Interactions.push_back(area)


func _on_interact_range_area_exited(area: Area2D) -> void:
	current_Interactions.erase(area)
