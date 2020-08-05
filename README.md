# GreenBehaviors

Behavior trees for godot (C#).

## How to setup

First add as a submodule using the following command.

```shell
git submodule add https://github.com/skorpi-and-friends/GreenBehaviors addons/GreenBehaviors
```

Then add the following to your `.csproj` to link GreenBehaviors.

```xml
  <ItemGroup>
    <ProjectReference Include="addons\GreenBehaviors\GreenBehaviors.csproj" />
  </ItemGroup>
```

That's it.
