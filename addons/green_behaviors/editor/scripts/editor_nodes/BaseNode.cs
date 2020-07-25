using System;
using Godot;
using GreenBehaviors;

public class BaseNode : GraphNode {
	public BehaviorTree Tree { get; set; }

	public GreenBehaviors.Node BehaviorNode { get; set; }

	private LineEdit _nameEditor;

	public override void _Ready() {
		_nameEditor = (LineEdit) FindNode("Name");
		if (BehaviorNode == null)
			throw new ApplicationException();
		_nameEditor.Text = BehaviorNode.Name;
		_nameEditor.GrabFocus();
	}

}
