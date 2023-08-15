# Attempt at making a base for all NPCs in the game

extends CharacterBody2D
class_name Enemy

# Basic enemy variables, might not use at all?

@export var enemyName: String

# Interaction variables

var interactRange: bool = false
var isConnected: bool = false

# dialogueResource will be used outside of the Enemy class when it gets to that point
# For now it is here for testing as there is only one "enemy" npc.

var dialogueResource = load("res://dialogue/testNPC.dialogue")
@onready var dialogueContainer = $Dialogue



func ready(): 
	pass
	

func dialogue():
	playerVariables.isTalking = true
	print(playerVariables.isTalking)
	
	# Using the example until I can wrap my head around how to make one myself.
	
	DialogueManager.show_example_dialogue_balloon(dialogueResource, "testNPC")

# Check to see if player is in interact range by checking if a body has entered
# The area2d node.

func _on_interact_area_body_entered(body):
	if !isConnected:
		body.connect("interactPressed", Callable(self, "dialogue"))
		isConnected = true
	else:
		pass


func _on_interact_area_body_exited(body):
	print(isConnected)
	if isConnected:
		body.disconnect("interactPressed", Callable(self, "dialogue"))
		isConnected = false
