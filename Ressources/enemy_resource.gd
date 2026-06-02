extends Resource
class_name enemy_type

@export var name: String
@export var type: types

@export var damage: int
@export var health: int
@export var collision_damage: int

@export var movement_speed: float
@export var movement_range: float


enum types {
	SWORD,
	SPEER,
	BOW,
	TRAP
}

func call_damage() -> int:
	return damage

func call_collision_damage() -> int:
	return collision_damage

func find_appearance():
	pass
