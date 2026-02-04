class_name GridButton
extends Button


signal press(state: Global.State, type)

var state: Global.State
var type


func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	press.emit(state, type)


func setup(menu_state: Global.State, button_type, button_text: String) -> void:
	text = button_text
	state = menu_state
	type = button_type
