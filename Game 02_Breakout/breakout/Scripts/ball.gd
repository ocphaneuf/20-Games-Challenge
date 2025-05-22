extends CharacterBody2D

@export var initial_ball_speed := 300
@export var speed_accumulator := 10
var ball_speed = initial_ball_speed

var hitcounter := 0
var max_hitcounter := 30
var direction := Vector2()

func _ready():
	randomize()

func set_start_direction():
	var angle = deg_to_rad(randf_range(45.0, 135.0))
	direction = Vector2(cos(angle), sin(angle)).normalized() * ball_speed

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and direction == Vector2.ZERO:
		set_start_direction()
	
func _physics_process(delta):
	velocity = direction
	move_and_slide()
	
	var collision = get_last_slide_collision()
	if collision:
		var collider = collision.get_collider()
		
		#Brick collision via Tilemap
		if collider is TileMap:
			var tilemap =  collider
			var tile_pos = tilemap.local_to_map(collision.get_position())
			var tile_data = tilemap.get_cell_tile_data(1, tile_pos)
			
			if tile_data != null:
				var brick_type = tile_data.get_custom_data("brick_type")
				if brick_type != null and brick_type != "":
					tilemap.set_cell(1, tile_pos, -1) #Remove brick
					AudioManager.play_named_sfx("brick_hit")
		
		#Paddle collision
		elif collider.is_in_group("paddles"):
			var paddle_x = direction.x
			
			if collider is CharacterBody2D:
				paddle_x += collider.velocity.x / 2 #Padle influence
			
			direction = Vector2(paddle_x, -abs(direction.y)).normalized() * (ball_speed + hitcounter * speed_accumulator)
			
			if hitcounter < max_hitcounter:
				hitcounter += 1
			
			AudioManager.play_named_sfx("paddle_hit")
		
		else:
			AudioManager.play_named_sfx("wall_hit")
		
		#Always bounce off the surface normal
		direction = direction.bounce(collision.get_normal())

func reset():
	position = Vector2(512,700)
	direction = Vector2()
	hitcounter = 0
