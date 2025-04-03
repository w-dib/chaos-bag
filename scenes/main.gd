extends Node2D

@onready var chaos_bag: Area2D = $ChaosBag
@onready var timer: Timer = $Timer
@onready var token: Sprite2D = $Token

var current_difficulty

var easy_tokens: Array[String] = [
	"res://assets/tokens/token_plus_one.png",
	"res://assets/tokens/token_plus_one.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/cultist.png",
	"res://assets/tokens/grave_stone.png",
	"res://assets/tokens/auto_fail.png",
	"res://assets/tokens/elder_sign.png",
]

var standard_tokens: Array[String] = [
	"res://assets/tokens/token_plus_one.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_three.png",
	"res://assets/tokens/token_minus_four.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/cultist.png",
	"res://assets/tokens/grave_stone.png",
	"res://assets/tokens/auto_fail.png",
	"res://assets/tokens/elder_sign.png",
]

var hard_tokens: Array[String] = [
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_three.png",
	"res://assets/tokens/token_minus_three.png",
	"res://assets/tokens/token_minus_four.png",
	"res://assets/tokens/token_minus_five.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/cultist.png",
	"res://assets/tokens/grave_stone.png",
	"res://assets/tokens/auto_fail.png",
	"res://assets/tokens/elder_sign.png",
]

var expert_tokens: Array[String] = [
	"res://assets/tokens/token_zero.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_one.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_two.png",
	"res://assets/tokens/token_minus_three.png",
	"res://assets/tokens/token_minus_three.png",
	"res://assets/tokens/token_minus_four.png",
	"res://assets/tokens/token_minus_four.png",
	"res://assets/tokens/token_minus_five.png",
	"res://assets/tokens/token_minus_six.png",
	"res://assets/tokens/token_minus_eight.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/skull.png",
	"res://assets/tokens/cultist.png",
	"res://assets/tokens/grave_stone.png",
	"res://assets/tokens/auto_fail.png",
	"res://assets/tokens/elder_sign.png",
]

func _ready():
	chaos_bag.connect("clicked", _on_clicked)
	token.hide()

func _on_clicked():
	if not token.visible:
		token.show()
