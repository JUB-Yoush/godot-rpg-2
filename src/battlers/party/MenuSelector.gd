extends VBoxContainer
# how to make children
# get the onready var of all the skills from the partymember node
# loop through and assign buttons to all of them.

 
# index through children and put cursor next to one you're currently on
# signal to partymember node when skill selected


var selected_skill_child := 0
var selecting_skill = true setget set_selecting_skill

onready var menuCursor = get_parent().get_node("MenuCursor")
signal skill_selected(skill_name)
signal update_textbox(text)
onready var skills = get_parent().get_parent().get_node("Skills").get_children()
func _ready():
	make_skill_menu()
	set_selecting_skill(true)
	connect("update_textbox",get_node("../../UI"),"new_text")
	
	
func make_skill_menu() -> void:
	for skill in skills:
		var skill_btn = Button.new()
		skill_btn.text = skill.skill_name
		add_child(skill_btn)
	

func _input(event):
	if selecting_skill == true:
		if event.is_action_pressed("up"):
			selected_skill_child = wrapi(selected_skill_child -1, 0, get_child_count())
			update_cursor(selected_skill_child)
		if event.is_action_pressed("down"):
			selected_skill_child = wrapi(selected_skill_child + 1, 0, get_child_count())
			update_cursor(selected_skill_child)
		
		if event.is_action_pressed("confirm"):
			set_selecting_skill(false)
			emit_signal("skill_selected", skills[selected_skill_child])
			

func update_cursor(selected_skill_child:int):
	menuCursor.position.y = get_child(selected_skill_child).rect_position.y - 130
	menuCursor.position.x = rect_position.x + rect_size.x + 25
	var cursor_skill_info = skills[selected_skill_child].skill_info
	emit_signal("update_textbox",cursor_skill_info)
	
	
func set_selecting_skill(selecting_state):
	selecting_skill = selecting_state
	if selecting_skill:
		menuCursor.visible = true
		update_cursor(selected_skill_child)
	else:
		menuCursor.visible = false
		
	
