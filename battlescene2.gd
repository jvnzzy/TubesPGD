extends Control

var nama = "Monster"
var level = int(20)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/Panel/Label.text = "A wild %s level %s appears" %[nama, level]
	$Playerhp.value = 100
	$monsterhp.value = 100
	$TextureRect/Panel/FightButton.grab_focus() # Replace with function body.

func init(nama, level):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if ($monsterhp.value <= 0):
		get_tree().change_scene("res://Main.tscn")

func _on_FightButton_pressed():
	$TextureRect/Panel/Label.text = "Player Attacked" # Replace with function body.
	$monsterhp.value = $monsterhp.value - 20 # Replace with function body.


func _on_RunButton_pressed():
	get_tree().change_scene("res://Main.tscn")
