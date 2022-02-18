extends Node2D

export var partyBattlers:PackedScene
export var enemyBattlers:PackedScene


func _ready() -> void:
	initalize_battlers()
	pass


func initalize_battlers():
	var party_members = partyBattlers.instance().get_children()
	var enemy_members = enemyBattlers.instance().get_children()

	for member in party_members:
		$Battlers/PartyMembers.add_child(member)
	for enemy in enemy_members:
		$Battlers/Enemies.add_child(enemy)
		
	
