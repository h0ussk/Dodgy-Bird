extends Node

@onready var flapSound = $FlapAudio
@onready var winSound = $WinAudio
@onready var loseSound1 = $LoseAudio1
@onready var loseSound2 = $LoseAudio2
@onready var scoreUpSound = $ScoreUpAudio
@onready var acceptMenuSound = $Accept
@onready var denyMenuSound = $Deny
@onready var volumeCheckSound = $VolumeCheck

var pitchStep: float

func reloadPitch():
	pitchStep = 0.8


var lost = false

func playAudio(audio):
	if audio == "flap":
		randomize()
		flapSound.pitch_scale = randf_range(0.8, 1.5)
		flapSound.play()
	if audio == "win":
		winSound.play()
	if audio == "lose1":
		loseSound1.play()
	if audio == "lose2":
		loseSound2.play()
	if audio == "scoreUp":
		scoreUpSound.pitch_scale = pitchStep
		scoreUpSound.play()
		pitchStep += 0.1
	if audio == "Accept":
		acceptMenuSound.play()
	if audio == "Deny":
		denyMenuSound.play()
	if audio == "VolumeCheck":
		volumeCheckSound.play()



func _on_lose_audio_1_finished():
	loseSound2.play()
	lost = true
