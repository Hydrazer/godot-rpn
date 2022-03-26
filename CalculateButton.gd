extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

signal stack_update(value)

var TEXT = ""
var TOKEN_VEC = []
#var stack = []
#regex.compile("\\w-(\\d+)")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_button_down() -> void:
	TOKEN_VEC = []
	get_node("/root/Game/StepButton").index = -1
#	get_node("/root/Game/Background/MarginContainer/Rows/StackArea/StackStack").STACK = []
	var stack_stack = get_node("/root/Game/Background/MarginContainer/Rows/StackArea/StackStack")
	stack_stack.STACK = []
	stack_stack.delete_children(stack_stack)
#	get_node("/root/Game/Background/MarginContainer/Rows/StackArea/StackStack").delete_node() = []

#	var stack = []
	var token_reg = RegEx.new()
	token_reg.compile("\\S+")


	var stack_node = get_node("/root/Game/Background/MarginContainer/Rows/PointerArea/PointerStack")
	print(stack_node.STACK)

#	var stack = []
#	var token_vec = []
	for token in token_reg.search_all(TEXT):
		token = token.get_string()
		TOKEN_VEC.push_back(token)
#		emit_signal("stack_update", token)
#		stack_node.stack.push_back(token)
#	print(get_node("Background/MarginContainer/Rows/GameInfo/Stack").run())
	emit_signal("stack_update", TOKEN_VEC)

#	print(stack[0])

#	add_child()


func _on_Input_text_changed(new_text: String) -> void:
	TEXT = new_text
#	pass # Replace with function body.
