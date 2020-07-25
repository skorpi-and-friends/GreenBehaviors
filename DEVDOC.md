# GreenBehaviors - GODOT

## To-do

- [ ] tree editor

## design-doc

### Features

- [ ] Tree Editor
- [ ] C# btree

## dev-log

## Mono plugins: Refreshing the plugin

Writing GDScript plugins, you just have to deactivate and activate the plugin for the editor to update it from your code. I guess it's obvious (now that I think aboutit) that when working with Mono, you need to rebuild the project. Not even restarting Godot will help.

## Mono plugins: tool class not recognizing non tool classes

http://github.com/godotengine/godot/issues/36395

As thus some of the scripts for the editor will have to be tool.
