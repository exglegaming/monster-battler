extends Control


const GRID_BUTTON_SCENE: PackedScene = preload("uid://d0vg5sgbouxk2")
const MAIN_BUTTONS = {
	Global.State.ATTACK: "Attack",
	Global.State.DEFEND: "Defend",
	Global.State.SWAP: "Swap",
	Global.State.ITEM: "Item",
}

@onready var grid_container: GridContainer = $GridContainer


func _ready() -> void:
	create_grid_buttons(Global.State.MAIN, MAIN_BUTTONS)


func create_grid_buttons(state: Global.State, data: Dictionary) -> void:
	for child: Node in grid_container.get_children():
		child.queue_free()

	for key in data:
		var grid_button: GridButton = GRID_BUTTON_SCENE.instantiate()
		grid_button.setup(state, key, data[key])
		grid_container.add_child(grid_button)
		grid_button.press.connect(_on_button_handler)


func _on_button_handler(state: Global.State, type) -> void:
	print(state)
	print(type)
