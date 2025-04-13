extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")
@onready var F = $HealthBar_P2/full_health
@onready var M = $HealthBar_P2/mid_health
@onready var E = $HealthBar_P2/end_health 

var F_bool = false
var M_bool = false
var E_bool = false

@export var speed = 400  
@export var rotation_speed = 3

var metek = preload("res://Scene/metek2.tscn")

var healthbar : float

var rotation_direction = 0

func _ready() -> void:
	healthbar = 3
	F.show()
	M.show()
	E.show()

func get_input():
	rotation_direction = Input.get_axis("LEFT", "RIGHT")
	velocity = transform.x * Input.get_axis("DOWN", "UP") * speed

func Health():
	if Global.GotHit_Blue:
		healthbar -= 1
		Global.GotHit_Blue = false
		
	if healthbar == 2:
		F_bool = true
		return
		
	if healthbar == 1:
		M_bool = true
		
	if healthbar == 0:
		print("BLUE is dead")
		E_bool = true
		queue_free()
		Global.BLUE_HD = true

func _physics_process(delta):
	if !Global.Is_paused:
		Health()
		
		if F_bool:
			F.hide()
			F_bool = false
		if M_bool:
			M.hide()
			M_bool = false
		if E_bool:
			E.hide()
			E_bool = false
	
		get_input()
		rotation += rotation_direction * rotation_speed * delta
		move_and_slide()
	
		if  Input.is_action_just_pressed("FIRE"):
			Streljaj()
	
	
func Streljaj():
	var metekP = metek.instantiate()
	metekP.dir = rotation
	metekP.pos = $"Točka(x,y)".global_position
	metekP.rot = global_rotation
	main.get_parent().add_child(metekP)	
