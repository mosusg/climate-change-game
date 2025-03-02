extends Control

var curText = 0
var lastTrigger = false
var canAdvance = true
var allText = ["I don't remember this here...", "Why hello there!", "I am the great Coyne!", "I am building the world's...", "biggest factories here!", "...", "Don't believe eh?", "Just wait", "You'll see.", "What have I done?", "..."]
var allSpeaker = ["Gregory", "Coyne", "Coyne", "Coyne", "Coyne", "Gregory", "Coyne", "Coyne", "Coyne", "Coyne", "Gregory"]
@onready var speakerText = $name
@onready var textReal = $text
@onready var theAnimPlayer = $text/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if curText == 10 and not lastTrigger:
		canAdvance = false
		
	if Input.is_action_just_pressed("jump") and visible and canAdvance:
		curText += 1
		theAnimPlayer.play("readText")
		
	speakerText.set_text("-" + allSpeaker[curText])
	textReal.set_text(allText[curText])

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass
