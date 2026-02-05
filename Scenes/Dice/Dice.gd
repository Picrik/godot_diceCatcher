extends Area2D

class_name Dice

const SPEED: float = 80.0
const ROT_SPEED: float = 5
var rotation_dir: float = 1

signal game_over

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randf() < 0.5: rotation_dir *= -1

func _physics_process(delta: float) -> void:
	position.y += delta * SPEED
	sprite_2d.rotate(delta * ROT_SPEED * rotation_dir)
	check_game_over()

func check_game_over() -> void:
	if get_viewport_rect().end.y < position.y:
		game_over.emit()
		queue_free()
