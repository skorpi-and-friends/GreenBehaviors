extends BehaviorNode

class_name CompositeNode

# A base class that contains common functionality for nodes that parent
# a number of other nodes.
export var _children_nodes: Array;
var _running_node_index:= -1;

func _init(node_name: String, children: Array).(node_name):
	_children_nodes = children;


# Add children to the composite node. Only allowed when this node is still fresh
# 
# The nodes to be added
# Returns this his node i.e. the node this method was called on. For fluent api considerations.
# Attempting to add to a non fresh node will push an error.
func add_child(new_children: Array) -> CompositeNode:
	if !is_fresh():
		push_error("Node is not fresh. Can only add child when fresh");
	else: 
		for node in new_children:
			_children_nodes.append(node);

	return self;


func start() -> void:
	_running_node_index = 0;
	.start();


func cancel() -> void:
	if ~_running_node_index:
		_children_nodes[_running_node_index].cancel();
	.cancel();


func reset() -> void:
	for child in _children_nodes:
		child.reset();
	_running_node_index = 0;
	.reset();
