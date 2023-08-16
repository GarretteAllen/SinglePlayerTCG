extends Node2D
@onready var spawn = $spawnPoint

# Called when the node enters the scene tree for the first time.
func _ready():
	if playerVariables.isBoy:
		var boyPlayer = load("res://scenes/main/player/player.tscn").instantiate()
		var spawnPos = spawn.global_position
		add_child(boyPlayer)
		boyPlayer.position = spawnPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


