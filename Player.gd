extends RigidBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var upright_strength := 300000
@export var damp :=.1
var can_jump = true
var grounded = false;
var torque;

signal jumpable(can_jump: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_torque_impulse(10000)
	
	
	#apply_torque_impulse(5000) # Replace with function body.

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if can_jump:
		torque = -rotation * upright_strength #- angular_velocity * damp
		constant_torque = torque
	else:
		angular_velocity/=10;
		
	
	
	if Input.is_action_just_pressed("jump") && can_jump==true:
		apply_impulse(Vector2(800*sin(rotation),-500*cos(rotation)))
		
		
		
	if Input.is_action_just_pressed("dih"):
		apply_torque_impulse(100000)
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	var angle = rad_to_deg($".".rotation)
	if area.is_in_group("floor"):
		if angle>0:
			if angle<15:
				apply_torque_impulse(-70000)
			else:
				apply_torque_impulse(-60000)
		else:
			if angle>-15:
				apply_torque_impulse(70000)
			else:
				apply_torque_impulse(60000)
		can_jump=true
		emit_signal("jumpable", true)
	
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("floor"):
		can_jump=false
		emit_signal("jumpable", false)
	
	
	
	
