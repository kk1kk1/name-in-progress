extends TextureProgressBar

@export var character: CharacterBody2D

@onready var health: Health = character.find_children("*", "Health")[0]

func _ready() -> void:
	max_value = health.health_res._get_buffed_health()
	value = health.health_res._get_health()
	health.health_res.health_changed.connect(_update_bar)
	health.health_res.buffed_health_changed.connect(_update_bar)
	
func _update_bar(diff: int) -> void:
	max_value = health.health_res._get_buffed_health()
	value = health.health_res._get_health()
