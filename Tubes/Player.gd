extends KinematicBody2D

signal player_entering_door_signal
signal player_entered_door_signal

export var speed = 80.0
export var walk_speed = 4.0
const TILE_SIZE = 16

onready var ray = $RayCast2D
onready var door_ray = $PintuRayCast2D

enum PlayerState {IDLE, TURNING, WALKING}

var player_state = PlayerState.IDLE

var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var percent_moved_to_next_tile = 0.0
var is_moving = false
var stop_input:bool = false

func _ready():
	$Sprite.visible =true

func _physics_process(delta):
	#if player_state == PlayerState.TURNING or stop_input:
		#return
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("kanan"):
		velocity.x += 1.0
	if Input.is_action_pressed("kiri"):
		velocity.x -= 1.0
	if Input.is_action_pressed("atas"):
		velocity.y -= 1.0
	if Input.is_action_pressed("bawah"):
		velocity.y += 1.0
	velocity = velocity.normalized()
	
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
		pass
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position",velocity)
		$AnimationTree.set("parameters/Walk/blend_position",velocity)
		move_and_slide(velocity*speed)

func entered_door():
	emit_signal("player_entered_door_signal")
	
func move(delta):
	var desired_step: Vector2 = input_direction*TILE_SIZE/2
	ray.cast_to = desired_step
	ray.force_raycast_update()
	
	door_ray.cast_to = desired_step
	door_ray.force_raycast_update()

	if door_ray.is_colliding():
		if percent_moved_to_next_tile == 0.0:
			emit_signal("player_entering_door_signal")
		percent_moved_to_next_tile += walk_speed*delta
		if percent_moved_to_next_tile >= 1.0:
			position = initial_position + (input_direction*TILE_SIZE)
			percent_moved_to_next_tile = 0.0
			is_moving = false
			stop_input = true
			$AnimationPlayer.play("Disappear")
			$Camera2D.clear_current()
		else:
			position = initial_position + (input_direction*TILE_SIZE*percent_moved_to_next_tile)
