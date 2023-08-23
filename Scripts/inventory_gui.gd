extends Control

@onready var playerInventory = preload("res://Resources/playerInventory.tres")
@onready var slots : Array = $NinePatchRect/GridContainer.get_children()

var isInventoryOpen : bool = false

func _ready():
	updateInventory()

func toggle_inventory():
	isInventoryOpen = !isInventoryOpen
	visible = isInventoryOpen

func updateInventory():
	for i in min(slots.size(), playerInventory.items.size()):
		slots[i].UpdateSlot(playerInventory.items[i])
