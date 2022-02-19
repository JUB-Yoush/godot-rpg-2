extends Control

func _ready():
	pass
onready var textbox = $Panel/Label

func new_text(text):
	textbox.text = text
