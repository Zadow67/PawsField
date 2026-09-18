class_name  FeedComponent
extends Area2D

signal Food_received(area: Area2D)

func _on_area_entered(area: Area2D) -> void:
	Food_received.emit(area)
