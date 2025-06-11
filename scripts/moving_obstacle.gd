extends CharacterBody2D
@export var speed: float = 100
@export_range(1, 3, 0.5) var difficulty: float = 1.0
@export_enum("right", "left", "down", "up", "still") var direction: int
@onready var animation = $Worm/AnimationPlayer
var eaten := false
func _ready():
	animation.play("wiggle")

func _physics_process(_delta):
	velocity = Vector2()
	if direction == 0:
		velocity.x += speed
	elif direction == 1:
		velocity.x -= speed
	elif direction == 2:
		velocity.y += speed
	elif direction == 3:
		velocity.y -= speed
	else:
		velocity = Vector2(0, 0)
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and eaten == false:
		eaten = true
		$Worm.queue_free()
