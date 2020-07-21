extends Reference

# enums that represent the different state a node could be in.
enum NodeState {
	# these states travel downtree
	FRESH, #A node that is yet to be _started. Or possibly, reset.
	CANCELLED, # A node that has been explicity CANCELLED.

	# these travel uptree
	SUCCESS, # A node that has succeeded.
	FAILURE, # A node that has failed.
	RUNNING  # A node that is still RUNNING.
}

class_name BehaviorNode

export var name: String;

# State of the node.
export var state := NodeState.FRESH;


func _init(node_name: String = "BehaviorNode") -> void:
	name = node_name;


# Check if the node state is NodeState.Fresh
func is_fresh() -> bool:
	return state == NodeState.FRESH;


# Check if the node state is NodeState.RUNNING
func is_running() -> bool:
	return state == NodeState.RUNNING;


# Check if the node state is NodeState.SUCCESS
func has_succeeded() -> bool:
	return state == NodeState.SUCCESS;


# Check if the node state is NodeState.FAILURE
func has_failed() -> bool:
	return state == NodeState.FAILURE;


# Check if the node state is either NodeState.SUCCESS or NodeState.FAILURE
func has_ended() -> bool:
	return state == NodeState.SUCCESS || state == NodeState.FAILURE;


# Check if the node state is  NodeState.CANCELLED
func was_CANCELLED() -> bool:
	return state == NodeState.CANCELLED;


# Run the behavior in a node.
func  _tick() -> int:
	return NodeState.FAILURE;


# Call __start, __tick and __finish in succession.
# Doesn't call __finish if the node is in the NodeState.RUNNING state after being _ticked.</para>
# Doesn't call _start if the node is already NodeState.RUNNING
# returns the state that the node at the end of this method
func full_tick() -> int:
	if !is_running():
		start();
	var status := _tick();
	if status != NodeState.RUNNING:
		finish(status);
	else:
		 state = NodeState.RUNNING;
	return status;
		

# Start a node. Set's the node in the NodeState.RUNNING state and nodes
# that need prepare anything to be ticked start doing so.
func start() -> void:
	state = NodeState.RUNNING;


# Cancels a node. Set's the node in the NodeState.CANCELLED state and nodes
# that had any machinations RUNNING stop these machinations.
func cancel() -> void:
	state = NodeState.CANCELLED;


# Resets a node. Set's the node in the NodeState.Fresh state and nodes
# that have any state that need to be cleaned out for reuse, clean out so.
func reset() -> void:
	state = NodeState.FRESH;

# Signifies the end of the node's run and set's the node's state to the one
# specified.
func finish(state_incoming: int) -> void:
	state = state_incoming;