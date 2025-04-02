extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")

@export var speed = 400
@export var rotation_speed = 3

var metek = preload("res://Scene/metek2.tscn")

var healthbar : float

var rotation_direction = 0

func _ready() -> void:
	healthbar = 5

func get_input():
	rotation_direction = Input.get_axis("LEFT", "RIGHT")
	velocity = transform.x * Input.get_axis("DOWN", "UP") * speed

func Health():
	if Global.GotHit_Blue:
		healthbar -= 1
		Global.GotHit_Blue = false
	if healthbar == 0:
		print("BLUE is dead")
		queue_free()
		Global.BLUE_HD = true

func _physics_process(delta):
	Health()
	
	
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	if  Input.is_action_just_pressed("FIRE"):
		Streljaj()
	
	
func Streljaj():
	var metekP = metek.instantiate()
	metekP.dir = rotation
	metekP.pos = $Node2D.global_position
	metekP.rot = global_rotation
	main.get_parent().add_child(metekP)	
