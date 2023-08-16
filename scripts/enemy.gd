# Attempt at making a base for all NPCs in the game

extends CharacterBody2D
class_name Enemy

# Basic enemy variables, might not use at all?

@export var dialogueString: String
@export var dialogueResource: DialogueResource

# Interaction variables

var interactRange: bool = false
var isConnected: bool = false


func ready(): 
	pass


# Handle Dialogue. This section isn't complete as I will need to make it work for other NPCs
# Can be fixed with an export variable I assume.

func dialogue():
	playerVariables.isTalking = true
	
# Using the example until I can wrap my head around how to make one myself.
	
	DialogueManager.show_example_dialogue_balloon(dialogueResource, dialogueString)

# Check to see if player is in interact range by checking if a body has entered
# The area2d node.

func _on_interact_area_body_entered(body):
	if !isConnected:
		body.connect("interactPressed", Callable(self, "dialogue"))
		isConnected = true
	else:
		pass


func _on_interact_area_body_exited(body):
	if isConnected:
		body.disconnect("interactPressed", Callable(self, "dialogue"))
		isConnected = false
