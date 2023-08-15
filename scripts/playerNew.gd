extends CharacterBody2D
class_name newPlayer

const isPlayer: bool = true
@onready var animTree = $AnimationTree
@onready var animState = animTree["parameters/playback"]
@export var walkSpeed = 5
var savedVelocity
## Transition from tile-based movement to move_and_slide()

var isMoving: bool = false

func ready():
	pass

func get_input():
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	elif Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1
	else:
		velocity.x = 0
		velocity.y = 0




func _physics_process(_delta):
	get_input()
	move_and_slide()
