extends HBoxContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var STACK = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()


func _on_StepButton_update_stack(ind) -> void:
#	var stack = []
	var token_vec = get_node("/root/Game/CalculateButton").TOKEN_VEC
	if ind >= token_vec.size():
		return
	var token = token_vec[ind]
	var num_reg = RegEx.new()
	num_reg.compile("\\d+")
	if num_reg.search_all(token):
		STACK.push_back(int(token))
	else:
		var second = STACK.pop_back()
		var first = STACK.pop_back()
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
		var label = Label.new()
		add_child(label)
#		label.add_color_override("font_color", Color(1,0,0,1))
		label.set_owner(self)
		label.set_text(str(item))
		label.add_font_override("font", load("res://DankMono.tres"))
#		LABEL_VEC.push_back(label)
#		add_child(item)
#	pass # Replace with function body.