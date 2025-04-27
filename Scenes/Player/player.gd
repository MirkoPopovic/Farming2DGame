extends CharacterBody2D

var speed: int = 100
var motion = Vector2.ZERO

func _physics_process(delta):
	var motion = Vector2.ZERO  # Resetuj motion na početku svakog frejma

	if Input.is_action_pressed("ui_right"):
		motion.x += 1
		$AnimatedSprite2D.play("right_animation")
	elif Input.is_action_pressed("ui_left"):
		motion.x -= 1
		$AnimatedSprite2D.play("left_animation")
	elif Input.is_action_pressed("ui_down"):
		motion.y += 1
		$AnimatedSprite2D.play("down_animation")
	elif Input.is_action_pressed("ui_up"):
		motion.y -= 1
		$AnimatedSprite2D.play("up_animation")
	else:
		$AnimatedSprite2D.play("idile")

	motion = motion.normalized() * speed  # Normalizuj pa pomnoži sa speed
	velocity = motion
	move_and_slide()

	# --- Ograničenje da karakter ne može izaći iz ekrana ---
	var screen_size = get_viewport_rect().size
	var margin = 16  # Polovina širine/visine sprita, prilagodi po potrebi

	global_position.x = clamp(global_position.x, margin, screen_size.x - margin)
	global_position.y = clamp(global_position.y, margin, screen_size.y - margin)
