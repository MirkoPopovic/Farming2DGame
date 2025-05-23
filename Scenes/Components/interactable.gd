class_name IneractableComponent
extends Area2D

signal interactable_activated
signal interactable_deactivated



func _on_body_exited(body: Node2D) -> void:
	interactable_deactivated.emit()


func _on_body_entered(body: Node2D) -> void:
	interactable_activated.emit()
