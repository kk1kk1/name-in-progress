class_name Hitbox
extends Area2D

signal damage_recieved(damage: int)


@export var health : Health

func _ready():
	connect("area_entered", on_area_entered)

func on_area_entered(damage_taken):
	if EnemyDamage:
		if damage_taken.is_collision:
			if damage_taken != null:
				health.health -= damage_taken.collision_damage()
				damage_recieved.emit(damage_taken.collision_damage())
		else:
			if damage_taken != null:
				health.health -= damage_taken.attack_damage()
				damage_recieved.emit(damage_taken.attack_damage())
