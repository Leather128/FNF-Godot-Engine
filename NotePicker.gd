extends AnimatedSprite

export (int, 1, 4) var line
var is_pressed = false
var is_collecting = false
func _ready():
	set_process_input(true)

func _input(event):
	match line:
		0:
			if event.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
				frame = 1
				
			elif event.is_action_released("ui_left"):
				is_pressed = false
				is_collecting = false
				frame = 0
				
				
		2:
			if event.is_action_pressed("ui_down"):
				is_pressed = true
				is_collecting = true
				frame = 1
				
			elif event.is_action_released("ui_down"):
				is_pressed = false
				is_collecting = false
				frame = 0
				
		3:
			if event.is_action_pressed("ui_up"):
				is_pressed = true
				is_collecting = true
				frame = 1
				
				
			elif event.is_action_released("ui_up"):
				is_pressed = false
				is_collecting = false
				frame = 0
				
		4:
			if event.is_action_pressed("ui_right"):
				is_pressed = true
				is_collecting = true
				frame = 1
				
				
			elif event.is_action_released("ui_right"):
				is_pressed = false
				is_collecting = false
				frame = 0



func _on_NotePicker_animation_finished():
	animation = "default"
	playing = false
	frame = 0
