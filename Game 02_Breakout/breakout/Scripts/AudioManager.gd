extends Node2D

@onready var sfx_player = $SFXPlayer
@onready var music_player = $MusicPlayer

var sfx = {
	"brick_hit": preload("res://Assets/Sounds/BrickHit.wav"),
	"paddle_hit": preload("res://Assets/Sounds/BallTap.wav"),
	"wall_hit": preload("res://Assets/Sounds/BallTap.wav"),
	"power_up": preload("res://Assets/Sounds/PowerUp1.wav"),
	"level_complete": preload("res://Assets/Sounds/LevelComplete.wav"),
	"level_lose": preload("res://Assets/Sounds/LevelLose.wav")
}

var music = {
	"level_music": preload("res://Assets/Music/LevelMusic.ogg")
}

func play_music(stream: AudioStream):
	music_player.stream = stream
	music_player.play()

func play_named_music(name: String):
	if music.has(name):
		play_music(music[name])
	else:
		push_warning("Music not found: " + name)

func play_sfx(stream: AudioStream):
	sfx_player.stream = stream
	sfx_player.play()

func play_named_sfx(name: String):
	if sfx.has(name):
		play_sfx(sfx[name])
	else:
		push_warning("SFX not found: " + name)
