extends Node2D


@onready var health: Health = $"../../Player/Health"
@onready var trapped_chest = get_parent()
@onready var type: int = trapped_chest.chest_contents.type

func _ready() -> void:
	trapped_chest.opened.connect(_on_trapped_chest_opened)

func _on_trapped_chest_opened():
	if type == 0:
		print("is Buff")
	elif type == 1:
		print("is Trap")
		health.set_health(health.get_health() - trapped_chest.chest_contents.call_damage())
	elif type == 2:
		print("is Item")
	elif type == 3:
		print("is Loot")
	else:
		print("is Heal")
