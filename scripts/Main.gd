extends Node

@onready var tutorialScreen = get_node_or_null("tutorialPc")
@onready var animation = get_node_or_null("tutorialPc/AnimationPlayer")
var playTutorial = true

var save_path = "user://birdGame.save"
var score = 0
var level1Cleared: bool
var level2Cleared: bool
var level3Cleared: bool
var level4Cleared: bool
var level5Cleared: bool
var level6Cleared: bool
var level7Cleared: bool
var level8Cleared: bool
var level9Cleared: bool
var level10Cleared: bool


func _ready():
	if tutorialScreen:
		if playTutorial:
			tutorialScreen.visible = true
		else:
			tutorialScreen.visible = false

func _input(event):
	if event.is_pressed() and playTutorial and tutorialScreen:
		animation.play("fade_out")
		playTutorial = false

func levelCleared(level_id: int):
	if level_id == 1:
		level1Cleared = true
	if level_id == 2:
		level2Cleared = true
	if level_id == 3:
		level3Cleared = true
	if level_id == 4:
		level4Cleared = true
	if level_id == 5:
		level5Cleared = true
	if level_id == 6:
		level6Cleared = true
	if level_id == 7:
		level7Cleared = true
	if level_id == 8:
		level8Cleared = true
	if level_id == 9:
		level9Cleared = true
	if level_id == 10:
		level10Cleared = true

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(level1Cleared)
	file.store_var(level2Cleared)
	file.store_var(level3Cleared)
	file.store_var(level4Cleared)
	file.store_var(level5Cleared)
	file.store_var(level6Cleared)
	file.store_var(level7Cleared)
	file.store_var(level8Cleared)
	file.store_var(level9Cleared)
	file.store_var(level10Cleared)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		level1Cleared = file.get_var(level1Cleared)
		level2Cleared = file.get_var(level2Cleared)
		level3Cleared = file.get_var(level3Cleared)
		level4Cleared = file.get_var(level4Cleared)
		level5Cleared = file.get_var(level5Cleared)
		level6Cleared = file.get_var(level6Cleared)
		level7Cleared = file.get_var(level7Cleared)
		level8Cleared = file.get_var(level8Cleared)
		level9Cleared = file.get_var(level9Cleared)
		level10Cleared = file.get_var(level10Cleared)
	else:
		print("no data saved")

func reset_data():
	Main.level1Cleared = false
	Main.level2Cleared = false
	Main.level3Cleared = false
	Main.level4Cleared = false
	Main.level5Cleared = false
	Main.level6Cleared = false
	Main.level7Cleared = false
	Main.level8Cleared = false
	Main.level9Cleared = false
	Main.level10Cleared = false
	Main.save()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/LevelSelectMenu.tscn")
func _on_button_2_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().reload_current_scene()

func spawn(parameter, posRanOrNot):
	var instance = preload("res://scenes/mObstaclePair.tscn").instantiate()
	var position = false
	var border = get_viewport()
	
	if parameter == 0: #0=left
		instance.direction = 0
		instance.rotation = 0.0
		if typeof(posRanOrNot) == TYPE_BOOL:
			position = randf_range(150, border.size.y - 150)
		else:
			position = posRanOrNot
		instance.position = Vector2(-60, position)
	elif parameter == 1: #1=right
		instance.direction = 1
		instance.rotation = 0.0
		if typeof(posRanOrNot) == TYPE_BOOL:
			position = randf_range(150, border.size.y - 150)
		else:
			position = posRanOrNot
		instance.position = Vector2(border.size.x + 60, position)
	elif parameter == 2: #2=up
		instance.direction = 2
		instance.rotation = 1.5708
		if typeof(posRanOrNot) == TYPE_BOOL:
			position = randf_range(600, border.size.x - 600)
		else:
			position = posRanOrNot
		instance.position = Vector2(position, -60)
	elif parameter == 3: #3=down
		instance.direction = 3
		instance.rotation = 1.5708
		if typeof(posRanOrNot) == TYPE_BOOL:
			position = randf_range(600, border.size.x - 600)
		else:
			position = posRanOrNot
		instance.position = Vector2(position, border.size.y + 60)
	else: #4=pause
		instance.direction = 4
		instance.rotation = 0
		instance.position = Vector2(-400, -400)

	add_child(instance)

func spawn_double(h_parmeter, v_parmeter, pos: Vector2):
	var instance1 = preload("res://scenes/mObstaclePair.tscn").instantiate()
	var instance2 = preload("res://scenes/mObstaclePair.tscn").instantiate()
	instance1.rotation = 0.0
	instance2.rotation = 1.5708
	var position = false
	var margin = 60
	var border = get_viewport()

	if h_parmeter == 0:
		instance1.direction = 0
		if v_parmeter == 2:
			instance2.direction = 2
			if pos.x >= pos.y:
				instance1.position = Vector2(-margin, pos.y)
				instance2.position = Vector2(pos.x, -(pos.x +margin -pos.y))
			else:
				instance1.position = Vector2(-(pos.y +margin -pos.x), pos.y)
				instance2.position = Vector2(pos.x, -margin)
		elif v_parmeter == 3:
			instance2.direction = 3
			if pos.x >= (border.size.y -pos.y):
				instance1.position = Vector2(-margin, pos.y)
				instance2.position = Vector2(pos.x, border.size.y +(pos.x -margin -(border.size.y -pos.y)))
			else:
				instance1.position = Vector2(-((border.size.y -pos.y +margin) -pos.x), pos.y)
				instance2.position = Vector2(pos.x, border.size.y +margin)
	elif h_parmeter == 1:
		instance1.direction = 1
		if v_parmeter == 2:
			instance2.direction = 2
			if border.size.x -pos.x >= pos.y:
				instance1.position = Vector2(border.size.x +margin, pos.y)
				instance2.position = Vector2(pos.x, -(border.size.x -pos.x +margin -pos.y))
			else:
				instance1.position = Vector2(border.size.x +(pos.y +margin -(border.size.x -pos.x)), pos.y)
				instance2.position = Vector2(pos.x, -margin)
		elif v_parmeter == 3:
			instance2.direction = 3
			if border.size.x -pos.x >= (border.size.y -pos.y):
				instance1.position = Vector2(border.size.x +margin, pos.y)
				instance2.position = Vector2(pos.x, border.size.y +(border.size.x -pos.x +margin) -(border.size.y -pos.y))
			else:
				instance1.position = Vector2(border.size.x +((border.size.y -pos.y +margin) -(border.size.x -pos.x)), pos.y)
				instance2.position = Vector2(pos.x, border.size.y +margin)
	else: #4=pause
		instance1.direction = 4
		instance2.direction = 4
		instance1.rotation = 0
		instance2.rotation = 0
		instance1.position = Vector2(-1000, -1000)
		instance2.position = Vector2(-1000, -1000)

	add_child(instance1)
	add_child(instance2)
