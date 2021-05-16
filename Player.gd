extends KinematicBody2D

var speed = 250
var velocity = Vector2()
var gravity = 800
var jump = -450

func _ready():
	OS.center_window()

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
		
