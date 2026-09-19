extends Node

@export var cursor_component_texture: Texture2D
@export var cursor_size: Vector2 = Vector2(32, 32)

func _ready() -> void:
	var image = cursor_component_texture.get_image()
	image.resize(cursor_size.x, cursor_size.y)
	var texture = ImageTexture.create_from_image(image)

	Input.set_custom_mouse_cursor(texture, Input.CURSOR_ARROW)
