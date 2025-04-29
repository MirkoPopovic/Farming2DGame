extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable: IneractableComponent = $Interactable
func _ready() -> void:
	interactable.interactable_activated.connect(on_interactable_activated)
	interactable.interactable_deactivated.connect(on_interactable_deactivated)

func on_interactable_activated():
	animated_sprite_2d.play("open_door")
	collision_layer = 2

func on_interactable_deactivated():
	animated_sprite_2d.play("close_door")
	collision_layer = 1
