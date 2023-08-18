extends Camera2D

@export var tileMap : TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tileMap.get_used_rect()
	var tileSize = tileMap.cell_quadrant_size
	var sizeInPixel = mapRect.size * tileSize
	limit_left = 0
	limit_top = 0
	limit_right = sizeInPixel.x
	limit_bottom = sizeInPixel.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
