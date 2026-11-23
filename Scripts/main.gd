extends Node2D

const BALL = preload("res://Scenes/ball.tscn")
const RIGHT_PLAYER = preload("res://Scenes/player.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale=1.25
	var ball = BALL.instantiate()
	$".".add_child(ball)
	var right_player = RIGHT_PLAYER.instantiate()
	$".".add_child(right_player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
