extends Control

signal AudioOff
signal StartOver
signal Quit

func _on_audio_off_pressed():
	emit_signal("AudioOff")


func _on_start_over_pressed():
	emit_signal("StartOver")


func _on_quit_pressed():
	emit_signal("Quit")
