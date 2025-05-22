extends Sprite2D

signal CeilingHit
signal FloorHit


func _on_ceiling_body_entered(body: Node2D):
	emit_signal("CeilingHit")


func _on_floor_body_entered(body: Node2D):
	emit_signal("FloorHit")
