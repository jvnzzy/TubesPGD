extends Control

var nama = "Naga Kicik"
var level = int(11)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/Panel/Label.text = "A wild %s level %s appears" %[nama, level] # Replace with function body.
	$TextureRect/Panel/FightButton.grab_focus()
	$Playerhp.value = 100
	$monsterhp.value = 100
	
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
	$monsterhp.value = $monsterhp.value - 20
	

func _on_RunButton_pressed():
	get_tree().change_scene("res://Main.tscn")
