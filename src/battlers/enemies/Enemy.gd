extends Battler

func _ready():
	setup_enemy()
	print('from enemy')

func setup_enemy():
	is_party_member = false
	
func start_turn():
	print('from enemy')
	
