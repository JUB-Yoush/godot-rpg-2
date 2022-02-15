extends "res://src/battlers/Battler.gd"


onready var skills = $Skills
onready var skill_list = skills.get_children()
onready var chosen_skill:Node
signal skill_queued(skill,character)



func _ready() -> void:
	setup_party_member()
	print(max_hp)
	is_turn = true



func _on_MenuSelector_skill_selected(skill):
	chosen_skill = skill
	pick_target(chosen_skill)
	print('selected ', skill)
	var enemies = get_parent().get_node("Enemy")

func setup_party_member():
	is_party_member = true

func start_turn():
	pass

func pick_target(chosen_skill):
	pass
