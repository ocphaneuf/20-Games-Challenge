extends CharacterBody2D

@export var initial_ball_speed := 300
@export var speed_accumulator := 50
var ball_speed = initial_ball_speed

var hitcounter := 0
var max_hitcounter := 12
var direction := Vector2()

func _ready():
	$Background_Music.play()
	randomize()

func set_start_direction():
	var random_x := 0.0
	
	if randf() < 0.5:
		random_x = -1
	else:
		random_x = 1
	
	direction = Vector2(random_x, randf() * 0.6 - 0.3)
	direction = direction.normalized() * ball_speed
	
func _physics_process(delta):
	velocity = direction
	move_and_slide()
	
	var collision = get_last_slide_collision()
	if collision:
		direction = direction.bounce(collision.get_normal())
		
		if collision.get_collider().is_in_group("paddles"):
			var collider = collision.get_collider()
			var paddle_y = direction.y
			
			if collider is CharacterBody2D:
				paddle_y += collider.velocity.y / 2
				
			direction = Vector2(direction.x, paddle_y).normalized() * (ball_speed + hitcounter * speed_accumulator)
			
			if hitcounter < max_hitcounter:
				hitcounter += 1
				
			$Paddle_Hit_Sound.play()
		else:
			$Wall_Hit_Sound.play()
			
func reset():
	position = Vector2(512,256)
	direction = Vector2()
	hitcounter = 0
