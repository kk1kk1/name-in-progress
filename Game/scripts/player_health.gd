class_name Health
extends Node

signal max_health_changed(diff: int)
signal health_changed(diff: int)
signal dead

@export var max_health: int : set = set_max_health, get = get_max_health
@export var immortal: bool = false : set = set_immortal, get = get_immortal
@export var immort_timer = null
@onready var health: int = max_health : set = set_health, get = get_health

func set_max_health(value: int):
	var clamped_value = 1 if value <= 0 else value
	
	if not clamped_value == max_health:
		var difference = clamped_value - max_health
		max_health = value
		max_health_changed.emit(difference)
		
		if health > max_health:
			health = max_health

func get_max_health() -> int:
	return max_health

func set_immortal(value: bool):
	immortal = value

func get_immortal() -> bool:
	return immortal

func temp_immortal(time: float):
	if immort_timer == null:
		immort_timer = Timer.new()
		immort_timer.one_shot = true
		add_child(immort_timer)
		
	if immort_timer.timeout.is_connected(set_immortal):
		immort_timer.timeout.disconnect(set_immortal)
	
	immort_timer.set_wait_time(time)
	immort_timer.timeout.connect(set_immortal.bind(false))
	immortal = true
	immort_timer.start()
	
func set_health(value: int):
	if value < health and immortal:
		return
		
	var clamped_value = clampi(value, 0, max_health)
	
	if clamped_value != health:
		var difference = clamped_value - health
		health = value
		health_changed.emit()
		
		if health == 0:
			dead.emit()

func get_health() -> int:
	return health
