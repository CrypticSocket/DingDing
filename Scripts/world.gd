extends Node2D

@onready var player = $Player
@onready var heartsContainer = $GUI/heartsContainer

func _ready():
	heartsContainer.addHearts(player.maxHealth)
	heartsContainer.modifyHearts(player.currentHealth)
	player.playerHealthChanged.connect(heartsContainer.modifyHearts)
