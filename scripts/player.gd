extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -325
var facing = "right"
@onready var animSprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("downwards") and not is_on_floor():
		for i in range(1, 10):
			velocity.y += i**1.75

	var direction := Input.get_axis("left", "right")
	if direction:
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
	if not is_on_floor():
		animSprite.play("jump")
	else:
		animSprite.play("moving")
	

	move_and_slide()
