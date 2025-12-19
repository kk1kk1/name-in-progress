class_name Hitbox
extends Area2D

signal damage_recieved(damage: int)

@export var health : Health

func _ready():
	connect("area_entered", on_area_entered)

func on_area_entered(damage_taken):
	if CollisionDamage:
		if damage_taken != null:
			health.health -= damage_taken.damage
			damage_recieved.emit(damage_taken.damage)
	elif Attack:
		if damage_taken != null:
			health.health -= damage_taken.damage
			damage_recieved.emit(damage_taken.damage)
