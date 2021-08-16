extends "res://note/base_note.gd"
var curr_length_in_m
var hold_started = false
var hold_canceled = false
func _on_ready():
	._on_ready()
	print(length)
	curr_length_in_m = max(100, length - 100)*length_scale
	# finish ajusting this rayan
	$LongNotePiece.scale = Vector2(1,curr_length_in_m)
	print(curr_length_in_m)
	print(length_scale)

func _on_process(delta):
	._on_process(delta)
	
	if not collected:
		if is_colliding and picker and not hold_canceled:
			if picker.is_colliding:
				hold_started = true
			elif hold_started:
				hold_canceled = true
		if hold_started and not hold_canceled:
			curr_length_in_m -= speed * delta
			if curr_length_in_m <= 0:
				collect()
			else:
				$LongNotePiece.scale = Vector2(1, curr_length_in_m)
				print(curr_length_in_m)
				translate(-speed*delta)
