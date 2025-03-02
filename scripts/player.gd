extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200
var facing = "right"
var canMove = true
var grounded = true
@onready var timer = $coyoteTimer
@onready var animSprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		grounded = true
	if not is_on_floor() and timer.time_left == 0:
		timer.start()
	if not grounded:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and grounded and canMove:
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("downwards") and not grounded:
		for i in range(1, 10):
			velocity.y += i**1.75

	var direction := Input.get_axis("left", "right")
	if direction and canMove:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("left"):
		facing = "left"
		animSprite.scale.x = -1
	if Input.is_action_just_pressed("right"):
		facing = "right"
		animSprite.scale.x = 1
	
	if velocity == Vector2.ZERO:
		animSprite.play("idle")
	if not grounded:
		animSprite.play("jump")
	else:
		animSprite.play("moving")
	

	move_and_slide()

func _on_coyote_timer_timeout() -> void:
	grounded = false
