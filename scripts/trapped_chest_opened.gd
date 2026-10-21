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
			print("TempDamage")
		elif chest.chest_contents.buff.bufftype == 2:
			print("Health")
			print(health.health_res._get_buffed_health())
			health.buff_health(3.0)
			print(health.health_res._get_buffed_health())
		elif chest.chest_contents.buff.bufftype == 3:
			print("TempHealth")
			var result = chest.chest_contents.buff.get_temp_health()
			health.temp_health(result[0], result[1])
			print(health.health_res._get_buffed_health())
		else:
			print("Invul")
			## does not work as of now
			health.temp_immortal(chest.chest_contents.buff.get_invul_time())
	elif type == 1:
		print("is Trap")
		health.health_res._set_health(health.health_res._get_health() - chest.chest_contents.call_damage())
	elif type == 2:
		print("is Item")
	elif type == 3:
		print("is Loot")
	else:
		print("is Heal")
		health.health_res._set_health(health.health_res._get_health() + chest.chest_contents.call_healing())
