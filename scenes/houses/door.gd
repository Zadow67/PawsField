extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var intractable_component: InteractableComponent = $IntractableComponent

func _ready() -> void:
	intractable_component.interactable_activated.connect(on_interactable_activated)
	intractable_component.interactable_disabled.connect(on_interactable_disabled)
	collision_layer = 1


func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	collision_layer = 2
	print("activated Door")
	
func on_interactable_disabled() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
	print("Disabled Door")
