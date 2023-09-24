class_name Weapon
extends Node3D


var is_active: bool = false
var shootables = {}


func init():
	for child in get_children():
		if child is Shootable:
			shootables[child.name] = child


func trigger_main_start() -> bool:
	return false


func on_trigger_main_end() -> bool:
	return false


func trigger_alternative_start() -> bool:
	return false


func on_trigger_alternative_end() -> bool:
	return false


func reload() -> bool:
	return false


func _trigger_shootable_start(_name: String) -> bool:
	return shootables.get(_name).trigger_start()


func _trigger_shootable_end(_name: String) -> bool:
	return shootables.get(_name).trigger_end()
