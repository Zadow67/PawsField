extends Node

var selected_tool: Data_types.Tools = Data_types.Tools.None

signal tool_selected(tool: Data_types.Tools)
signal  enable_tool(tool: Data_types.Tools)

func select_Tool(tool: Data_types.Tools) -> void:
	tool_selected.emit(tool)
	selected_tool = tool

func enable_tool_button(tool: Data_types.Tools) -> void:
	enable_tool.emit(tool)
