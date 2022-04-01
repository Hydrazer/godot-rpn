extends Button


signal stack_update(value)

var TEXT: String = ""
var TOKEN_VEC: Array = []
export var STACK_STACK_PATH: NodePath
export var STEP_BUTTON_PATH: NodePath
export var ERROR_LABEL_PATH: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#func _on_Button_button_down() -> void:



func _on_Input_text_changed(new_text: String) -> void:
	TEXT = new_text


func _on_CalculateButton_button_down() -> void:
	TOKEN_VEC = []
	get_node(ERROR_LABEL_PATH).set_text("")
	get_node(STEP_BUTTON_PATH).visible = true
	get_node(STEP_BUTTON_PATH).STACK_IND = -1

	var stack_stack = get_node(STACK_STACK_PATH)

	stack_stack.STACK = []
	stack_stack.delete_children(stack_stack)

	var token_reg: RegEx = RegEx.new()
	token_reg.compile("((?<int>\\d+)|(?<op>[*+-/])|(?<other>\\S+))")

	for t in token_reg.search_all(TEXT):
		var token_int: String = t.get_string("int")
		var token_op: String = t.get_string("op")
		var token_other: String = t.get_string("other")

		if token_int:
			TOKEN_VEC.push_back({"type": "int", "val": token_int})
		elif token_op:
			TOKEN_VEC.push_back({"type": "op", "val": token_op})
		else:
			TOKEN_VEC.push_back({"type": "other", "val": token_other})


	emit_signal("stack_update", TOKEN_VEC)
