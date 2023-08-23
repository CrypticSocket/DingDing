extends Panel

@onready var slotSprite : Sprite2D = $Slot
@onready var itemSprite : Sprite2D = $CenterContainer/Panel/Item

func UpdateSlot(item : InventoryItem):
	if !item:
		slotSprite.frame = 0
		itemSprite.visible = false
	else : 
		slotSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture
