extends Button


var STACK_IND: int = -1

signal update_label(ind)
signal update_stack(ind)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_StepButton_button_down() -> void:
	STACK_IND += 1
	emit_signal("update_label", STACK_IND)
	emit_signal("update_stack", STACK_IND)
