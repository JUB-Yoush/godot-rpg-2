extends Node2D

#onready var battlers = $Battlers
#onready var party = $Battlers/PartyMembers
#onready var enemies = $Battlers/Enemies

var party_turn:bool
var current_turn:Node2D
