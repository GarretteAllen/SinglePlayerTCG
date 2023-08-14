extends CharacterBody2D
class_name Player

const isPlayer: bool = true
@export var walk_speed = 4.0
@onready var animTree = $AnimationTree
@onready var animState = animTree["parameters/playback"]
@onready var collisionRay = $Collision
@onready var interactionRay = $Interaction

const TILE_SIZE = 32

var initialPosition = Vector2(0, 0)
var inputDirection = Vector2(0, 0)
var isMoving = false
var percentMovedToNextTile = 0.0

func _ready():
	initialPosition = position
	
	
func _physics_process(delta):
	if isMoving == false:
		processPlayerInput()
		interaction()
	elif inputDirection != Vector2.ZERO:
		animState.travel("Walk")
		playerMove(delta)
	else:
		isMoving = false
		animState.travel("Idle")

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
		
func interaction():
	if !isMoving && interactionRay.is_colliding():
		pass
