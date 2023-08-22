extends CanvasLayer

@onready var inventoryGUI = $InventoryGUI

signal inventoryToggled

func _input(event):
	if event.is_action_pressed("ToggleInventory"):
		inventoryGUI.toggle_inventory()
		inventoryToggled.emit()
