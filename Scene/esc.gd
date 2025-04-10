extends StaticBody2D

var paused = "ODMOR"
var resumed = ""


func _ready() -> void:
	$RichTextLabel.text = (resumed)
	$RESUME.hide()
	$QUIT.hide()
	$Ozadje.hide()

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		Global.Is_paused = true
		$RichTextLabel.text = (paused)
		$RESUME.show()
		$QUIT.show()
		$Ozadje.show()
	

func _on_resume_pressed() -> void:
	Global.Is_paused = false
	$RichTextLabel.text = (resumed)
	$RESUME.hide()
	$QUIT.hide()
	$Ozadje.hide()



func _on_quit_pressed() -> void:
	get_tree().quit()
