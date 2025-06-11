extends Area2D

func _ready():
	$BorderShape.shape.size = get_viewport().size + Vector2i(100,100)
	$BorderShape.position = get_viewport().size /2
