@tool
extends Node2D

@export var line_width : int:
	set(value):
		line_width = value
		queue_redraw()

@export var width : int:
	set(value):
		width = value
		queue_redraw()

@export var height : int:
	set(value):
		height = value
		queue_redraw()


func _draw():
	var rect = Rect2(0, 0, width, height)
	draw_rect(rect, Color.DARK_GRAY, false, line_width)
