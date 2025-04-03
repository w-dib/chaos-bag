extends Node2D

@onready var chaos_bag: Area2D = $ChaosBag
@onready var timer: Timer = $Timer

func _ready():
	chaos_bag.connect("clicked", _on_clicked)

func _on_clicked():
	print("Clicked")
