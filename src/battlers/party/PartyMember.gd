extends "res://src/battlers/Battler.gd"


onready var skills = $Skills
onready var skill_list = skills.get_children()

signal skill_queued(skill,character)

func _ready() -> void:
	print(max_hp)

func on_skill_chosen() -> void:
	#pick a target, get the list of all enemies and make a list for the cursor to go through
	#when the skill and enemy is chosen, pass this scene, the skill, and the enemy scene to the main scene
	pass
