extends Timer

@export var level_id: int
@export var phase_editor: Array[Array] = [[0, 2, 1, true], [1, 3, 1, true]]
var phase := 0
var spawned := 0
var startPlay = false

func _ready():
	if level_id != 1:
		startPlay = true

func _input(event):
	if event.is_pressed() and !startPlay:
		startPlay = true

func _on_timeout():
	if startPlay:
		if spawned < phase_editor[phase][2]:
			$"..".spawn_double(phase_editor[phase][0], phase_editor[phase][1], phase_editor[phase][3])
			spawned += 1
		elif phase < phase_editor.size() - 1:
			phase += 1
			spawned = 0
