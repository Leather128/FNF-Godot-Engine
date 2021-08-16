extends Node2D

var audio
var map
var audio_file = "res://HELLCLOWN [Tricky Mod].ogg"
onready var music_node = $Music
onready var road_node = $HUD/Road
var tempo
var bar_length_in_m
var quarter_time_in_sec
var speed
var note_scale
var start_pos_in_sec
func _ready():
	audio = load(audio_file)
	map = load_map("res://hellclown.mboy")
	calc_parms()
	music_node.setup(self)
	road_node.setup(self)

func calc_parms():
	tempo = int(map.tempo)
	bar_length_in_m = 800 # godot 2d meters
	quarter_time_in_sec = 60/float(tempo) # 60/60 = 1, 60/85 = 0.71
	speed = bar_length_in_m/float(4*quarter_time_in_sec) # each bar has 4 quaters
	note_scale = bar_length_in_m/float(4*400)
	start_pos_in_sec = (float(map.start_pos)/400.0) * quarter_time_in_sec
func load_map(maptoload):
	var file = File.new()
	file.open(maptoload, File.READ)
	var content = file.get_as_text()
	return JSON.parse(content).get_result()
