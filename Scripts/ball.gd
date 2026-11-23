extends RigidBody2D

const normal_mass=0.139
const held_mass=0.0001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(global_position)
	pass

func hold() -> void:
	freeze = true
	mass = held_mass;

func throw(impulse: Vector2) -> void:
	freeze = false
	mass = normal_mass
	apply_central_impulse(impulse)
