extends TextureButton

@export var button_label: String

@onready var label: Label = $Label

signal difficulty_chosen

func _ready() -> void:
	label.text = button_label

func _on_pressed() -> void:
	difficulty_chosen.emit(button_label)
