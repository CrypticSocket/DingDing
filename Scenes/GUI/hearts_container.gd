extends HBoxContainer

@onready var heartClass = preload("res://Scenes/GUI/heart.tscn")

func addHearts(max : int):
	for i in max:
		var heart = heartClass.instantiate()
		add_child(heart)

func modifyHearts(currentHealth : int):
	var hearts = get_children()
	for i in range(currentHealth):
		hearts[i].modifyHeart(true)
	for i in range(currentHealth, hearts.size()):
		hearts[i].modifyHeart(false)
