@tool
extends Node2D

@export var radius = 400


# Called when the node enters the scene tree for the first time.
func _draw():
	var default_font = ThemeDB.fallback_font
	var default_font_size = ThemeDB.fallback_font_size
	var resolution = var_to_str(DisplayServer.screen_get_size())

	#draw_circle(Vector2i(0, 0), radius, Color.BLUE_VIOLET)
	
	#draw_string(default_font, Vector2(0, 0), resolution, HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size)

	var colors = [Color.INDIAN_RED, Color.CADET_BLUE, Color.CORAL,
				  Color.GOLD, Color.AQUAMARINE, Color.CRIMSON,
				  Color.BLUE_VIOLET]
				
	var labels = ["Kid", "Beef", "Rob", "Dog", "Budgie", "Cow", "Elefant", "Fish", "Weasel"]

	var num_segments : int = len(labels)	
	var label_script = load("res://tools/spinwheel/label.gd")
	
	for i in range(num_segments):
		var arc = 2*PI / num_segments
		var start = i * arc
		var end = start + arc
		draw_segment(start, end, 20, colors[i%len(colors)])
	
		var angle_label = i*arc + arc/2
		var x = cos(angle_label) * 370
		var y = sin(angle_label) * 370
	
		var label_node = Node2D.new()
		label_node.set_script(label_script)
		label_node.position = Vector2(x, y)
		label_node.rotation = i*arc + arc/2 + PI
		label_node.label = labels[i]
			
		add_child(label_node)
		
		"""
		var x = 40 * cos(start + arc/2)
		var y = 40 * cos(start + arc/2)
		var label_pos = Vector2(x, y)
		
		draw_string(ThemeDB.fallback_font, label_pos, "Dog", HORIZONTAL_ALIGNMENT_LEFT, 24)
		"""

func draw_segment(start_angle : float, end_angle : float, num_points : int, fill_color : Color):
	var points = get_arc_points(start_angle, end_angle, num_points)
	draw_polygon(points, [ fill_color ])
	draw_polyline(points, Color.WHITE, 2, true)
	


func get_arc_points(start_angle : float, end_angle : float, num_points : int):
	var points : PackedVector2Array = [[0,0]]
	points.append(Vector2.ZERO)
	for i in range(num_points):		
		var angle = start_angle + i * (end_angle - start_angle) / (num_points-1)
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		points.append(Vector2(x, y))
	
	return points
	
