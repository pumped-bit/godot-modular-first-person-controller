# Class to manage child node abilities
class_name AbilityManager
extends Node

# Key: ability name, value: ability object
var abilities = {}
# Store abilities that are on cooldown
var _abilities_on_cooldown = []
var _abilities_on_duration = []


func _ready() -> void:
	init()


func _process(delta) -> void:
	_reduce_remaining_durations(delta)
	_reduce_cooldowns(delta)


func restore_uses(_name: String) -> void:
	abilities.get(_name).restore_uses()


func init() -> void:
	# Add all abilities to the list
	for child in get_children():
		if child is Ability:
			abilities[child.name] = child
			child.init()


# Return true if trigges is successful
func trigger(_name: String) -> bool:
	var ability: Ability = abilities.get(_name)
	if ability.trigger():
		if !ability.is_instant: _abilities_on_duration.append(ability)
		if ability.has_cooldown: _abilities_on_cooldown.append(ability)
		return true
	return false


func _reduce_remaining_durations(delta) -> void:
	if !_abilities_on_duration.is_empty():
		for ability in _abilities_on_duration:
			if ability.is_executing():
				ability.current_duration -= delta
			else:
				ability.on_duration_ends()
				ability.restore_duration()
				_abilities_on_duration.erase(ability)


func _reduce_cooldowns(delta) -> void:
	if !_abilities_on_cooldown.is_empty():
		for ability in _abilities_on_cooldown:
			if ability.is_on_cooldown():
				ability.current_cooldown -= delta
			else:
				ability.on_cooldown_ends()
				ability.restore_cooldown()
				_abilities_on_cooldown.erase(ability)
			
