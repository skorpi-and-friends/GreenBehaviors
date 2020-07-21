extends EditorInspectorPlugin

func can_handle(object):
	object is BehaviorNode

func parse_property(object, 
		type, 
		path, 
		hint, 
		hint_text, usage):
	if type == TYPE_OBJECT && object is BehaviorNode:
		add_property_editor(path, MyEditor.new())
		return true # I want this one

	return false

class MyEditor:
	extends Control
	var updating = false

	func _init():
		var button := Button.new();
		button.text = "Show in tree editor";
		add_child(button);