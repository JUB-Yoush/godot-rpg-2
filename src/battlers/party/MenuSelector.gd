extends VBoxContainer
# how to make children
# get the onready var of all the skills from the partymember node
# loop through and assign buttons to all of them.

 
# index through children and put cursor next to one you're currently on
# signal to partymember node when skill selected


var selected_index := 0
onready var menuCursor = get_parent().get_node("MenuCursor")
signal skill_selected(skill_name)
onready var skills = get_parent().get_parent().get_node("Skills").get_children()
func _ready():
	make_skill_menu()
	
func make_skill_menu() -> void:
	for skill in skills:
		var skill_btn = Button.new()
		skill_btn.text = skill.skill_name
		add_child(skill_btn)
	

func _input(event):
	if event.is_action_pressed("up"):
		selected_index = wrapi(selected_index -1, 0, get_child_count())
		update_cursor(selected_index)
	if event.is_action_pressed("down"):
		selected_index = wrapi(selected_index + 1, 0, get_child_count())
		update_cursor(selected_index)
	
	if event.is_action_pressed("confirm"):
		emit_signal("skill_selected", skills[selected_index])

func update_cursor(selected_index:int):
	print(selected_index)
	print("update_cursor")
	menuCursor.rect_position.y = get_child(selected_index).rect_position.y - 135
	menuCursor.rect_position.x = get_child(selected_index).rect_position.x + 160
	
	
	
