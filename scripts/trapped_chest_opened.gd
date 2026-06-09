extends Node2D

@onready var health: Health = $"../../../../Player/Health"
@onready var chest = get_parent()
@onready var type: int = chest.chest_contents.type

func _ready() -> void:
	chest.opened.connect(_on_trapped_chest_opened)

func _on_trapped_chest_opened():
	if type == 0:
		print("is Buff")
		if chest.chest_contents.buff.bufftype == 0:
			print("Damage")
		elif chest.chest_contents.buff.bufftype == 1:
			print("Health")
			print(health.max_health)
			health.set_max_health(health.get_max_health() * chest.chest_contents.buff.get_health_mult())
			print(health.max_health)
		else:
			print("Invul")
			health.temp_immortal(chest.chest_contents.buff.get_invul_time())
	elif type == 1:
		print("is Trap")
		health.set_health(health.get_health() - chest.chest_contents.call_damage())
	elif type == 2:
		print("is Item")
	elif type == 3:
		print("is Loot")
	else:
		print("is Heal")
		health.set_health(health.get_health() + chest.chest_contents.call_healing())
