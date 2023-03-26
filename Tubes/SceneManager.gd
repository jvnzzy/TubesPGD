extends Node2D

var next_scene = null

func _ready():
	pass

func transition_to_scene(new_scene: String):
	next_scene = new_scene
	$SceneTransition/AnimationPlayer.play("FadeToBlack")
	
func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(load(next_scene).instance())
	$SceneTransition/AnimationPlayer.play("FadeToNormal")
