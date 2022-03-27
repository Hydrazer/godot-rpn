extends HBoxContainer


var STACK: Array = []
export var CALCULATE_BUTTON_PATH: NodePath

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

	var token: String = token_vec[ind]
	var num_reg: RegEx = RegEx.new()
	num_reg.compile("\\d+")

	if num_reg.search_all(token):
		STACK.push_back(token)
	else:
		var second: int = STACK.pop_back() as int
		var first: int = STACK.pop_back() as int
		if token == "+":
			STACK.push_back(first + second)
		elif token == "-":
			STACK.push_back(first - second)
		elif token == "/":
			STACK.push_back(first / second)
		elif token == "*":
			STACK.push_back(first * second)
	delete_children(self)

	for item in STACK:
		var label: Label = Label.new()
		add_child(label)
		label.set_owner(self)
		label.set_text(item as String)
		label.add_font_override("font", load("res://DankMono.tres"))
