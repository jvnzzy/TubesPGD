extends Area2D

export(String, FILE) var next_scene_path = ""
onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = false
	var player = find_parent("CurrentScene").get_children().back().find_node("Player")
	player.connect("player_entering_door_signal", self, "enter_door")
	player.connect("player_entered_door_signal", self, "close_door")
	
func enter_door():
	anim_player.play("BukaPintu")
	
func close_door():
	anim_player.play("TutupPintu")
	
func door_closed():
	get_node(NodePath("/root/SceneManager")).transition_to_scene(next_scene_path)
