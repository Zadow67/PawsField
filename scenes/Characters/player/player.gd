extends CharacterBody2D
class_name Player

@onready var hit_component: HitComponent = $HitComponent

@export var current_tool: Data_types.Tools = Data_types.Tools.None

var player_direction: Vector2

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)

func on_tool_selected(tool: Data_types.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool
