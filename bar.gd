extends AnimatedSprite

var short_note_scn = preload("res://note/shortnote.tscn")
var long_note_scn = preload("res://note/long_note.tscn")
var note_scale #= 0.3
var bar_data
var speed
func _ready():
	add_notes()

func add_notes():
	var line = 1
	if bar_data == null:
		return
	else:
		for line_data in bar_data:
			var notes_data = line_data.notes
			for note_data in notes_data:
				add_note(line, note_data)
			line += 1

func add_note(line, data):
	var note_scn
	if int(data.len) >= 400:
		note_scn = long_note_scn
	else:
		note_scn = short_note_scn
	var note = note_scn.instance()
	note.line = line
	note.Position = int(data.pos)
	note.length = int(data.len)
	note.length_scale = note_scale
	note.speed = speed
	add_child(note)
