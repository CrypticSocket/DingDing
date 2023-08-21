extends Panel

@onready var heartSprite : Sprite2D = $Sprite2D

func modifyHeart(isWhole : bool):
	if(isWhole):
		heartSprite.frame = 0
	else :
		heartSprite.frame = 4
