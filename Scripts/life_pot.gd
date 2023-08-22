extends "res://Scripts/collectible.gd"

@onready var animPlayer = $AnimationPlayer

func collect():
	animPlayer.play("Collected")
	await animPlayer.animation_finished
	super.collect()
