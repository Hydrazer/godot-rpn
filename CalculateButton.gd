extends Button


signal stack_update(value)

var TEXT = ""
var TOKEN_VEC = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Button_button_down() -> void:
	TOKEN_VEC = []
	get_node("/root/Game/StepButton").index = -1
	var stack_stack = get_node("/root/Game/Background/MarginContainer/Rows/StackArea/StackStack")
	stack_stack.STACK = []
	stack_stack.delete_children(stack_stack)

	var token_reg = RegEx.new()
	token_reg.compile("\\S+")


	for token in token_reg.search_all(TEXT):
		token = token.get_string()
		TOKEN_VEC.push_back(token)

	emit_signal("stack_update", TOKEN_VEC)


func _on_Input_text_changed(new_text: String) -> void:
	TEXT = new_text
