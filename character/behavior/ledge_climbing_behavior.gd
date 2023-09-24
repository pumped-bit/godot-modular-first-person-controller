class_name LedgeClimbingBehavior
extends CharacterBehavior


# It was inconsistent when cheched in handle_input method
func physics_update(_delta) -> void:
	if Input.is_action_pressed("move_forward"):
		# The order of checks is probably important, gonna test this laters
		if character.ability_manager.trigger("ClimbBigLedge"): print("Climb Big Ledge!")
		elif character.ability_manager.trigger("ClimbSmallLedge"): print("Climb Small Ledge!")
