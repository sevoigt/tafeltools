extends RigidBody2D

var keep_spinning : bool
var base_speed = 5
var speed_delta = 0
var acc = 0.05
var radius : int

# Called when the node enters the scene tree for the first time.
func _ready():
	radius = $Segmente.radius

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
		if keep_spinning:
			speed_delta += acc			
			angular_velocity = min(base_speed + speed_delta, 15)
		else:
			speed_delta = 0
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if (event.position - get_viewport().get_visible_rect().size/2).length() < radius:
			keep_spinning = event.pressed
