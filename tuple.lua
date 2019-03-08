---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dee.
--- DateTime: 2019/3/7 14:00
--- 元組,對修改關閉
---

tuple = tuple or {}

function tuple.create(i_data)
	assert(type(i_data) == "table", ">> Dee: shoudle create with table")

	local data = {}
	for k,v in pairs(i_data) do
		data[#data+1] = v
	end

	local t = {}

	local __tostring = function()
        return table.concat(data, ",")
    end

    local __index = function(i_t, key)
        if key == "len" then
            return #data
        else
            return nil
        end
    end

    local __newindex = function(i_t, key, v)
        error(">> Dee: Limited access")
    end

    local __pairs = function()
    	error(">> Dee: Limited access")
    end

    local __ipairs = function(i_t)
    	local idx = 0
    	local function iter(i_t)
    		idx = idx + 1
    		if idx <= #data then
    			return idx, data[idx]
    		end
    	end

    	return iter
    end

    local mt = {__tostring = __tostring, __index = __index, __newindex = __newindex, __pairs =__pairs, __ipairs = __ipairs}

    setmetatable(t, mt)

	return t
 end 


return tuple