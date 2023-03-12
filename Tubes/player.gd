extends CharacterBody2D

var walk_speed = 4.0
const tile = 16

var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var gerak = false
var persen = 0.0

func _ready():
	initial_position = position

func _physics_process(delta):
	if(gerak == false):
		process_player_input()
	elif(input_direction != Vector2.ZERO):
		move(delta)
	else:
		gerak = false

func process_player_input():
	if(input_direction.y == 0):
		input_direction.x = int(Input.is_action_just_pressed("kanan")) - int(Input.is_action_just_pressed("kiri"))
	if(input_direction.x == 0):
		input_direction.y = int(Input.is_action_just_pressed("bawah")) - int(Input.is_action_just_pressed("atas"))
	
	if(input_direction != Vector2.ZERO):
		initial_position = position
		gerak = true
	
func move(delta):
	persen += walk_speed * delta
	if(persen >= 1.0):
		position = initial_position +(tile * input_direction * persen)
		persen = 0.0
		gerak = false
	
	
