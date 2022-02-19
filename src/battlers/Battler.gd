extends Node2D

class_name Battler

onready var hpLabel = $UI/Panel/VBoxContainer/HPLabel
onready var mpLabel = $UI/Panel/VBoxContainer/MPLabel
onready var apLabel = $UI/Panel/VBoxContainer/APLabel

var max_hp:int = 15
var hp:int = 10 setget set_hp

var max_mp:int = 10
var mp:int = 10 setget set_mp

var max_ap:int = 3
var ap:int = 3 setget set_ap

var strength:int = 5
var defence:int = 2
var speed:int = 10

var is_turn:bool = false setget  set_turn
var active:bool = false

var is_party_member:bool

signal turn_ended
signal defeated

func set_hp(new_hp:int):
	hp = clamp(new_hp, 0,max_hp)
	hpLabel.text = ("HP: "+ str(hp))
	if hp == 0:
		no_hp()

func set_mp(new_mp:int):
	mp = new_mp
	mpLabel.text = ("MP: "+ str(mp))

func set_ap(new_ap:int):
	ap = new_ap
	apLabel.text = ("AP: "+ str(ap))
	if ap == 0:
		no_ap()
		
func no_ap():
	emit_signal("turn_ended") # called to the main node that passes turns along

func no_hp() -> void:
	emit_signal("defeated")
	pass

func set_turn(new_is_turn):
	is_turn = new_is_turn
	if is_turn == true:
		start_turn()

func take_damage(damage:int) -> void: # pass in taken damage
	var reduced_damage = min(damage - defence,0) # reduce by own defence
	hp -= reduced_damage # subtract from hp and update
	set_hp(hp)

func change_mp(diff:int) -> void:
	mp -= diff
	set_mp(mp)

func start_turn() -> void:
	set_ap(ap + 2)
	
func _ready():
	set_hp(hp)
	set_mp(mp)
	set_ap(ap)
