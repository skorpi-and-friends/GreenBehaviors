using System;
using Godot;
using GreenBehaviors;

#if TOOLS
[Tool]
public class BehaviorTreeEditor : VBoxContainer
{

	public BehaviorTree Tree { get; set; }

	private GraphEdit _board;

	public override void _Ready()
	{
		_board = GetNode<GraphEdit>("Board");
	}

	public void AddBehaviorNode(GreenBehaviors.Node node)
	{
		GD.Print("Add node");
		PackedScene scene;
		if (node is GreenBehaviors.Decorator.Inverter)
			scene = GD.Load<PackedScene>("res://addons/green_behaviors/editor/scenes/nodes/BehaviorNode.tscn");
		else
			scene = GD.Load<PackedScene>("res://addons/green_behaviors/editor/scenes/nodes/BehaviorNode.tscn");

		var graphNode = (BehaviorNodeEditorGraphNode)scene.Instance();
		graphNode.SetBehaviorNode(node);
		_board.AddChild(graphNode);
	}
}

#endif
