extends Node2D

@onready var sfx_player = $SFXPlayer
@onready var music_player = $MusicPlayer

var sfx = {
	"brick_hit": preload("res://Assets/Sounds/BrickHit.wav"),
	"wall_bounce": preload("res://Assets/Sounds/BrickHit.wav"),
	"power_up": preload("res://Assets/Sounds/PowerUp1.wav"),
	"level_complete": preload("res://Assets/Sounds/LevelComplete.wav"),
	"level_lose": preload("res://Assets/Sounds/LevelLose.wav")
}

var music = {
	"music": preload("res://Assets/Music/LevelMusic.wav")
}

func play_sfx(stream: AudioStream):
	sfx_player.stream = stream
	sfx_player.play()

func play_named_sfx(name: String):
	if sfx.has(name):
		play_sfx(sfx[name])
	else:
		push_warning("SFX not found: " + name)
