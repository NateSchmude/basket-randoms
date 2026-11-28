extends Node2D

var target_pos
var ball_held=false;
#signal ball_touched(ball_held: bool)
var hoop_area: Node2D
@onready var hand_area: Area2D = $Hand_Area
var hoop_pos: Vector2
var hand_area_pos: Vector2
var ball_that_is_held = null;

var throw_strength= 15

func _ready() -> void:
	hoop_area = get_tree().get_first_node_in_group("left_hoop")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hoop_area:
		hoop_pos = hoop_area.global_position
		print("yes")
		#print(hoop_pos)
	#if hand_area:
		#hand_area_pos = hand_area.global_position
		#print(hand_area_pos)
	
	if ball_held:
		ball_that_is_held.global_position=$Hand_Area.global_position
	var arm_idle= -($"..".rotation)
	var arm_straight=deg_to_rad(180)-($"..".rotation)
	if Input.is_action_pressed("jump"):
		target_pos=arm_straight
	else:
		target_pos=arm_idle
	rotation= move_toward(rotation, target_pos,10*delta)
	if ball_held and Input.is_action_just_released("jump"):
		throw_ball(delta)

func throw_ball(delta: float) -> void:
	var direction: Vector2 = hand_area.global_position.direction_to(hoop_pos)
	print(direction) 
	ball_that_is_held.throw(direction * throw_strength * delta)
	ball_that_is_held=null
	ball_held = false

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("ball"):
		ball_that_is_held= area.get_parent()
		ball_that_is_held.call_deferred("hold")
		ball_held=true;
	

	
