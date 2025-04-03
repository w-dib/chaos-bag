extends TextureButton

@export var button_label: String
@export var focus : bool

var default_color: Color
var default_texture : Texture2D

@onready var label: Label = $Label

signal difficulty_chosen

func _ready() -> void:
	default_texture = texture_normal
	default_color = label.modulate
	label.text = button_label
	
	if focus:
		label.modulate = Color.BLACK
		grab_focus()
	
func _on_pressed() -> void:
	difficulty_chosen.emit(button_label)

func _on_focus_entered() -> void:
	label.modulate = Color.BLACK

func _on_focus_exited() -> void:
	focus = false
	texture_normal = default_texture
	label.modulate = default_color
