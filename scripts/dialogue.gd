extends Control

var curText = 0
var lastTrigger = false
var canAdvance = true
var allText = ["I don't remember this...", "Why hello there!", "I am the great Coyne!", "I am building the world's...", "biggest factories here!", "...", "Don't believe eh?", "Just wait...", "You'll see.", "Behold!", "The beauty of...", "Industrialism!", "This is great!", "Look at me now!", "What have I done?", "..."]
var allSpeaker = ["Gregory", "Coyne", "Coyne", "Coyne", "Coyne", "Gregory", "Coyne", "Coyne", "Coyne", "Coyne", "Coyne", "Coyne", "Coyne", "Coyne", "Coyne", "Gregory"]
@onready var speakerText = $name
@onready var textReal = $text
@onready var theAnimPlayer = $text/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dialogueAppear"):
		visible = true
	if Input.is_action_just_pressed("dialogueDisappear"):
		visible = false
	if Input.is_action_just_pressed("dialogueRead"):
		theAnimPlayer.play("readText")
	#if curText == 10 and not lastTrigger:
	#	canAdvance = false
		
	if Input.is_action_just_pressed("Next") and visible and canAdvance:
		curText += 1
		theAnimPlayer.play("readText")
		
	speakerText.set_text("-" + allSpeaker[curText])
	textReal.set_text(allText[curText])

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass
