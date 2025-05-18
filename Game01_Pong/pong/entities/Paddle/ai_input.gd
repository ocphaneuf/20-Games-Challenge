extends Node

class_name ai_input

@export var ball_path: NodePath
var ball: CharacterBody2D
var paddle

var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_node(ball_path) as CharacterBody2D
	paddle = get_parent()
	paddle.connect("update", Callable(self, "calculate_velocity"))
	
func calculate_velocity():
	if not "direction" in paddle:
		return
	
	if game_over:
		return
	
	paddle.direction = Vector2(0, get_ball_direction())
	
func get_ball_direction():
	if abs(paddle.position.y - ball.position.y) > 20:
		if paddle.position.y < ball.position.y:
			return 1
		else:
			return -1
	else:
		return 0
