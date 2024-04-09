extends Button


func _ready():
	self.pressed.connect(get_tree().quit)
