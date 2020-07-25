extends EditorInspectorPlugin

class_name BehaviorTreeResourceInspectorPlugin

signal behavior_tree_selected(tree);

func can_handle(object) -> bool:
	return object is BehaviorTree


func parse_begin(object: Object) -> void:
	add_custom_control(SwitchToTreeEditorButton.new(object as BehaviorTree, self))


func switch_to_tree_editor(tree: BehaviorTree) -> void:
	emit_signal("behavior_tree_selected", tree);

"""
func parse_property(object: Object, 
		type: int, 
		path: String, 
		hint: int, 
		hint_text: String, 
		usage: int) -> bool:
	if type == TYPE_OBJECT && object is BehaviorTree:
		print("object: %s, type: %s, path: %s, hint: %s, hint_text: %s, usage: %s" % [
			object, type, path, hint, hint_text, usage
		]);
		return true # I want this one
	return false"""

class SwitchToTreeEditorButton:
	extends Button
	var updating = false

	func _init(tree:BehaviorTree, 
			plugin: BehaviorTreeResourceInspectorPlugin):
		rect_min_size = Vector2(50, 50);
		text = "Show in tree editor";
		connect("pressed", plugin,"switch_to_tree_editor", [tree]);
