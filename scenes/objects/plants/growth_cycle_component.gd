class_name GrowthCycleComponent
extends Node

@export var current_growth_state: Data_types.GrowthStates = Data_types.GrowthStates.Germination
@export_range(5, 365) var days_until_harvest: int = 7

signal Crop_maturity
signal Crop_harvesting

var is_watered: bool
var starting_day: int
var current_day: int

func  _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(on_time_tick_day)


func on_time_tick_day(day: int) -> void:
	if is_watered:
		if starting_day == 0:
			starting_day = day

		growth_states(starting_day, day)
		harvest_state(starting_day, day)

func growth_states(starting_day: int, current_day: int):
	if current_growth_state == Data_types.GrowthStates.Maturity:
		return
	
	var number_states = 5
	
	var growth_days_passed = (current_day - starting_day) % number_states
	var state_index = growth_days_passed % number_states + 1

	current_growth_state = state_index

	var name = Data_types.GrowthStates.keys()[current_growth_state]
	print("Current Growth State: ", name, ", State Index: ", state_index)

	if current_growth_state == Data_types.GrowthStates.Maturity:
		Crop_maturity.emit()

func harvest_state(starting_day: int, current_day: int) -> void:
	if current_growth_state == Data_types.GrowthStates.Harvesting:
		return
	
	var days_passed = (current_day - starting_day) % days_until_harvest

	if days_passed == days_until_harvest - 1:
		current_growth_state = Data_types.GrowthStates.Harvesting
		Crop_harvesting.emit()

func get_current_growth_state() -> Data_types.GrowthStates:
	return current_growth_state
