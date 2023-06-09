extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_OptionsButton_pressed():
	var options = load("res://Options.tscn").instance()
	get_tree().current_scene.add_child(options)


func _on_QuitButton_pressed():
	get_tree().quit()
