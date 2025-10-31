-- .reg library, pretty barebones but can do what I want it to

local reglib = {
    -- Create a new .reg file (stub)
    new = function()
        local reg = {_list = {}}

        -- Builds it to a .reg file
        ---@return boolean|string
        function reg.build()
            if not next(reg._list) then return false end
            local rt = "Windows Registry Editor Version 5.00"

            for path, list in pairs(reg._list) do
                rt = rt.."\n\n["..path.."]"
                for k, v in pairs(list) do
                    local k = k == "@" and k or '"'..k..'"'
                    local v = type(v) == "string" and '"'..v..'"' or error("Unsupported value: "..tostring(v))
                    rt = rt.."\n"..k.."="..v
                end
            end

            return rt
        end

        setmetatable(reg, {
            __index = function(t, k)
                local path = k:match("^(.+)[/%\\].-$")
                local name = k:match("^.+[/%\\](.-)$")
                if not rawget(t._list, path) then
                    rawset(t._list, path, {})
                end
                return t._list[path][name]
            end,
            __newindex = function(t, k, v)
                local path = k:match("^(.+)[/%\\].-$")
                local name = k:match("^.+[/%\\](.-)$")
                if not rawget(t._list, path) then -- Ultra edge case only?
                    rawset(t._list, path, {})
                end
                t._list[path][name] = v
            end
        })

        return reg
    end,
    -- Create some nice globals
    globals = function()
        HKCC = "HKEY_CURRENT_CONFIG"
        HKCR = "HKEY_CLASSES_ROOT"
        HKCU = "HKEY_CURRENT_USER"
        HKLM = "HKEY_LOCAL_MACHINE"
    end
}

return reglib