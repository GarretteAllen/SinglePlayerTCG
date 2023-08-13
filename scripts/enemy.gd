# Realistically won't need this, but keeping it just in case I do.

extends Resource
class_name Enemy

# Variables that pertain to the specific enemy.

@export var eName: String
@export var dialogue: bool
@export var battle: bool
@export var trade: bool
@export var graphics: PackedScene


# Code that will apply to ALL enemy NPCs.

func ready():
	pass
	

