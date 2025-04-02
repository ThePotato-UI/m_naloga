extends Node

var navaden_Tekst = ""

func _physics_process(delta: float) -> void:
	var tekst_R = str(navaden_Tekst, str(Global.Points_R))
	$"../točke/Točke_B".text = (tekst_R)
	
	var tekst_B = str(navaden_Tekst, str(Global.Points_B))
	$"../točke/Točke_R".text = (tekst_B)
