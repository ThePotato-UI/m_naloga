extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")

var GOTHIT : bool
var healthbar : float

@export var speed = 400
@export var rotation_speed = 3

var metek = preload("res://Scene/metek.tscn")

var rotation_direction = 0

func _ready() -> void:
	healthbar = 5
	GOTHIT = false

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	Health()
	if healthbar == 0:
		print("RED is dead")
		queue_free()
	
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	if  Input.is_action_just_pressed("SPACE"):
		Streljaj()
	
func Health():
	if GOTHIT:
		healthbar -= 1
		GOTHIT = false
	
		
func Streljaj():
	var metekP = metek.instantiate()
	metekP.dir = rotation
	metekP.pos = $Node2D.global_position
	metekP.rot = global_rotation
	main.get_parent().add_child(metekP)	


func _on_življenje_area_entered(area: Area2D) -> void:
	if area.is_in_group("METEK1"):
		GOTHIT = true
	if area.is_in_group("METEK2"):
		GOTHIT = true
