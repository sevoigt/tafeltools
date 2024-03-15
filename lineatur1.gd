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
	for i in range(4):
		draw_line(Vector2(0, i*height/3), Vector2(width, i*height/3), Color.DARK_GRAY, line_width)
	for i in range(2):
		draw_line(Vector2(i*width, 0), Vector2(i*width, height), Color.DARK_GRAY, line_width)
