extends Node

var score_player_one = 0
var score_player_two = 0

var max_score = 3

func _ready():
	$StartTimer.start()

func _on_field_goal_left() -> void:
	score_player_two += 1
	
	if score_player_two < max_score:
		start_new_round()


func _on_field_goal_right() -> void:
	score_player_one += 1
	
	if score_player_one < max_score:
		start_new_round()

func start_new_round():
	$Ball.reset()
	$PlayerPaddle.set_position(Vector2(30,256))
	$AIPaddle.set_position(Vector2(994,256))
	$StartTimer.start()


func _on_start_timer_timeout() -> void:
	$Ball.set_start_direction()
