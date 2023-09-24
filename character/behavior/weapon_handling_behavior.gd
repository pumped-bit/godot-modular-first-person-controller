class_name WeaponHandlingBehavior
extends CharacterBehavior


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	if (Input.is_action_just_pressed("trigger_main")):
		context.weapon_adapter.trigger_main()
	if (Input.is_action_just_released("trigger_main")):
		context.weapon_adapter.on_trigger_main_end()
	if (Input.is_action_just_pressed("trigger_alternative")):
		context.weapon_adapter.trigger_alternative()
	if (Input.is_action_just_released("trigger_alternative")):
		context.weapon_adapter.on_trigger_alternative_end()


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass
