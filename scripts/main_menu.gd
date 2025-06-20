extends Control

@onready var menu = $mainscene
@onready var select = $levelSelection
@onready var settings = $Settings

func _on_play_button_pressed():
	menu.visible = false
	select.visible = true
	AudioManager.playAudio("Accept")

func _on_exit_button_pressed():
	get_tree().quit()


func _on_back_button_pressed():
	menu.visible = true
	select.visible = false
	settings.visible = false
	AudioManager.playAudio("Deny")


func _on_reset_button_pressed():
	Main.reset_data()
	AudioManager.playAudio("Deny")
	pass


func _on_settings_button_pressed():
	menu.visible = false
	settings.visible = true
	AudioManager.playAudio("Accept")
