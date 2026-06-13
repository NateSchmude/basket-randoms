extends Node2D

const normal_mass=0.139
const held_mass=0.0001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Arm.ball_touched.connect(on_ball_pickup)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_ball_pickup():
	print(Arm.ball_that_is_held)
	$".".freeze =true
	$".".mass= held_mass
