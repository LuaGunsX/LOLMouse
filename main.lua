local LOLMouse = {}

function LOLMouse.Version()
   print("Version: 1.0")
end

LOLMouse.typeof = typeof or (getrawmetatable and function(x) local tt = type(x); if tt == "userdata" then return getrawmetatable(x).__type else return tt end end) or function(x)
    local function try(dt)
        local s = pcall(function() Instance.new(dt.."Value").Value = x end); 
        if s then return dt end
    end
    
    for _, dt in ipairs({"BrickColor","Color3","CFrame","Vector3","Vector2","Ray", "Object"}) do
        if try(dt) then return dt end
    end
end

function LOLMouse.FromRGB(r, g, b) -- by louknt
  return Color3.new(r/255,g/255,b/255)
end

function LOLMouse.FromHEX(hex) -- by louknt (edited by SultanOfSwing)
  hex = hex:gsub("#","")
    return Color3.new(
        tonumber(hex:sub(1,2),16)/255,
        tonumber(hex:sub(3,4),16)/255,
        tonumber(hex:sub(5,6),16)/255
    )
end

function LOLMouse.FromHSV(h, s, v) -- by louknt
  h = h % 1 -- clamp
    local r, g, b

    if s == 0 then
        r, g, b = v, v, v
    else
        local i = math.floor(h * 6)
        local f = h * 6 - i
        local p = v * (1 - s)
        local q = v * (1 - f * s)
        local t = v * (1 - (1 - f) * s)

        i = i % 6
        if i == 0 then
            r, g, b = v, t, p
        elseif i == 1 then
            r, g, b = q, v, p
        elseif i == 2 then
            r, g, b = p, v, t
        elseif i == 3 then
            r, g, b = p, q, v
        elseif i == 4 then
            r, g, b = t, p, v
        elseif i == 5 then
            r, g, b = v, p, q
        end
    end

    return Color3.new(r,g,b)
end

function LOLMouse.ToRGB(col) -- by SultanOfSwing
  return math.floor(col.r*255), math.floor(col.g*255), math.floor(col.b*255)
end

function LOLMouse.GetDescendants(parent) -- by louknt
  local descendants = {}
    local function rec(inst)
        for _, child in ipairs(inst:GetChildren()) do
            table.insert(descendants, child)
            rec(child)
        end
    end
    rec(parent)
    return descendants
end

function LOLMouse.FindFirstChildOfClass(parent, class) -- by louknt
  for _, child in ipairs(parent:GetChildren()) do
        if child.ClassName == class then
            return child
        end
    end
end

function LOLMouse.FindFirstAncestorOfClass(child, class) -- by louknt
   while child.Parent and child.ClassName ~= class do
        child = child.Parent
    end
    return child.ClassName == class and child or nil
end

function LOLMouse.FindFirstAncestorWhichIsA(child, class) -- by louknt
   while child.Parent and not child:IsA(class) do
        child = child.Parent
    end
    return child:IsA(class) and child or nil
end

function LOLMouse.FindFirstChildWhichIsA(child, class) -- by louknt
   for _, v in child:GetChildren() do
        if v:IsA(class) then return v end
    end
    return nil
end

function LOLMouse.GetPropertyChangedSignal(obj, prop) -- by louknt
   local hack = Instance.new("BindableEvent")
    obj.Changed:connect(function(p)
        if p ~= prop then return end
        hack:Fire()
    end)
    return hack.Event
end

function LOLMouse.TweenCreate(object, time, goalProps) -- by SultanOfSwing
  	local startValues = {}
	local deltas = {}
	local color3cache = false

	for prop, goal in pairs(goalProps) do
		local start = object[prop]
		if isColor3(start) and isColor3(goal) then
			color3cache = true
			startValues[prop] = start
			deltas[prop] = Color3.new(
				goal.r - start.r,
				goal.g - start.g,
				goal.b - start.b
			)
		else
			startValues[prop] = start
			deltas[prop] = goal - start
		end
	end

	return {
		Play = function()
			local elapsed = 0
			local connection
			connection = game:GetService("RunService").RenderStepped:connect(function(dt)
				elapsed = elapsed + dt
				local alpha = math.min(elapsed / time, 1) -- THANK GOD this script only uses linear easing..

				for prop, start in pairs(startValues) do
					local delta = deltas[prop]

					if color3cache then
						object[prop] = Color3.new(
							start.r + delta.r * alpha,
							start.g + delta.g * alpha,
							start.b + delta.b * alpha
						)
					else
						object[prop] = start + delta * alpha
					end
				end

				if alpha >= 1 then
					connection:disconnect()
				end
			end)
		end
	}
end

function LOLMouse.UIListLayout(frame, vertical, padding) -- by tobob
  padding = padding or 0

    local function upd()
        local offset = 0
        for _, v in ipairs(frame:GetChildren()) do
            if v:IsA("GuiObject") and v.Visible then
                v.Position = vertical
                    and UDim2.fromOffset(0, offset)
                    or UDim2.fromOffset(offset, 0)

                offset = offset + (vertical and v.AbsoluteSize.Y or v.AbsoluteSize.X) + padding
            end
        end
    end

    frame.ChildAdded:Connect(upd)
    frame.ChildRemoved:Connect(upd)
    upd()
end

function LOLMouse.SendNotification(title, text, icon, duration)
   local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
    RobloxGui.SendNotification:Fire(
        title,
        text,
        icon,
        duration
    )
end

function LOLMouse.HttpGetAsync(url)
   game:HttpGet(url, true)
end

return LOLMouse
