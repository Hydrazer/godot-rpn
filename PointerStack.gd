extends HBoxContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var STACK = []
var LABEL_VEC = []

signal say_stack

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

func _on_Button_button_down() -> void:
	print("what you doing")
#	print(stack)
	STACK = []
#	LABEL_VEC = []
#	delete_children(self)
#	print(get_node("/root/Game/Background/MarginContainer/Rows/GameInfo/Stack"))
#	print(get_node("Button"))
#	var label = Label.new()
#	print("h")

#	add_child(label)
#	label.set_owner(self)
#	label.set_text('Text')
#	my_label_node.set_global_pos(Vector2(50,50))
#	pass # Replace with function body.


func _on_Button_stack_update(vec) -> void:
	print("HERE")
	LABEL_VEC = []
	delete_children(self)
	STACK = vec
#	STACK.push_back(value)

	for item in STACK:
		var label = Label.new()
		add_child(label)
#		label.add_color_override("font_color", Color(1,0,0,1))
		label.set_owner(self)
		label.set_text(str(item))
		label.add_font_override("font", load("res://DankMono.tres"))
		LABEL_VEC.push_back(label)
	print(len(LABEL_VEC))
#	emit_signal("say_stack")
#	LABEL_VEC	[]
#	pass # Replace with function body.


func _on_StepButton_update_label(ind) -> void:
#	print("we are updating with", label_vec)
#	LABEL_VEC = label_vec
#	delete_children(self)
#	var node_vec = node.get_children()
	var i = 0
	for child in self.get_children():
		if ind == i:
			child.add_color_override("font_color", Color(0,0,1,1))
		else:
			child.add_color_override("font_color", Color(1,1,1,1))
		i += 1
#		if
#		node.remove_child(node_vec[i])
#		node_vec[i]).queue_free()

#		if
#	for label in :
#		node.remove_child(n)
#		n.queue_free()
#		LABEL_VEC = []
#		var labele = Label.new()
#		add_child(labele)
##		label.add_color_override("font_color", Color(1,0,0,1))
#		labele.set_owner(self)
#		labele.set_text(label.text)
#		print(labele.font_color())
#		add_child(label)
#		label.set_owner(self)
#		print("my text be ", label.text)
#		label.set_text(label.get_text())
#		var label = Label.new()
#		add_child(label)
#		label.add_color_override("font_color", Color(1,0,0,1))
#		label.set_owner(self)
#		label.set_text(str(item))
#		LABEL_VEC.push_back(label)
#	print(len(LABEL_VEC))
#	pass # Replace with function body.


