extends Button

@export var bg_node : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.clear_all)
	self.clear_all()

func clear_all():
	for i in bg_node.get_children():
		i.visible = false
