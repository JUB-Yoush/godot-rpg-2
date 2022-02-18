extends "res://src/battlers/Battler.gd"


onready var skills = $Skills
onready var skill_list = skills.get_children()
onready var chosen_skill:Node
onready var targetedEnemyNode:Node2D
signal skill_queued(skill,character)

onready var targetCursor = get_node("../../../UI/TargetCursor")

var targets:Array
var selected_target:= 0
var is_targeting:bool = false setget set_is_targeting

func _ready() -> void:
	setup_party_member()
	print(max_hp)
	is_turn = true

func set_is_targeting(targeting_state):
	is_targeting = targeting_state
	if is_targeting:
		targetCursor.visible = true
		update_target_cursor(selected_target)
	else:
		targetCursor.visible = false
		
		

func _on_MenuSelector_skill_selected(skill):
	chosen_skill = skill
	pick_target(chosen_skill)
	print('selected ', skill)
	

func setup_party_member():
	is_party_member = true

func start_turn():
	pass

func pick_target(chosen_skill):
	var enemies = get_node("../../Enemies").get_children()
	var party_members = get_parent().get_children()
	targets = enemies + party_members
	set_is_targeting(true)
	print("is_targeting true")
	pass

func _input(event):
	if is_targeting == true:
		if Input.is_action_just_pressed("left"):
			selected_target = wrapi(selected_target - 1, 0, targets.size())
			update_target_cursor(selected_target)
			
		if Input.is_action_just_pressed("right"):
			selected_target = wrapi( + 1, 0, targets.size()-1)
			update_target_cursor(selected_target)
			
		if Input.is_action_just_pressed("return"):
			$UI/MenuSelector.set_selecting_skill(true)
			set_is_targeting(false)
		
		if Input.is_action_just_pressed("confirm"):
			#------------------------- SEND INFO TO MAIN NODE AND DEAL SOME HECKING DAMAGE ----------------
			targetedEnemyNode = targets[selected_target]
			print(targetedEnemyNode)
			pass

func update_target_cursor(selected_target):
	targetCursor.position = targets[selected_target].position
	targetCursor.position.y -= 50
