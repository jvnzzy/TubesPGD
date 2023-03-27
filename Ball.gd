extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ball = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Ball_body_entered(body):
	ball = ball+int(rand_range(1,10))
	$AnimationPlayer.play("hilg")
	print(ball)
