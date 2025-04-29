extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	#Calls func that return vector2 based on input from scripts/game_input_event.dg
	direction = GameInputEvents.movement_input()
	
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idile_up")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idile_down")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idile_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idile_right")
	else:
		animated_sprite_2d.play("idile_down")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movment_input():
		transition.emit("Walk")
	
	if GameInputEvents.use_tool():
		if player.current_tool == DataTypes.Tools.axeWood:
			transition.emit("chopping")
		elif player.current_tool == DataTypes.Tools.tillGround:
			transition.emit("tilling")
		elif player.current_tool == DataTypes.Tools.watherCrops:
			transition.emit("watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
