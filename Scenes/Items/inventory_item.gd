@tool
extends Node2D

@export var item_type : String = ""
@export var item_name : String = ""
@export var item_value : String = ""
@export var item_texture : Texture

@onready var icon_sprite = $Sprite2D
@onready var interact_ui = $Interact_ui

var player_in_range = false

func _ready() -> void:
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture
	

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture
	if player_in_range and Input.is_action_just_pressed("pick_up"):
		pickup_item()

func pickup_item():
	var item = {
		"quantity" : 1,
		"item_type" : item_type,
		"item_name" : item_name,
		"item_value" : item_value,
		"item_texture" : item_texture,
	}
	if Global.player_node:
		Global.add_item(item)
		self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_range = true
		interact_ui.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_range = false
		interact_ui.visible = false
