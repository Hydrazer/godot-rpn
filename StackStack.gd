extends HBoxContainer


var STACK: Array = []
export var CALCULATE_BUTTON_PATH: NodePath
export var STEP_BUTTON_PATH: NodePath
export var ERROR_LABEL_PATH: NodePath

func _ready() -> void:
	pass # Replace with function body.



static func delete_children(node: Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()


func _on_StepButton_update_stack(ind: int) -> void:
	var token_vec: Array = get_node(CALCULATE_BUTTON_PATH).TOKEN_VEC
	if ind >= token_vec.size():
		return

	var token: Dictionary = token_vec[ind]

	if token["type"] == "int":
		STACK.push_back(token["val"])
	elif token["type"] == "op":
		if STACK.size() < 2:
			get_node(STEP_BUTTON_PATH).visible = false
			get_node(ERROR_LABEL_PATH).set_text("Not Enough Numbers")
		else:
			var second: int = STACK.pop_back() as int
			var first: int = STACK.pop_back() as int
			var token_val = token["val"]
			if token_val == "+":
				STACK.push_back(first + second)
			elif token_val == "-":
				STACK.push_back(first - second)
			elif token_val == "/":
				STACK.push_back(first / second)
			elif token_val == "*":
				STACK.push_back(first * second)
	else:
		get_node(STEP_BUTTON_PATH).visible = false
		get_node(ERROR_LABEL_PATH).set_text("Invalid Operand")


	delete_children(self)

	for item in STACK:
		var label: Label = Label.new()
		add_child(label)
		label.set_owner(self)
		label.set_text(item as String)
		label.add_font_override("font", load("res://DankMono.tres"))
