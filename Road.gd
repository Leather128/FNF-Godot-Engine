extends AnimatedSprite

onready var bars_scn = preload("res://bar.tscn")
var bar_length_in_m
var bars = []
onready var bars_node = $BarsNode
var speed 
var note_scale
var curr_location

var curr_bar_index 
var tracks_data
func setup(game):
	speed = Vector2(0, -game.speed)
	bar_length_in_m = game.bar_length_in_m
	curr_location = Vector2(0, bar_length_in_m)
	note_scale = game.note_scale
	curr_bar_index = 0
	tracks_data = game.map.tracks
	add_bars()
func _process(delta):
	bars_node.translate(speed*delta)
	
	for bar in bars:
		if bar.position.y + bars_node.position.y <= -bar_length_in_m:
			remove_bar(bar)
			add_bar()
func add_bar():
	
	var bar = bars_scn.instance()
	bar.translate(Vector2(curr_location.x, curr_location.y))
	bar.note_scale = note_scale
	bar.bar_data = get_bar_data()
	bar.speed = speed
	bars.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector2(0, bar_length_in_m)
	curr_bar_index += 1

func get_bar_data():
	if curr_bar_index > 180:
		return
	else:
		var left_data = tracks_data[0].bars[curr_bar_index]
		var right_data = tracks_data[1].bars[curr_bar_index]
		var down_data = tracks_data[2].bars[curr_bar_index]
		var up_data = tracks_data[3].bars[curr_bar_index]
		var bf_left_data = tracks_data[4].bars[curr_bar_index]
		var bf_right_data = tracks_data[5].bars[curr_bar_index]
		var bf_down_data = tracks_data[6].bars[curr_bar_index]
		var bf_up_data = tracks_data[7].bars[curr_bar_index]
		
		return [bf_left_data, bf_down_data, bf_up_data, bf_right_data]
func remove_bar(bar):
	bar.queue_free()
	bars.erase(bar)
func add_bars():
	for i in range(4):
		add_bar()
