extends Button


signal stack_update(value)

var TEXT: String = ""
var TOKEN_VEC: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#func _on_Button_button_down() -> void:



func _on_Input_text_changed(new_text: String) -> void:
	TEXT = new_text


func _on_CalculateButton_button_down() -> void:
	pass # Replace with function body.
	TOKEN_VEC = []
	get_node("/root/Game/StepButton").STACK_IND = -1
	var stack_stack: Node = get_node("/root/Game/Background/MarginContainer/Rows/StackArea/StackStack")
	stack_stack.STACK = []
	stack_stack.delete_children(stack_stack)

	var token_reg: RegEx = RegEx.new()
	token_reg.compile("\\S+")


	for t in token_reg.search_all(TEXT):
		var token: String = t.get_string()
		TOKEN_VEC.push_back(token)

	emit_signal("stack_update", TOKEN_VEC)
