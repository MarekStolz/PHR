extends Node2D
class_name GameLevel


var coins_collected := 0

func _ready() -> void:
	pass


func add_coins(ammount: int) -> void:
	coins_collected += ammount
	$UI/Coin/Label.text = str(coins_collected)

