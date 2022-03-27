extends HBoxContainer


var STACK: Array = []
var LABEL_VEC: Array = []

signal say_stack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



static func delete_children(node: Node) -> void:
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func _on_Button_button_down() -> void:
	print("what you doing")
	STACK = []


func _on_StepButton_update_label(ind: int) -> void:
	var i: int = 0
	for child in self.get_children():
		if ind == i:
			child.add_color_override("font_color", Color(0,0,1,1))
		else:
			child.add_color_override("font_color", Color(1,1,1,1))
		i += 1



func _on_CalculateButton_stack_update(vec: Array) -> void:
	print("HERE")
	LABEL_VEC = []
	delete_children(self)
	STACK = vec

	for item in STACK:
		var label: Label = Label.new()
		add_child(label)
		label.set_owner(self)
		label.set_text(str(item))
		label.add_font_override("font", load("res://DankMono.tres"))
		LABEL_VEC.push_back(label)
	print(len(LABEL_VEC))
