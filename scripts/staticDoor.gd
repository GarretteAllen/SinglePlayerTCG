extends StaticBody2D

@export var doorTransition: PackedScene


func _ready():
	pass 



func _process(_delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Accept"):
		print("this works")
