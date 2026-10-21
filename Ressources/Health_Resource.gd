@tool
extends Resource
class_name Health_Resource

signal buffed_health_changed(diff: int)
signal health_changed(diff: int)
signal dead

var _starting_health: int : set = _set_starting_health, get = _get_starting_health
var _immortal: bool = false: set = _set_immortal, get = _get_immortal
var _health: int : set = _set_health, get = _get_health
var _buffed_health : int : set = _set_buffed_health, get = _get_buffed_health

#region Functions
func _set_starting_health(value: int):
		_starting_health = value
		_buffed_health = value
		_health = value

func _get_starting_health() -> int:
	return _starting_health

func _set_immortal(value: bool):
	_immortal = value

func _get_immortal() -> bool:
	return _immortal

func _set_health(value: int):
	if value < _health and _immortal:
		return
		
	var clamped_value = clampi(value, 0, _buffed_health)
	
	if clamped_value != _health:
		var difference = clamped_value - _health
		_health = value
		health_changed.emit(difference)
	
	if _health <= 0:
		dead.emit()

func _get_health() -> int:
	return _health

func _set_buffed_health(value: int):
	var clamped_value = 1 if value <= 0 else value
	
	if not clamped_value == _buffed_health:
		var difference = clamped_value - _buffed_health
		_buffed_health = value
		buffed_health_changed.emit(difference)
		
		if _health > _buffed_health:
			_health = _buffed_health

func _get_buffed_health() -> int:
	return _buffed_health
#endregion
