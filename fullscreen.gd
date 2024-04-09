extends Control


func _input(event):
	""""
	Toggle fullscreen mode
	"""	
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_F11 or (event.alt_pressed and event.keycode == KEY_ENTER):			
			
			if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
							
			elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
