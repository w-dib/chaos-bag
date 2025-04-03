extends Area2D

@onready var bag_sprite: Sprite2D = $BagSprite
@onready var original_scale: Vector2 = bag_sprite.scale

signal clicked 

func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(bag_sprite, "scale", Vector2(original_scale * 1.2), 0.2)
	tween.parallel().tween_property(bag_sprite, "modulate", Color(1.2, 1.2, 1.4, 1), 0.2)

func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(bag_sprite, "scale", Vector2(original_scale * 1), 0.2)
	tween.parallel().tween_property(bag_sprite, "modulate", Color(1, 1, 1, 1), 0.2)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		clicked.emit()
