extends Node2D

@onready var chaos_bag: Area2D = $ChaosBag
@onready var timer: Timer = $Timer
@onready var token: Sprite2D = $Token
@onready var original_scale: Vector2  = token.scale

var current_difficulty: Array[String]

var token_textures := {
	"auto_fail": preload("res://assets/tokens/auto_fail.png"),
	"bless": preload("res://assets/tokens/bless.png"),
	"cultist": preload("res://assets/tokens/cultist.png"),
	"curse": preload("res://assets/tokens/curse.png"),
	"elder_sign": preload("res://assets/tokens/elder_sign.png"),
	"elder_thing": preload("res://assets/tokens/elder_thing.png"),
	"frost": preload("res://assets/tokens/frost.png"),
	"grave_stone": preload("res://assets/tokens/grave_stone.png"),
	"skull": preload("res://assets/tokens/skull.png"),
	"token_minus_eight": preload("res://assets/tokens/token_minus_eight.png"),
	"token_minus_five": preload("res://assets/tokens/token_minus_five.png"),
	"token_minus_four": preload("res://assets/tokens/token_minus_four.png"),
	"token_minus_three": preload("res://assets/tokens/token_minus_three.png"),
	"token_minus_two": preload("res://assets/tokens/token_minus_two.png"),
	"token_minus_one": preload("res://assets/tokens/token_minus_one.png"),
	"token_minus_six": preload("res://assets/tokens/token_minus_six.png"),
	"token_minus_seven": preload("res://assets/tokens/token_minus_seven.png"),
	"token_plus_one": preload("res://assets/tokens/token_plus_one.png"),
	"token_zero": preload("res://assets/tokens/token_zero.png"),
}

var easy_tokens: Array[String] = [
	"token_plus_one", "token_plus_one",
	"token_zero", "token_zero", "token_zero",
	"token_minus_one", "token_minus_one", "token_minus_one",
	"token_minus_two", "token_minus_two",
	"skull", "skull",
	"cultist",
	"grave_stone",
	"auto_fail",
	"elder_sign"
]

var standard_tokens: Array[String] = [
	"token_plus_one",
	"token_zero", "token_zero",
	"token_minus_one", "token_minus_one", "token_minus_one",
	"token_minus_two", "token_minus_two",
	"token_minus_three",
	"token_minus_four",
	"skull", "skull",
	"cultist",
	"grave_stone",
	"auto_fail",
	"elder_sign"
]

var hard_tokens: Array[String] = [
	"token_zero", "token_zero", "token_zero",
	"token_minus_one", "token_minus_one",
	"token_minus_two", "token_minus_two",
	"token_minus_three", "token_minus_three",
	"token_minus_four",
	"token_minus_five",
	"skull", "skull",
	"cultist",
	"grave_stone",
	"auto_fail",
	"elder_sign"
]

var expert_tokens: Array[String] = [
	"token_zero",
	"token_minus_one", "token_minus_one",
	"token_minus_two", "token_minus_two",
	"token_minus_three", "token_minus_three",
	"token_minus_four", "token_minus_four",
	"token_minus_five",
	"token_minus_six",
	"token_minus_eight",
	"skull", "skull",
	"cultist",
	"grave_stone",
	"auto_fail",
	"elder_sign"
]

var final_token_key: String
var cycle_count := 0
var max_cycles := 12

func _ready():
	current_difficulty = standard_tokens
	chaos_bag.connect("clicked", _on_clicked)
	timer.timeout.connect(_on_timer_timeout)
	token.hide()
	
func _on_clicked():
	current_difficulty.shuffle()
	final_token_key = current_difficulty[0]
	cycle_count = 0
	timer.start()
	if not token.visible:
		token.show()

func _on_timer_timeout():
	if cycle_count < max_cycles:
		var random_key = current_difficulty[randi() % current_difficulty.size()]
		token.texture = token_textures.get(random_key)
		cycle_count += 1
	else:
		timer.stop()
		token.texture = token_textures.get(final_token_key)
		var tween = get_tree().create_tween()
		tween.tween_property(token, "scale", Vector2(original_scale * 1.3), 0.1)
		tween.set_trans(Tween.TRANS_SINE)
		tween.tween_property(token, "scale", Vector2(original_scale * 0.8), 0.1)
		tween.tween_property(token, "scale", Vector2(original_scale * 1), 0.1)
