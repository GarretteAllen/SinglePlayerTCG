extends Area2D
class_name Door

@export var scene: String
@export var doorName: String
# This is the start of the doors script. It will control ALL the doors in the game
# All door components will use this script

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("Accept") and get_overlapping_areas().size() > 0:
		if !scene:
			print(scene)
			print("no scene in this door")
			return
		if playerVariables.currentDoor:
			# Handle location of player after exiting house.
			pass
		setDoor()
		sceneManager.changeScene(scene)

func setDoor():
	playerVariables.currentDoor = doorName
