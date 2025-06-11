extends Control

func _ready():
	Main.load_data()
	if Main.level1Cleared == true:
		$GridContainer/Panel/Button/Checkmark.visible = true
		$GridContainer/Panel2/Button2/Locked.visible = false
		$GridContainer/Panel2/Button2.disabled = false
	if Main.level2Cleared == true:
		$GridContainer/Panel2/Button2/Checkmark.visible = true
		$GridContainer/Panel3/Button3/Locked.visible = false
		$GridContainer/Panel3/Button3.disabled = false
	if Main.level3Cleared == true:
		$GridContainer/Panel3/Button3/Checkmark.visible = true
		$GridContainer/Panel4/Button4/Locked.visible = false
		$GridContainer/Panel4/Button4.disabled = false
	if Main.level4Cleared == true:
		$GridContainer/Panel4/Button4/Checkmark.visible = true
		$GridContainer/Panel5/Button5/Locked.visible = false
		$GridContainer/Panel5/Button5.disabled = false
	if Main.level5Cleared == true:
		$GridContainer/Panel5/Button5/Checkmark.visible = true
		$GridContainer/Panel6/Button6/Locked.visible = false
		$GridContainer/Panel6/Button6.disabled = false
	if Main.level6Cleared == true:
		$GridContainer/Panel6/Button6/Checkmark.visible = true
		$GridContainer/Panel7/Button7/Locked.visible = false
		$GridContainer/Panel7/Button7.disabled = false
	if Main.level7Cleared == true:
		$GridContainer/Panel7/Button7/Checkmark.visible = true
		$GridContainer/Panel8/Button8/Locked.visible = false
		$GridContainer/Panel8/Button8.disabled = false
	if Main.level8Cleared == true:
		$GridContainer/Panel8/Button8/Checkmark.visible = true
		$GridContainer/Panel9/Button9/Locked.visible = false
		$GridContainer/Panel9/Button9.disabled = false
	if Main.level9Cleared == true:
		$GridContainer/Panel9/Button9/Checkmark.visible = true
		$GridContainer/Panel10/Button10/Locked.visible = false
		$GridContainer/Panel10/Button10.disabled = false
	if Main.level10Cleared == true:
		$GridContainer/Panel10/Button10/Checkmark.visible = true
		

func _on_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
func _on_button_2_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
func _on_button_3_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level3.tscn")
func _on_button_4_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level4.tscn")
func _on_button_5_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level5.tscn")
func _on_button_6_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level6.tscn")
func _on_button_7_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level7.tscn")
func _on_button_8_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level8.tscn")
func _on_button_9_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level9.tscn")
func _on_button_10_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	AudioManager.playAudio("Accept")
	get_tree().change_scene_to_file("res://scenes/Level10.tscn")
