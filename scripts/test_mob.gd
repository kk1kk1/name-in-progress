extends Node
class_name Test_enemy

@export var enemy_stats: enemy_type 
var damage: int 

func get_collision_damage() -> int:
	damage = enemy_stats.call_collision_damage()
	return damage
