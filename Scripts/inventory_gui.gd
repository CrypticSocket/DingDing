extends Control

var isInventoryOpen : bool = false

func toggle_inventory():
	isInventoryOpen = !isInventoryOpen
	visible = isInventoryOpen
