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
	print("NEW HP: " + str(new_hp))
	hpLabel.text = ("HP: "+ str(hp))
	if hp == 0:
		no_hp()

func set_mp(new_mp:int):
	print("NEW MP: " + str(new_mp))
	mp = new_mp
	mpLabel.text = ("MP: "+ str(mp))

func set_ap(new_ap:int):
	print("NEW AP: " + str(new_ap))
	ap = new_ap
	apLabel.text = ("AP: "+ str(ap))
	if ap == 0:
		no_ap()

func change_hp(hp_diff:int):
	print('changing hp of '+ self.name + str(hp) +" by " + str(hp_diff))
	hp = clamp(hp - hp_diff, 0,max_hp)
	set_hp(hp)
	

func change_mp(mp_diff:int):
	print('changing mp of '+ self.name + str(mp) +" by " + str(mp_diff))
	mp = clamp(mp - mp_diff, 0,max_mp)
	set_mp(mp)

func change_ap(ap_diff:int):
	print('changing ap of '+ self.name + str(ap) +" by " + str(ap_diff))
	ap = clamp(ap - ap_diff, 0,max_ap)
	set_ap(ap)

	
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
	#if a damaging skill
	if damage > 0:
		 damage = max(damage - defence,0) # reduce by own defence
	 # subtract from hp and update
	change_hp(damage)


func start_turn() -> void:
	set_ap(ap + 2)
	
func _ready():
	set_hp(hp)
	set_mp(mp)
	set_ap(ap)
