extends Node2D

@onready var main = get_tree().get_root().get_node("Game")

var Player_Red = preload("res://Scene/Igralec_1.tscn")
var Player_Blue = preload("res://Scene/igralec_2.tscn")

@onready var spawn_points = [
	$Bottom_Right,
	$Bottom_Left,
	$Top_Right,
	$Top_Left
]


func _physics_process(delta: float) -> void:
	if Global.RED_HD:
		Respawn_RED()
		Global.RED_HD = false
		Global.Points_B += 1
		print("Respawning RED! ", + Global.Points_R)

	if Global.BLUE_HD:
		Respawn_BLUE()
		Global.BLUE_HD = false
		Global.Points_R += 1
		print("Respawning BLUE! ", + Global.Points_B)


func Respawn_RED():
	var P_RED = Player_Red.instantiate()
	var Spawn_R = spawn_points[randi() % spawn_points.size()]
	P_RED.position = Spawn_R.position
	main.get_parent().add_child(P_RED)

func Respawn_BLUE():
	var P_BLUE = Player_Blue.instantiate()
	var Spawn_B = spawn_points[randi() % spawn_points.size()]
	P_BLUE.position = Spawn_B.position
	main.get_parent().add_child(P_BLUE)
