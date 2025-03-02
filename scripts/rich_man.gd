extends Node2D

var curStage = 1
@onready var player = $"../CharacterBody2D"
@onready var spriteThing = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spriteThing.play("forward")

func _process(delta: float) -> void:
	if player.position.x < 1952:
		position = Vector2(1483, 81)
	if player.position.x < 3363:
		position = Vector2(2887, 80)
	else:
		position = Vector2(4064, 80)
