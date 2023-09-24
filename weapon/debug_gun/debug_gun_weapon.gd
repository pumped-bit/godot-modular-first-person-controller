class_name DebugWeapon
extends Weapon


func trigger_main_start() -> bool:
	return false


func trigger_main_end() -> bool:
	return false


func trigger_alternative_start() -> bool:
	return false


func trigger_alternative_end() -> bool:
	return false


func reload() -> bool:
	return false


func _trigger_shootable_start(_name: String) -> bool:
	return shootables.get(_name).trigger_start()


func _trigger_shootable_end(_name: String) -> bool:
	return shootables.get(_name).trigger_end()
