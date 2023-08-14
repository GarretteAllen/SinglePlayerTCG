# Attempt at making a base for all NPCs in the game

extends CharacterBody2D
class_name Enemy

# Basic enemy variables, might not use at all?

@export var enemyName: String

# Interaction variables

var interactRange: bool = false
var isConnected: bool = false
var dialogueResource = load("res://dialogue/testNPC.dialogue")
@onready var dialogueContainer = $Dialogue

# Check per frame if player is in interaction range 

func _physics_process(_delta):
	if interactRange == true:
		pass

func ready(): 
	pass
	
func dialogue():
	#var dialogue_line = await DialogueManager.get_next_dialogue_line(dialogueResource, "testNPC")
	DialogueManager.show_example_dialogue_balloon(dialogueResource, "testNPC")


func _on_interact_area_body_entered(body):
	interactRange = true
	if !isConnected:
		body.connect("interactPressed", Callable(self, "dialogue"))
		isConnected = true
	else:
		pass


func _on_interact_area_body_exited(_body):
	interactRange = false
