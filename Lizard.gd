extends Area2D

var nama = "lizard"
var level = int(11)

func _ready():
	pass 

func _on_Lizard_body_entered(body):
	print("player")
	get_tree().change_scene("res://BattleScene2.tscn")
		
