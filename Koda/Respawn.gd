extends Node2D

func _physics_process(delta: float) -> void:
	if Global.RED_HD:
		print("Respawning RED!")
		Global.RED_HD = false
	if Global.BLUE_HD:
		print("Respawning BLUE!")
		Global.BLUE_HD = false
