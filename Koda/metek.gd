extends CharacterBody2D

@export var Speed = 900

var dir : float
var pos : Vector2
var rot : float

func _ready() -> void:
	global_position = pos
	global_rotation = rot
	$Timer.start()

func _physics_process(delta: float) -> void:
	velocity = Vector2(Speed, 0).rotated(dir)
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()
		if collider and collider.is_in_group("walls"):
			var normal = collision.get_normal()
			velocity = velocity.bounce(normal)  # Correctly update velocity
			dir = velocity.angle()  # Update direction so it doesn't reset next frame
		if collider.is_in_group("igralec1"):
			queue_free()
		if collider.is_in_group("igralec2"):
			queue_free()
			
func _on_timer_timeout() -> void:
	print("end")
	queue_free()
