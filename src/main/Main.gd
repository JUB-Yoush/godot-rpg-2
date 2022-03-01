extends Node2D

export var partyBattlers:PackedScene
export var enemyBattlers:PackedScene


func _ready() -> void:
	#initalize_battlers()
	pass


func initalize_battlers():
	var party_members = partyBattlers.instance().get_children()
	var enemy_members = enemyBattlers.instance().get_children()

	for member in party_members:
		$Battlers/PartyMembers.add_child(member)
	for enemy in enemy_members:
		$Battlers/Enemies.add_child(enemy)
		
	
func use_skill_on_target(skill:Skill,target:Battler,user:Battler):
	print('skill: '+ skill.name)
	print('HP: '+ str(skill.skill_hp_cost))
	print('MP: '+ str(skill.skill_mp_cost))
	print('AP: '+ str(skill.skill_ap_cost))
	print('target: '+ target.name)
	print('user: '+ user.name)
	if user.mp >= skill.skill_mp_cost && user.ap >= skill.skill_ap_cost:
		user.change_mp(skill.skill_mp_cost)
		user.change_ap(skill.skill_ap_cost)
		user.change_hp(skill.skill_hp_cost)
		
		target.take_damage(skill.skill_dmg)
	
