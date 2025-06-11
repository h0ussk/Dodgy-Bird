extends CharacterBody2D
@export var speed := 300
@export var winCondition := 25
@export var level_id: int
var character_direction: Vector2
var gravity := 900
var jump = -400
var dead := false
var looks_left := false
var collided := false
var jumping := false
var startPlay = false
@onready var animation = $AnimationPlayer

func _ready():
	if level_id != 1:
		startPlay = true
	AudioManager.reloadPitch()

func _input(event):
	if event.is_pressed() and !startPlay:
		startPlay = true

func _physics_process(delta):
	if !dead and startPlay:
		character_direction.x = Input.get_axis("left", "right")
		velocity.y += gravity * delta

		if character_direction.x < 0 and looks_left == false:
			scale.x *= -1
			looks_left = true
		if character_direction.x > 0 and looks_left == true:
			scale.x *= -1
			looks_left = false
	
		if character_direction:
			velocity.x = character_direction.x * speed
		else:
			velocity.x = velocity.move_toward(Vector2.ZERO, speed).x

		if Input.is_action_just_pressed("jump"):
			animation.play("anim")
			AudioManager.playAudio("flap")
			velocity.y = jump
	
		move_and_slide()

		if collided:
			$Area2D.monitoring = false
			$Area2D.monitorable = false

	if AudioManager.lost:
		$"../LoseText".visible = true
		$"../Controls".visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		AudioManager.lost = false


func _on_area_2d_area_entered(area):
	if area.is_in_group("goal") and dead == false:
		AudioManager.playAudio("scoreUp")
		Main.score += 1
		if Main.score >= winCondition:
			AudioManager.playAudio("win")
			animation.play("win")
			Main.levelCleared(level_id)
			Main.score = 0
			collided = true
			dead = true
			$"../WinText".visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Main.save()
	elif area.is_in_group("obstacle") or !area.is_in_group("border") and  not(dead):
		velocity = Vector2.ZERO
		dead = true
		AudioManager.playAudio("lose1")
		animation.play("death")
		Main.score = 0
		collided = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("border"):
		velocity = Vector2.ZERO
		dead = true
		AudioManager.playAudio("lose1")
		animation.play("death")
		Main.score = 0
		collided = true
