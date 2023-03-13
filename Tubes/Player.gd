extends KinematicBody2D


export var walk_speed = 4.0
const tile = 16

var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var gerak = false
var persen = 0.0

func _ready():
	pass
func _physics_process(delta):
	if(gerak == false):
		process_player_input()
	elif(input_direction != Vector2.ZERO):
		move(delta)
	else:
		gerak = false
	if(get_slide_count()>0):
			for i in get_slide_count():
				var benda = get_slide_collision(i)
				if(benda.collider is RigidBody2D):
					benda.collider.apply_central_impulse(input_direction)

func process_player_input():
	if(input_direction.y == 0):
		input_direction.x = int(Input.is_action_pressed("kanan")) - int(Input.is_action_pressed("kiri"))
	if(input_direction.x == 0):
		input_direction.y = int(Input.is_action_pressed("bawah")) - int(Input.is_action_pressed("atas"))
	
	if(input_direction != Vector2.ZERO):
		initial_position = position
		gerak = true
	
func move(delta):
	persen += walk_speed * delta
	if(persen >= 1.0):
		position = initial_position +(tile * input_direction * persen)
		persen = 0.0
		gerak = false
		
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
