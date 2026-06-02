class_name EnemyDamage
extends Node

@export var is_collision: bool = true

func collision_damage():
	return $"..".enemy_stats.call_collision_damage()

func attack_damage():
	return $"..".enemy_stats.call_damage()
