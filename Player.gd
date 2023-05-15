extends KinematicBody2D

export var speed = 80.0

var house = null setget set_house

func set_house(new_house):
	if new_house != null:
		$KeyPrompt.show()
		$Prompt.play("KeyPrompt")
	else:
		$KeyPrompt.hide()
		$Prompt.stop()
		
	house = new_house
	
func _ready():
	set_house(null)
	
func _unhandled_input(event):
	if event is InputEventKey and event.is_action_pressed("interact") and house != null:
		house.enter()

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("kanan"):
		velocity.x += 1.0
	if Input.is_action_pressed("kiri"):
		velocity.x -= 1.0
	if Input.is_action_pressed("atas"):
		velocity.y -= 1.0
	if Input.is_action_pressed("bawah"):
		velocity.y += 1.0
	if Input.is_action_pressed("esc"):
		get_tree().change_scene("res://Menu.tscn")
	velocity = velocity.normalized()
	
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
		pass
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position",velocity)
		$AnimationTree.set("parameters/Walk/blend_position",velocity)
		move_and_slide(velocity*speed)
	
	
	
