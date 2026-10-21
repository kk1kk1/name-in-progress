@tool
extends Resource
class_name Buff_Resource

#region Variables

@export var bufftype : buff_types:			## sets Type of Buff assigned to chests
	set(value):
		bufftype = value
		notify_property_list_changed()
enum buff_types{
	DAMAGE,
	TEMPDAMAGE,
	HEALTH,
	TEMPHEALTH,
	INVUL
}

@export var damage_mult: float = 1.0: get = get_damage_mult
@export var damage_mult_time: float = 1.0
@export var health_mult: float = 1.0: get = get_health_mult
@export var health_mult_time: float = 1.0
@export var invul_state: bool = false: get = get_invul
@export var invul_time: float = 1.0 : get = get_invul_time
#endregion

#region Functions
func _validate_property(property: Dictionary) -> void:
	if buff_types.keys()[bufftype] == "DAMAGE":
		if property.name != "bufftype" and property.name != "damage_mult":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if buff_types.keys()[bufftype] == "TEMPDAMAGE":
		if property.name != "bufftype" and property.name != "damage_mult" and property.name != "damage_mult_time":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if buff_types.keys()[bufftype] == "HEALTH":
		if property.name != "bufftype" and property.name != "health_mult":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if buff_types.keys()[bufftype] == "TEMPHEALTH":
		if property.name != "bufftype" and property.name != "health_mult" and property.name != "health_mult_time":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if buff_types.keys()[bufftype] == "INVUL":
		if property.name != "bufftype" and property.name != "invul_state" and property.name != "invul_time":
			property.usage = PROPERTY_USAGE_NO_EDITOR
#region Get and Set 
func get_health_mult() -> float:
	return health_mult

func get_damage_mult() -> float:
	return damage_mult

func get_invul() -> bool:
	return invul_state

func get_invul_time() -> float:
	return invul_time

func get_temp_health() -> Array:
	return [health_mult, health_mult_time]

func get_temp_damage() -> Array:
	return [damage_mult, damage_mult_time]
#endregion
#endregion
