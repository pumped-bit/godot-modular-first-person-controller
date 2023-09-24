# Action that can be triggered
# Ability also can be used as trigger to enter some state
class_name Ability
extends Node

@export var is_enabled: bool	
@export var is_instant: bool
@export var duration: float
@export var has_cooldown: bool
@export var cooldown_time: float
@export var has_multiple_uses: bool
@export var max_uses_count: int

var current_cooldown: float
var uses_remaining: int
var current_duration: float


func init() -> void:
	uses_remaining = max_uses_count


func trigger() -> bool:
	if can_execute():
		_execute()
	
		if has_cooldown: current_cooldown = cooldown_time
		if !is_instant: current_duration = duration
		uses_remaining -= 1
		return true
	return false


func on_duration_ends():
	pass


func on_cooldown_ends():
	pass


func restore_uses() -> void:
	uses_remaining = max_uses_count


func restore_cooldown() -> void:
	current_cooldown = 0


func restore_duration() -> void:
	current_duration = 0


func is_executing() -> bool:
	return current_duration > 0


func is_on_cooldown() -> bool: 
	return current_cooldown > 0


# Returns true if has available actions
func has_available_triggers() -> bool:
	return uses_remaining > 0


# Returns true if conditions are met for the ability
func can_execute() -> bool:
	return _default_execute_condition()


func _execute() -> void:
	pass


func _default_execute_condition() -> bool:
	return (is_enabled 
	and (!has_cooldown or !is_on_cooldown())
	and (is_instant or !is_executing())
	and (has_available_triggers() if has_multiple_uses else true))
