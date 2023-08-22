extends Node2D

@onready var player = $Player
@onready var heartsContainer = $GUI/heartsContainer

var isPaused : bool = false

func _ready():
	heartsContainer.addHearts(player.maxHealth)
	heartsContainer.modifyHearts(player.currentHealth)
	player.playerHealthChanged.connect(heartsContainer.modifyHearts)
	
func _on_gui_inventory_toggled():
	get_tree().paused = !isPaused
	isPaused = !isPaused
