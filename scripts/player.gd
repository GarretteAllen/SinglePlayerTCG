extends CharacterBody2D
class_name Player

# Variables to access nodes

@onready var animTree = $AnimationTree
@onready var animState = animTree["parameters/playback"]
@onready var collisionRay = $Collision
@onready var interactionRay = $Interaction
@onready var interactionShape = $interactionArea/interactionShape

# Set const for tile size. If grid changes size update!!!!

const TILE_SIZE = 32

# Movement variables

const isPlayer: bool = true
var initialPosition = Vector2(0, 0)
var inputDirection = Vector2(0, 0)
var isMoving = false
var percentMovedToNextTile = 0.0
@export var walk_speed = 4.0

# Various variables and signals 

signal interactPressed
@onready var inDialogue: bool = false

# Set initial position

func _ready():
	initialPosition = position
	playerVariables.isTalking = false
	
# If character is not moving process player input to detect keystrokes and move.
# In future will also handle interactions the same way, if character not moving/colliding then interact.

func _physics_process(delta):
	if isMoving == false && playerVariables.isTalking == false:
		processPlayerInput()
		interaction()
	elif inputDirection != Vector2.ZERO:
		animState.travel("Walk")
		playerMove(delta)
	else:
		isMoving = false
		animState.travel("Idle")

# Handle the player's input and choose animation from tree

func processPlayerInput():
	if inputDirection.y == 0:
		inputDirection.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if inputDirection.x == 0:
		inputDirection.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if inputDirection != Vector2.ZERO:
		animTree.set("parameters/Idle/blend_position", inputDirection)
		animTree.set("parameters/Walk/blend_position", inputDirection)
		initialPosition = position
		isMoving = true
	else:
		animState.travel("Idle")

# Handle movement along the grid

func playerMove(delta):
	var desiredStep: Vector2 = inputDirection * TILE_SIZE / 2
	collisionRay.target_position = desiredStep
	interactionRay.target_position = desiredStep
	if !collisionRay.is_colliding():
		percentMovedToNextTile += walk_speed * delta
		if percentMovedToNextTile >= 1.0:
			position = initialPosition.snapped(Vector2(0,0)) + (TILE_SIZE * inputDirection)
			percentMovedToNextTile = 0.0
			isMoving = false
		else:
			position = initialPosition.snapped(Vector2(0,0)) + (TILE_SIZE * inputDirection * percentMovedToNextTile)
	else:
		animState.travel("Idle")
		percentMovedToNextTile = 0.0
		isMoving = false

# Handle player interaction ** WIP **

func interaction():
	if !isMoving && interactionRay.is_colliding():
		if Input.is_action_just_pressed("Accept"):
			interactPressed.emit()


func _on_interaction_area_area_entered(_area):
	pass # Replace with function body.


func _on_interaction_area_area_exited(_area):
	pass # Replace with function body.
