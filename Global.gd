extends Node

var inventory = []

#Player stats
var inventory_size : int = 10

#Signals
signal inventory_update

var player_node: Node = null

func _redy():
	inventory.resize(inventory_size)

func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["name"] == item["name"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_update.emit()
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_update.emit()
			return true
		return false

func remove_item():
	inventory_update.emit()

func increase_inventory_size():
	inventory_update.emit()

func set_player_reference(player):
	player_node = player
