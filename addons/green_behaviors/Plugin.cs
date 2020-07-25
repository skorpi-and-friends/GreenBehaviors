using System;
using Godot;
using GreenBehaviors;

#if TOOLS
[Tool]
public class Plugin : EditorPlugin {
	const string MainScreenTabName = "Green Behaviors";

	private BehaviorTreeInspectorPlugin _inspectorPlugin;

	private BehaviorTreeEditor _mainScreenTreeEditorInstance;
	private EditorInterface _editorInterface;

	public override void _EnterTree() {
		var mainScreenEditorScene = GD.Load<PackedScene>(
			"res://addons/green_behaviors/editor/scenes/main_screen_editor.tscn");
		GD.Print(mainScreenEditorScene.Instance().GetType());
		_mainScreenTreeEditorInstance = (BehaviorTreeEditor) mainScreenEditorScene.Instance();
		GD.Print("we got here");
		GD.Print(_mainScreenTreeEditorInstance == null);
		_mainScreenTreeEditorInstance.AnchorRight = 1;
		_mainScreenTreeEditorInstance.AnchorBottom = 1;
		_mainScreenTreeEditorInstance.MarginLeft = 0;
		_mainScreenTreeEditorInstance.MarginBottom = 0;

		_editorInterface = GetEditorInterface();
		_editorInterface.GetEditorViewport().AddChild(_mainScreenTreeEditorInstance);

		MakeVisible(false);

		AddCustomType(
			"BehaviorTree", "Resource",
			GreenBehaviorScripts.BehaviorTree,
			GD.Load<Texture>("res://icon.png"));

		_inspectorPlugin = new BehaviorTreeInspectorPlugin();
		_inspectorPlugin.Connect(
			nameof(BehaviorTreeInspectorPlugin.BehaviorTreeSelected),
			this, nameof(ShowEditor));
		AddInspectorPlugin(_inspectorPlugin);
	}

	public override void _ExitTree() {

		RemoveCustomType("BehaviorTree");
		RemoveInspectorPlugin(_inspectorPlugin);
		_mainScreenTreeEditorInstance.QueueFree();
	}

	public override bool HasMainScreen() => true;

	public override string GetPluginName() => MainScreenTabName;

	private void ShowEditor(BehaviorTree tree) {
		_editorInterface.SetMainScreenEditor(MainScreenTabName);
	}

	public override void MakeVisible(bool visible) {
		if (visible)
			_mainScreenTreeEditorInstance.Show();
		else {
			_mainScreenTreeEditorInstance?.Hide();
		}
	}
}

#endif
