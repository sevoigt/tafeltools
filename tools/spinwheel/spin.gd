extends RigidBody2D

var keep_spinning : bool
var base_speed = 5
var speed_delta = 0
var acc = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
		if keep_spinning:
			speed_delta += acc			
			angular_velocity = min(base_speed + speed_delta, 15)
		else:
			speed_delta = 0
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		keep_spinning = event.pressed
