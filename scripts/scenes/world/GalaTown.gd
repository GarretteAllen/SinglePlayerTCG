extends Node2D
@onready var spawn = $spawnPoint

# Called when the node enters the scene tree for the first time.
# This needs to be changed if i want functioning doors.... 
# Need to figure out a way to instance from main menu and spawn child in this scene.

func _ready():
	if playerVariables.newGame == true:
		if playerVariables.isBoy:
			var boyPlayer = load("res://scenes/main/player/player.tscn").instantiate()
			var spawnPos = spawn.global_position
			add_child(boyPlayer)
			boyPlayer.position = spawnPos
			playerVariables.newGame = false
		if playerVariables.isGirl:
			var girlPlayer = load("res://scenes/main/player/player.tscn").instantiate()
			var spawnPos = spawn.global_position
			add_child(girlPlayer)
			girlPlayer.position = spawnPos
			playerVariables.newGame = false
	else:
		playerVariables.currentDoor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


