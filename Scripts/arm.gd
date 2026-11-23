extends Node2D

var target_pos
var ball_held=false;
signal ball_touched(ball_held: bool)
@onready var hand_area = get_node("Hand_Area")
var ball_that_is_held = null;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_ball_held():
	return ball_held



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball_held:
		ball_that_is_held.global_position=$Hand_Area.global_position
	var arm_idle= -(Player.rotation)
	var arm_straight=deg_to_rad(180)-(Player.rotation)
	if Input.is_action_pressed("jump"):
		target_pos=arm_straight
	else:
		target_pos=arm_idle
	rotation= move_toward(rotation, target_pos,10*delta)

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("ball"):
		ball_that_is_held= area.get_parent()
	ball_held=true;
	emit_signal("ball_touched", true)
	print("ball")
	

	
