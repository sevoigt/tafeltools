@tool
extends Node2D

@export var label : String

	
func _draw():
	draw_string(ThemeDB.fallback_font, Vector2(0, 25), label, HORIZONTAL_ALIGNMENT_LEFT, -1, 80, Color.BLACK)

func set_label(text : String):
	label = text
