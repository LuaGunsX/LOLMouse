# Documentation
## LOLMouse.Version()
Prints the version.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.Version()
```
## LOLMouse.GetDescendants()
Returns a array that contains all of the descendants of an object.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.GetDescendants(game.Workspace)
```
## LOLMouse.ToRGB
Converts a color to RGB.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.ToRGB(0.5, 0.25, 1)
```
## LOLMouse.FromRGB()
Converts RGB to a color.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.ToRGB(255, 0, 0)
```
## LOLMouse.FromHSV()
Converts HSV to a color.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FromHSV(0, 1, 1)
```
## LOLMouse.FromHEX()
Converts HEX to a color.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FromHEX("ff0000")
```
## LOLMouse.FindFirstChildOfClass()
Returns the first child of the Instance whose ClassName is equal to the given class name.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FindFirstChildOfClass(game.Workspace.Model, "Part")
```
## LOLMouse.FindFirstAncestorOfClass()
Returns the first ancestor of the Instance whose ClassName is equal to the given className.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FindFirstAncestorOfClass(game.Workspace.Model.Part, "Model")
```
## LOLMouse.FindFirstAncestorWhichIsA()
Returns the first ancestor of the Instance for whom Object:IsA() returns true for the given className.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FindFirstAncestorWhichIsA(game.Workspace.Model.Part, "Model")
```
## LOLMouse.FindFirstChildWhichIsA()
Returns the first child of the Instance for whom Object:IsA() returns true for the given className.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.FindFirstChildWhichIsA(game.Workspace.Model, "Part")
```
## LOLMouse.GetPropertyChangedSignal()
This method returns an event that behaves exactly like the Changed event, except that it only fires when the given property changes.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.Version(game.Workspace.Part, "Position")
```
## LOLMouse.TweenCreate()
This constructor creates a new Tween from three arguments: the object to tween, the TweenInfo specifications, and a table containing the properties to tween and values to tween to.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.TweenCreate(game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame, 3, goalProps)
```
## LOLMouse.UIListLayout()
Positions sibling UI elements in rows or columns within the parent UI container. Change the second variable to true if you want it vertical, change to false if you want it horizontal.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.UIListLayout(script.Parent, false, 0)
```
## LOLMouse.SendNotification()
Sends a CoreGUI notification.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.SendNotification("Notification", "Hello world!", "rbxassetid://0", 3)
```
## LOLMouse.HttpGetAsync()
This method sends an HTTP GET request. It functions similarly to RequestAsync() except that it accepts HTTP request parameters as method parameters instead of a single dictionary and returns only the body of the HTTP response.
### Usage
```lua
local LOLMouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaGunsX/LOLMouse/refs/heads/main/main.lua"))()
LOLMouse.HttpGetAsync("https://example.com")
```
