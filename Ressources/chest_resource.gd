@tool
extends Resource
class_name Chest_Resource

#region Variables
##interaction types



@export var type: types:
	set(value):
		type = value
		notify_property_list_changed()
enum types {
	BUFF,
	TRAP,
	ITEM,
	LOOT,
	HEAL
	} 

##variables
@export var damage : int = 10
@export var buff = Buff_Resource.new()
@export var healing: int

@export var invul_state : bool = false

@export var buff_time: int

#endregion

func _validate_property(property: Dictionary) -> void:
	if types.keys()[type] == "BUFF":
		if property.name != "type" and property.name != "buff":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if types.keys()[type] == "TRAP":
		if property.name != "type" and property.name != "damage":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if types.keys()[type] == "ITEM":
		if property.name != "type" and property.name != "number_%d":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if types.keys()[type] == "LOOT":
		if property.name != "type":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	if types.keys()[type] == "HEAL":
		if property.name != "type" and property.name != "healing":
			property.usage = PROPERTY_USAGE_NO_EDITOR
	

func call_damage() -> int:
	return damage
func call_healing() -> int:
	return healing
