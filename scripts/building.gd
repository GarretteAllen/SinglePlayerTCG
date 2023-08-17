extends Node2D
class_name Building

# All buildings will use this!
@export var spawn: Marker2D
@export var doorOut: Door


func _ready():
	if !spawn or !doorOut:
		print("Make sure you have chosen created a spawn node/door node")
	else:
		if playerVariables.isBoy:
			var boyPlayer = load(playerVariables.boyScene).instantiate()
			var spawnPos = spawn.global_position
			add_child(boyPlayer)
			boyPlayer.position = spawnPos
		if playerVariables.isGirl:
			var girlPlayer = load(playerVariables.girlScene).instantiate()
			var spawnPos = spawn.global_position
			add_child(girlPlayer)
			girlPlayer.position = spawnPos
