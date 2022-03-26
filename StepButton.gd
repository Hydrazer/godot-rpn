extends Button


var index = -1
signal update_label(ind)
signal update_stack(ind)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Button2_button_down() -> void:
	index += 1
	emit_signal("update_label", index)
	emit_signal("update_stack", index)
