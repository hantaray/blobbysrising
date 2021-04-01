extends Node



# scene vars
const startscreen_path = "res://start_screen/StartScreen.tscn"
var current_scene_path
const gameover_path = "res://gameover_screen/GameOverScreen.tscn"

# movement vars
var playerSpeed = 600
var enemyTruckSpeed = 800
var enemyCarSpeed = 800
var bouncyblob_y = -500

# life vars 
var lifes = 5



# Called when the node enters the scene tree for the first time.
func _ready():	
	get_tree().change_scene("res://start_screen/StartScreen.tscn")
	


func decrease_lives(life):
	lifes -= life
	update_lives_hud()
	if lifes <= 0:
		game_over()
		

func reset_lifes() :
	lifes = 5


func update_lives_hud():
	get_tree().call_group("HUD", "update_lives_hud", lifes)
	

func game_over():
	get_tree().change_scene(gameover_path)
	
