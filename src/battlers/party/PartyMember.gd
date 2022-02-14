extends "res://src/battlers/Battler.gd"


onready var skills = $Skills
onready var skill_list = skills.get_children()

func _ready():
	print(max_hp)

