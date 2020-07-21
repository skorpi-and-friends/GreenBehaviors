extends CompositeNode

"""
A composite nodes that ticks all its children in turn until one of them succeeds.
Returns if none succeeds. If one of them reports and continues from this running
node the next time its ticked.
"""
class_name Selector


func _init(node_name: String, children: Array).(node_name,children):
	pass


func _tick() -> int:
	while _running_node_index < len(_children_nodes):
		match _children_nodes[_running_node_index].full_tick():
			NodeState.SUCCESS:
				return NodeState.SUCCESS;
			NodeState.RUNNING:
				return NodeState.RUNNING;
			NodeState.FAILURE:
				_running_node_index += 1;
				break;
	return NodeState.FAILURE;