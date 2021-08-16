extends AnimatedSprite
var Position = 0
var is_colliding = false
var picker
var collected = false
var length
var length_scale
var speed
export (int, 1, 4) var line
func _ready():
	_on_ready()
func _on_ready():
	set_note()
	set_Position()
	add_listeners()
func _process(delta):
	_on_process(delta)
func _on_process(delta):
	pass
func set_note():
	match line:
		1:
			frame = 0
		2:
			frame = 1
		3:
			frame = 2
		4:
			frame = 3
func set_Position():
	var x = 0
	match line:
		1:
			x = 0
		2:
			x = 80
		3:
			x = 160
		4:
			x = 240
	self.translate(Vector2(x, Position*length_scale))
func add_listeners():
	$Area.add_to_group("note")
func collect():
	collected = true
	picker.is_collecting = false
	hide()

func _on_Area_area_entered(area):
	if area.is_in_group("picker"):
		is_colliding = true
		picker = area.get_parent()


func _on_Area_area_exited(area):
	if area.is_in_group("picker"):
		is_colliding = false
		picker = area.get_parent()
