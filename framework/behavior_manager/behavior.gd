# Continuous action
class_name Behavior
extends Node

# Compile-time activation bool
@export var is_enabled: bool = true
# Runtime activation bool
@export var is_activated: bool = true

# Inialize behavior
func init() -> void:
	pass


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass
