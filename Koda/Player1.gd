extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")
@onready var F = $HealthBar_P1/full_health
@onready var M = $HealthBar_P1/mid_health
@onready var E = $HealthBar_P1/end_health 

var healthbar : float

var F_bool = false
var M_bool = false
var E_bool = false

@export var speed = 400
@export var rotation_speed = 3

var metek = preload("res://Scene/metek.tscn")

var rotation_direction = 0

func _ready() -> void:
	healthbar = 3
	F.show()
	M.show()
	E.show()
	

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

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
	
		if  Input.is_action_just_pressed("SPACE"):
			Streljaj()
	
func Health():
	if Global.GotHit_Red:
		healthbar -= 1
		Global.GotHit_Red = false
		
	if healthbar == 2:
		F_bool = true
		return
		
	if healthbar == 1:
		M_bool = true
		
	if healthbar == 0:
		print("RED is dead")
		M_bool = true
		queue_free()
		Global.RED_HD = true
	
	
		
func Streljaj():
	var metekP = metek.instantiate()
	metekP.dir = rotation
	metekP.pos = $"Točka(x,y)".global_position
	metekP.rot = global_rotation
	main.get_parent().add_child(metekP)	
