extends Timer

var mons1 = preload("res://Demon.tscn")
var mons2 = preload("res://Lizard.tscn")
var mons3 = preload("res://Wraith.tscn")
var mons4 = preload("res://NagaKicik.tscn")

func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	var monsters = [mons1,mons2,mons3,mons4]
	var kinds = monsters[randi()% monsters.size()]
	var monster = kinds.instance()
	monster.position = Vector2(rand_range(10,990),rand_range(10,598))
	add_child(monster)
	wait_time = rand_range(0,1)
