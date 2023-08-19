extends CharacterBody2D

@export var speed = 20
@export var endPoint : Marker2D

@onready var animPlayer = $AnimatedSprite2D

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func _physics_process(delta):
	get_direction()
	get_animation()
	move_and_slide()
	
func get_direction():
	var direction = endPosition - position
	velocity = direction.normalized() * speed
	if(direction.length() < 0.2):
		change_direction()
		
func change_direction():
	var temp = startPosition
	startPosition = endPosition
	endPosition = temp

func get_animation():
	var direction = ""
	if velocity == Vector2.ZERO:
		if animPlayer.is_playing():
			animPlayer.stop()	
	else :
		if velocity.x > 0:
			direction = "Right"
		elif velocity.x < 0:
			direction = "Left"	
		elif velocity.y > 0:
			direction = "Down"
		elif velocity.y < 0:
			direction = "Up"
		
		animPlayer.play("Move" + direction)	
