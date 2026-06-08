extends Resource
class_name chest_resource

@export var type: types

@export var damage: int

enum types {
	BUFF,
	TRAP,
	ITEM,
	LOOT,
	HEAL
}

func call_damage() -> int:
	return damage
