extends HBoxContainer


var STACK: Array = []
export var CALCULATE_BUTTON_PATH: NodePath
export var STEP_BUTTON_PATH: NodePath
export var ERROR_LABEL_PATH: NodePath
export var EXPR_LABEL_PATH: NodePath
export var DANK_MONO_30: Font

func _ready() -> void:
	pass # Replace with function body.



static func delete_children(node: Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()


func _on_StepButton_update_stack(ind: int) -> void:
	var token_vec: Array = get_node(CALCULATE_BUTTON_PATH).TOKEN_VEC
	var token: Dictionary = token_vec[ind]
	get_node(EXPR_LABEL_PATH).set_text("")

	if token["type"] == "int":
		STACK.push_back(token["val"])
	elif token["type"] == "op":
		if STACK.size() < 2:
			get_node(STEP_BUTTON_PATH).visible = false
			get_node(ERROR_LABEL_PATH).set_text("Not Enough Numbers")
			var first: String = STACK[-1] if STACK.size() > 0 else " "

			get_node(EXPR_LABEL_PATH).set_text("[{f}] [ ] {op} => ".format({"f": first, "op": token["val"]}))
		else:
			var second: int = STACK.pop_back() as int
			var first: int = STACK.pop_back() as int
			var op: String = token["val"]
			var expr_res: int
			if op == "+":
				expr_res = first + second
			elif op == "-":
				expr_res = first - second
			elif op == "/":
				expr_res = first / second
			elif op == "*":
				expr_res = first * second

			get_node(EXPR_LABEL_PATH).set_text("[{f}] [{s}] {op} => {res}".format({"f": first, "s": second, "op": op, "res": expr_res}))
			STACK.push_back(expr_res)

	else:
		get_node(STEP_BUTTON_PATH).visible = false
		get_node(ERROR_LABEL_PATH).set_text(
			"Invalid Operand `{op}`. Use [{op_list}]".format({
				"op": token["val"],
				"op_list": get_node(CALCULATE_BUTTON_PATH).OPERAND_LIST_ORIG.join(", ")
			})
		)


	delete_children(self)

	for item in STACK:
		var label: Label = Label.new()
		add_child(label)
		label.set_owner(self)
		label.set_text(item as String)
		label.add_font_override("font", DANK_MONO_30)

	if ind >= token_vec.size() - 1:
		get_node(STEP_BUTTON_PATH).visible = false
		return
