extends Node2D

var ballon_scene = preload("res://dialogue/game_dialogue_balloon.tscn")

@onready var intractable_component: InteractableComponent = $IntractableComponent
@onready var interactabel_lable_component: Control = $InteractabelLableComponent

var in_range: bool

func _ready() -> void:
	intractable_component.interactable_activated.connect(on_interactable_activated)
	intractable_component.interactable_disabled.connect(on_interactable_disabled)
	interactabel_lable_component.hide()
	
	GameDialogueManager.give_crop_seeds.connect(on_give_crop_seeds)
	
func on_interactable_activated() -> void:
	interactabel_lable_component.show()
	in_range = true


func on_interactable_disabled() -> void:
	interactabel_lable_component.hide()
	in_range = false
	
func _unhandled_input(event: InputEvent) -> void:
	if in_range:
		if event.is_action_pressed("Show_dialogue"):
			var ballon: BaseGameDialogueBalloon = ballon_scene.instantiate()
			get_tree().root.add_child(ballon)
			ballon.start(load("res://dialogue/conversations/guide.dialogue"), "start")

func on_give_crop_seeds() -> void:
	ToolManager.enable_tool_button(Data_types.Tools.TillGround)
	ToolManager.enable_tool_button(Data_types.Tools.WaterCrops)
	ToolManager.enable_tool_button(Data_types.Tools.PlantCorn)
	ToolManager.enable_tool_button(Data_types.Tools.PlantTomato)
