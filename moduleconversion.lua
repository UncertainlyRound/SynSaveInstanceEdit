local savedmodules = {}
local randomuser = game.Players:GetNameFromUserIdAsync(math.random(1000000, 100000000)) 

local function stringToTable(str)
    local t = {}
    for i = 1, #str do
        t[i] = str:sub(i, i)
    end
    return t
end

function GetAncestralTree(v : Instance)
    local ancestraltree = {}
    local current = v.Parent
    while current ~= nil do
        table.insert(ancestraltree, current)
        current = current.Parent
    end
    local currentTable = {}
    local items = #ancestraltree
    for i, v in ipairs(ancestraltree) do
        currentTable[items + 1 - i] = v
    end
    table.insert(currentTable, v)
    return currentTable
end

local validchars = {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "_"}
local alphabet = {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m"}

function checkstring(str : string)
    local valid = true
    if table.find(alphabet, string.lower(string.sub(str, 1, 1))) then
        for i, v in ipairs(stringToTable(str)) do
            if table.find(validchars, string.lower(v)) then
            else
                valid = false
            end
        end
    else
        valid = false
    end
    return valid
end

function InstanceToPath(v : Instance)
    local tree = GetAncestralTree(v)
    local currentpath = ""
    if tree[1]:IsA("DataModel") then
        currentpath = "game"
    else
        currentpath = tree[1].Name
    end
    for i, v in ipairs(tree) do
        if i > 1 then
            if checkstring(v.Name) then
                currentpath = currentpath .. "." .. v.Name
            else
                currentpath = currentpath .. '["' .. v.Name .. '"]'
            end
        end
    end
    return currentpath
end

local function stringify(obj)
    local finalstring = typeof(obj)
    if typeof(obj) == "CFrame" then
        finalstring = "CFrame.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "number" then
        finalstring = tostring(obj)
    elseif typeof(obj) == "Vector3" then
        finalstring = "Vector3.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "Instance" then
        finalstring = InstanceToPath(obj)
    elseif typeof(obj) == "string" then
    	local tab = stringToTable(obj)
    	local current = ""
    	if not table.find(tab, '"') then
      	  current = '"' .. obj .. '"'
        elseif not table.find(tab, "'") then
        	current = "'" .. obj .. "'"
        else
        	current = "[[" .. obj .. "]]"
        end
        finalstring = string.gsub(current, "\n", "\\n")
    elseif typeof(obj) == "table" then
        finalstring = "{"
        for index, value in pairs(obj) do
            if typeof(index) == "number" then
    			finalstring = finalstring .. "[" .. tostring(index) .. "] = " .. stringify(value) .. ", "
		    elseif typeof(index) == "string" then
		    	if checkstring(index) then
		    		finalstring = finalstring .. index .. " = " .. stringify(value) .. ", "
		    	else
    				finalstring = finalstring .. "[" .. stringify(index) .. "] = " .. stringify(value) .. ", "
  		  	end
  		  else
  		  	finalstring = finalstring .. "[" .. stringify(index) .. "] = " .. stringify(value) .. ", "
 		   end
        end
        finalstring = finalstring .. "}"
    elseif typeof(obj) == "boolean" then
        finalstring = tostring(obj)
    elseif typeof(obj) == "UDim" then
        finalstring = "UDim.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "UDim2" then
        finalstring = "UDim2.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "BrickColor" then
        finalstring = "BrickColor.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "Color3" then
        finalstring = "Color3.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "Vector2" then
        finalstring = "Vector2.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "EnumItem" then
        finalstring = tostring(obj)
    elseif typeof(obj) == "NumberSequence" then
        finalstring = "NumberSequence.new({"
        for index = 1, #obj.Keypoints do
            local key = obj.Keypoints[index]
            finalstring = finalstring .. "NumberSequenceKeypoint.new(" .. tostring(key.Time) .. ", " .. tostring(key.Value)
            if key.Envelope then
                finalstring = finalstring .. ", " .. tostring(key.Envelope)
            end
        end
        finalstring = finalstring .. "), "
        finalstring = finalstring .. "})"
    elseif typeof(obj) == "ColorSequence" then
        finalstring = "ColorSequence.new({"
        for index = 1, #obj.Keypoints do
            local key = obj.Keypoints[index]
            finalstring = finalstring .. "ColorSequenceKeypoint.new(" .. tostring(key.Time) .. ", Color3.new(" .. tostring(key.Value) .. ")), "
        end
        finalstring = finalstring .. "})"
    elseif typeof(obj) == "NumberRange" then
        finalstring = "NumberRange.new(" .. obj.Min .. ", " .. obj.Max .. ")"
    elseif typeof(obj) == "Rect" then
        finalstring = "Rect.new(" .. tostring(obj) .. ")"
    elseif typeof(obj) == "function" then
        finalstring = "function() end"
    end
    return finalstring
end

for i, v in ipairs(game:GetDescendants()) do
	if v:IsA("ModuleScript") then
		if v.Name ~= "PlayerModule" then
			if not v:FindFirstAncestor("PlayerModule") then
				if v:FindFirstAncestorOfClass("Workspace") or v:FindFirstAncestorOfClass("Players") or v:FindFirstAncestorOfClass("Lighting") or v:FindFirstAncestorOfClass("MaterialService") or v:FindFirstAncestorOfClass("NetworkClient") or v:FindFirstAncestorOfClass("ReplicatedFirst") or v:FindFirstAncestorOfClass("ReplicatedStorage") or v:FindFirstAncestorOfClass("StarterGui") or v:FindFirstAncestorOfClass("StarterPack") or v:FindFirstAncestorOfClass("StarterPlayer") or v:FindFirstAncestorOfClass("Teams") or v:FindFirstAncestorOfClass("SoundService") or v:FindFirstAncestorOfClass("TextChatService") then
					local success, data = pcall(function()
						print(v:GetFullName())
						local newscript = "local module = {}\n\n--Module Saver Scripted by @ForleakenRBLX\n\n"
						for i, v in pairs(require(module)) do
							if typeof(i) == "number" then
 							   	newscript = newscript .. "module[" .. tostring(i) .. "] = " .. stringify(v) .. "\n"
							    elseif typeof(i) == "string" then
  							  	if checkstring(i) then
    									newscript = newscript .. "module." .. i .. " = " .. stringify(v) .. "\n"
 							   	else
  							  		newscript = newscript .. "module[" .. stringify(i) .. "] = " .. stringify(v) .. "\n"
							    	end
 							   else
   							 	newscript = newscript .. "module[" .. stringify(i) .. "] = " .. stringify(v) .. "\n"
							end
						end
						newscript = newscript .. "\nreturn module"
						if string.find(newscript, game.Players.LocalPlayer.Name) then newscript = string.gsub(newscript, game.Players.LocalPlayer.Name, randomuser) end
						savedmodules[v:GetFullName()] = newscript
					end)
					if not success then
          		    			savedmodules[v:GetFullName()] = "--Module save failed. Error:\n--" .. data .. "\n\n" .. decompile(v)
       		  			end
				end
			end
		end
	end
end

_G.savedmodules = savedmodules
