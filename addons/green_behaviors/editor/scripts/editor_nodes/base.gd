extends GraphNode

class_name BehaviorTreeEditorNode

var behavior_node: BehaviorNode setget _set_behavior;

onready var _name_editor := find_node("Name") as LineEdit;

func _ready() -> void:
	assert(behavior_node)
	_name_editor.text = behavior_node.name;
	_name_editor.grab_focus();

func _set_behavior(bh_node: BehaviorNode) -> void:
	behavior_node = bh_node;
