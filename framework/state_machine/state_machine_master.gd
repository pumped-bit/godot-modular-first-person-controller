# Class for managing and monitoring multiple state machines
# Will be updated
class_name StateMachineMaster
extends Node

# Key: state machine name, value: state machine node
var state_machines = {}
# Key: parent state machine name, Value: state name
var current_states = {}


func _ready():
	await owner.ready
	
	for child in get_children():
		if child is StateMachine:
			state_machines[child.name] = child
			current_states[child.name] = child.state.name
			child.state_machine_master = self
			


# Check if state machines have state
func has_state(state_name: String) -> bool:
	return current_states.find_key(state_name) != null


# Update current states dictionary
func set_state(state_machine: StateMachine) -> void:
	current_states[state_machine.name] = state_machine.state.name
	
	print_debug("current states: " + str(current_states))
