extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_boy_pressed():
	# Choose boy sprite
	playerVariables.isBoy = true
	sceneManager.startGame()


func _on_girl_pressed():
	# Choose girl sprite
	playerVariables.isGirl = true
	sceneManager.startGame()
