extends Node2D

var entered = false

var main = "res://Main.tscn"

func _on_Exit_body_entered(body):
	if entered:
		get_tree().change_scene(main)


func _on_Exit_body_exited(body):
	entered = true
