extends CanvasLayer

func _process(delta):
	if has_node("CoinLabel"):
		$CoinLabel.text = "Coins: " + str(金币.coins)
