class_name State
extends Node

var state_machine: StateMachine = null
var parent_state: State = null

func _ready() -> void:
# Set the parent state if the state has a parent in the hierarchy.
	var parent = get_parent()
	if parent is State:
		parent_state = parent

## Override this function in child classes to handle input events.
func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
# Override this function in child classes to update the state.
	pass

func physics_update(_delta: float) -> void:
# Override this function in child classes to update the state using physics calculations.
	pass

func enter(_msg := {}) -> void:
# Override this function in child classes to perform initialization when entering the state.
	pass

func exit() -> void:
# Override this function in child classes to clean up the state before exiting.
	pass
