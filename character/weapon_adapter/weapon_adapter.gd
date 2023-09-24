class_name WeaponAdapter
extends Node3D

@export var context: CharacterContext

# Key: weapon name, value = weapon object
var weapons_equiped = {}
var current_weapon: Weapon


func trigger_main() -> void:
	current_weapon.trigger_main_start()


func on_trigger_main_end() -> void:
	current_weapon.on_trigger_main_end()


func trigger_alternative() -> void:
	current_weapon.trigger_alternative_start()


func on_trigger_alternative_end() -> void:
	current_weapon.on_trigger_alternative_end()


func trigger_reload() -> void:
	pass


func trigger_swap() -> void:
	pass


func reload() -> void:
	pass
