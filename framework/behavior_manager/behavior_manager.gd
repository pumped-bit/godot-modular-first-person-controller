# Class to manage child node behaviors
class_name BehaviorManager
extends Node

# Key: behavior name, value: behavior object
var behaviors = {}


func _ready() -> void:
	init()


func init() -> void:
	# Add all behavior to the list
	for child in get_children():
		if child is Behavior and child.is_enabled:
			behaviors[child.name] = child
			child.init()


func activate(_name: String):
	behaviors.get(_name).is_activated = true


func deactivate(_name: String):
	behaviors.get(_name).is_activated = false


func is_behavior_activated(_name: String):
	return behaviors.get(_name).is_activated


func get_behavior(_name: String):
	return behaviors.get(_name)


func handle_behaviors_input(event: InputEvent) -> void:
	for behavior in behaviors.values():
		if behavior.is_activated: behavior.handle_input(event)


func behaviors_update(delta: float) -> void:
	for behavior in behaviors.values():
		if behavior.is_activated: behavior.update(delta)


func behaviors_physics_update(delta: float) -> void:
	for behavior in behaviors.values():
		if behavior.is_activated: behavior.physics_update(delta)
