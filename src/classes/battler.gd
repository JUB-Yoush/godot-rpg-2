extends Node2D

# stats: HP,MP,AP
# Attack, Defence, Speed 

# ap is how you use your attacks
# every turn you gain ap based on your speed value
# once your ap is 100 you get to take a turn.

# actions cost a certain amount of ap
# not everything is equal, some skills cost more ap than others.
# multiple players and enemy characters

var max_hp = 15
var hp = 10 setget set_hp

var max_mp = 10
var mp = 10 setget set_mp

var max_ap = 3
var ap = 3 setget set_ap

var is_turn = false 

signal turn_ended
signal defeated


	
func set_hp(new_hp):
	hp = clamp(new_hp, 0,max_hp)

	
	
func set_mp(new_mp):
	mp = new_mp

	
func set_ap(new_ap):
	ap = new_ap
	if ap == 0:
		no_ap()
		
func no_ap():
	pass
