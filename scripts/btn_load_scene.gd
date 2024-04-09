extends Button

@export var scene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.load_scene)


func load_scene():
	get_tree().change_scene_to_file(scene)
