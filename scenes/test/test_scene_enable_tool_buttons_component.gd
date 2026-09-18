extends Node

func _ready() -> void:
	call_deferred("enable_tool_buttons")
	
func enable_tool_buttons() -> void:
	ToolManager.enable_tool_button(Data_types.Tools.TillGround)
	ToolManager.enable_tool_button(Data_types.Tools.WaterCrops)
	ToolManager.enable_tool_button(Data_types.Tools.PlantCorn)
	ToolManager.enable_tool_button(Data_types.Tools.PlantTomato)
