extends Area2D

class_name Fox

signal point_scored

@export var speed: float = 200.0
@onready var sounds: AudioStreamPlayer2D = $Sounds

@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	var move: float = Input.get_axis("ui_left", "ui_right")
	
	if !is_zero_approx(move):
		sprite_2d.flip_h = move > 0
	
	position.x += move * delta * speed


func _on_area_entered(area: Area2D) -> void:
	if area is Dice:
		sounds.play()
		area.queue_free()
		point_scored.emit()
