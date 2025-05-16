extends CharacterBody2D

signal update

@export var move_speed: int = 500
var direction: Vector2 = Vector2()

func _process(delta):
	emit_signal("update")

func _physics_process(delta):
	var velocity = direction.normalized() * move_speed if direction.length() > 0 else Vector2()
	move_and_collide(velocity * delta)
