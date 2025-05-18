extends Control

signal new_round
signal exit

func _on_new_round_button_pressed():
	emit_signal("new_round")

func _on_finish_button_pressed():
	emit_signal("exit")
