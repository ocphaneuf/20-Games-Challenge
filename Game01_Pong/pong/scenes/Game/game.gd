extends Node

@onready var hud = get_node("HUD")

var score_player_one = 0
var score_player_two = 0

var max_score = 3

func _ready():
	update_score()
	$EscMenu.set_visible(false)
	$StartTimer.start()
	
func _process(delta):
	if $StartTimer.time_left > 1:
		hud.get_node("CountdownContainer/CenterContainer/ActionText").set_text(str(round($StartTimer.time_left)))

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):		
		if $EscMenu.visible:
			$EscMenu.visible = false
			get_tree().paused = false
		else:
			$EscMenu.visible = true
			get_tree().paused = true

func _on_field_goal_left():
	score_player_two += 1
	update_score()
	
	if score_player_two < max_score:
		start_new_round()
	else:
		show_winner("You lose...")
		$AIPaddle/ai_input.game_over = true

func _on_field_goal_right():
	score_player_one += 1
	update_score()
	
	if score_player_one < max_score:
		start_new_round()
	else:
		show_winner("You win!")
		$AIPaddle/ai_input.game_over = true

func start_new_round():
	$Ball.reset()
	$PlayerPaddle.set_position(Vector2(30,256))
	$AIPaddle.set_position(Vector2(994,256))
	hud.get_node("CountdownContainer").set_visible(true)
	$StartTimer.start()

func start_new_game():
	score_player_one = 0
	score_player_two = 0
	update_score()
	$FinalScreen.set_visible(false)
	$AIPaddle/ai_input.game_over = false
	start_new_round()

func _on_start_timer_timeout() -> void:
	hud.get_node("CountdownContainer").set_visible(false)
	$Ball.set_start_direction()

func update_score():
	hud.get_node("PointsDisplay/ScorePlayerOne").set_text(str(score_player_one))
	hud.get_node("PointsDisplay/ScorePlayerTwo").set_text(str(score_player_two))
	
func show_winner(message):
	$FinalScreen.set_visible(true)
	$FinalScreen.get_node("VBoxContainer/ResultMessage").set_text(message)

func _on_final_screen_exit():
	get_tree().quit()

func _on_final_screen_new_round() :
	start_new_game()

func _on_esc_menu_audio_off():
	pass

func _on_esc_menu_quit():
	get_tree().quit()

func _on_esc_menu_start_over():
	start_new_game()
	$EscMenu.set_visible(false)
	get_tree().paused = false
