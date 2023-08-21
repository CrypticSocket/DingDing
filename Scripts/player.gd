extends CharacterBody2D

@export var speed = 50
@export var maxHealth = 3
@export var knockbackPower = 500

@onready var currentHealth = maxHealth
@onready var animPlayer = $AnimationPlayer

signal playerHealthChanged

func get_input():
	var velocity_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = velocity_direction * speed
	
func get_animation():
	var direction = ""
	if velocity == Vector2.ZERO:
		if animPlayer.is_playing():
			animPlayer.stop()	
	else :
		if velocity.x > 0:
			direction = "Right"
		if velocity.x < 0:
			direction = "Left"	
		if velocity.y > 0:
			direction = "Down"
		if velocity.y < 0:
			direction = "Up"
		
		animPlayer.play("Move" + direction)	
			

func _physics_process(delta):
	get_input()
	get_animation()
	move_and_slide()


func _on_hit_box_area_entered(area : Area2D):
	if area.name == "hitBox":
		currentHealth -= 1
		if(currentHealth == 0):
			currentHealth = maxHealth
		playerHealthChanged.emit(currentHealth)
		knockBack(area.get_parent().velocity)
		
func knockBack(enemyVelocity):
	var knockBackVelocity = (enemyVelocity - velocity) * knockbackPower
	velocity = knockBackVelocity
	move_and_slide()
