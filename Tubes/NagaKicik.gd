extends Area2D

var nama = "naga kicik"
var level = int(11)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NagaKicik_body_entered(body):
	print("player")
	get_tree().change_scene("res://BattleScene.tscn")
		
