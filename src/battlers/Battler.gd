extends Node2D

class_name Battler

var max_hp:int = 15
var hp:int = 10 setget set_hp

var max_mp:int = 10
var mp:int = 10 setget set_mp

var max_ap:int = 3
var ap:int = 3 setget set_ap

var stren:int = 5
var defen:int = 2
var speed:int = 10

var is_turn:bool = false 
var active:bool = false

var is_party_member:bool

signal turn_ended
signal defeated

func set_hp(new_hp:int):
	hp = clamp(new_hp, 0,max_hp)
	if hp == 0:
		no_hp()

func set_mp(new_mp:int):
	mp = new_mp

func set_ap(new_ap:int):
	ap = new_ap
	if ap == 0:
		no_ap()
		
func no_ap():
	emit_signal("turn_ended") # called to the main node that passes turns along

func no_hp() -> void:
	emit_signal("defeated")
	pass

func take_damage(damage:int) -> void: # pass in taken damage
	var reduced_damage = min(damage - defen,0) # reduce by own defence
	hp -= reduced_damage # subtract from hp and update
	set_hp(hp)

func change_mp(diff:int) -> void:
	mp -= diff
	set_mp(mp)

func turn_started() -> void:
	ap = ap + 2
	set_ap(ap)
	

