extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var index = -1
signal update_label(ind)
signal update_stack(ind)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button2_button_down() -> void:
	index += 1
#	var label_vec = get_node("/root/Game/Background/MarginContainer/Rows/PointerArea/PointerStack").LABEL_VEC

#	for ind in range(label_vec.size()):
##		label = label_vec[ind]
#		if ind == index:
#			label_vec[ind].add_color_override("font_color", Color(1,0,0,1))
#		else:
#			label_vec[ind].add_color_override("font_color", Color(0,0,0,1))
#	print("lv", label_vec)
	emit_signal("update_label", index)
	emit_signal("update_stack", index)
#	label_vec[]
#	print(index)

#	pass # Replace with function body.


#func _on_PointerStack_say_stack() -> void:
#	pass
#	print("BRUH")
#	print(get_node("/root/Game/Background/MarginContainer/Rows/PointerArea/PointerStack").LABEL_VEC)

#	pass # Replace with function body.
