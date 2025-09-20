extends CanvasLayer

func _process(delta):
	$Label.text = "Coins: " + str(金币.coins)
