extends Area2D
class_name Sign

# Same thing as with doors, use this to interact with signs.

# Set dialogue variables from the editor.

@export var dialogue: DialogueResource
@export var dialogueString: String
@export var signName: String

func _input(event):
	if event.is_action_pressed("Accept") and get_overlapping_areas().size() > 0:
		if !dialogue or !dialogueString:
			print("check dialogue settings on ", signName)
			return
		playerVariables.isTalking = true
		DialogueManager.show_example_dialogue_balloon(dialogue, dialogueString)
