extends Node2D

const BALL = "res://Scripts/main.gd"
const RIGHT_PLAYER = "res://Scripts/Player.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale=1.25
	var ball = preload(BALL)
	var new_ball = ball.instantiate()
	$".".add_child(new_ball)
	var right_player = preload(RIGHT_PLAYER)
	var new_right_player = right_player.instantiate()
	$".".add_child(new_right_player)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
