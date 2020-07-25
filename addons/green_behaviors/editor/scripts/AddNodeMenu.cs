using System;
using Godot;

#if TOOLS
[Tool]
public class AddNodeMenu : MenuButton
{
	[Export] public NodePath root_path;

	private BehaviorTreeEditor _editorRoot;

	public override void _Ready()
	{
		_editorRoot = GetNode<BehaviorTreeEditor>(root_path);

		System.Diagnostics.Debug.Assert(_editorRoot != null);

		var popup = GetPopup();
		popup.Connect("index_pressed", this, nameof(IndexPressed));

	}


	private void IndexPressed(int index)
	{
		GD.Print("Got here");
		switch (index)
		{
			case 0:
				_editorRoot.AddBehaviorNode(new GreenBehaviors.Composite.Filter("New node"));
				break;
		}
	}
}
#endif
