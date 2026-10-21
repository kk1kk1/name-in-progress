class_name Health
extends Node

@export var health_res: Health_Resource
@export var _max_health: int
@export var immort_timer = null
@export var temp_health_timer = null

func _enter_tree() -> void:
	health_res._set_starting_health(_max_health)
	#health_res._set_health(_max_health)
	print(health_res._get_health(), health_res._get_buffed_health(), health_res._get_starting_health())

func set_immortal(value: bool):
	health_res._set_immortal(value)

func get_immortal() -> bool:
	return health_res._get_immortal()

func get_buffed_health() -> int:
	return health_res._get_buffed_health()

## currently non functional
func temp_immortal(time: float):
	if immort_timer == null:
		immort_timer = Timer.new()
		immort_timer.one_shot = true
		add_child(immort_timer)
		
	if immort_timer.timeout.is_connected(set_immortal):
		immort_timer.timeout.disconnect(set_immortal)
	
	immort_timer.set_wait_time(time)
	immort_timer.timeout.connect(set_immortal.bind(false))
	set_immortal(true)
	immort_timer.start()

func buff_health(Buffvalue: float):
	var increasedhealth = health_res._get_buffed_health() * Buffvalue
	var difference = increasedhealth - health_res._get_buffed_health()
	health_res._set_buffed_health(increasedhealth)
	health_res._set_health(health_res._get_health() + difference)

func temp_health(Buffvalue: float, time: float):
	var currentmaxhealth = health_res._get_buffed_health()
	var difference = health_res._get_buffed_health() - health_res._get_health()
	if temp_health_timer == null:
		temp_health_timer = Timer.new()
		temp_health_timer.one_shot = true
		add_child(temp_health_timer)
		
	if temp_health_timer.timeout.is_connected(buff_health):
		temp_health_timer.timeout.disconnect(buff_health)
	
	temp_health_timer.set_wait_time(time)
	temp_health_timer.timeout.connect(buff_health.bind(Buffvalue))
	buff_health(Buffvalue)
	temp_health_timer.start()
	print(health_res._get_buffed_health())
	await temp_health_timer.timeout
	health_res._set_buffed_health(currentmaxhealth)
	health_res._set_health(health_res._health - difference)
	print(health_res._get_buffed_health())
	
