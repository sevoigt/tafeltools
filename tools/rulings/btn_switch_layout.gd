"""
Steuert das Durchschalten der verschiedenen Varianten einer Lineatur
"""

extends Button

@export var bg_node : Control
@export var nodes : Array[Node2D] = []

var active_idx : int	# der Index des aktuell angezeigten Layouts


func _ready():	
	pressed.connect(self.switch_layout)
	self.active_idx = 0


func switch_layout():	
	# Only switch layout if we are already visible, otherwise just
	# show the previously selected layout
	if self.nodes[self.active_idx].is_visible_in_tree():
		self.active_idx = (self.active_idx + 1) % len(self.nodes)
		
	self.clear_all()
	self.nodes[self.active_idx].visible = true
	

func clear_all():
	for i in bg_node.get_children():
		i.visible = false
