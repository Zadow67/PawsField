extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato


func _on_tool_axe_pressed() -> void:
	ToolManager.select_Tool(Data_types.Tools.AxeWood)
	tool_axe.grab_focus()
	
func _on_tool_tilling_pressed() -> void:
	ToolManager.select_Tool(Data_types.Tools.TillGround)
	tool_tilling.grab_focus()

func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_Tool(Data_types.Tools.WaterCrops)
	tool_watering_can.grab_focus()

func _on_tool_corn_pressed() -> void:
	ToolManager.select_Tool(Data_types.Tools.PlantCorn)
	tool_corn.grab_focus()

func _on_tool_tomato_pressed() -> void:
	ToolManager.select_Tool(Data_types.Tools.PlantTomato)
	tool_tomato.grab_focus()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			ToolManager.select_Tool(Data_types.Tools.None)
			tool_axe.release_focus()
			tool_tilling.release_focus()
			tool_corn.release_focus()
			tool_tomato.release_focus()
