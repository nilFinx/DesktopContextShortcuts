-- Registry Context menu Shortcut Library - a library for generating the right click app shortcuts

local md5 = require "md5".sumhexa
local reglib = require "reglib"

local deskbgpath = "HKEY_CLASSES_ROOT\\DesktopBackground\\Shell\\"
local shellpath = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\"


local rcsl = {
    ---@return ct
    new = function(name)
        ---@class ct
        local ct = { id = name:lower(), name = name, _list = {} }
        if not ct.id:find("^[a-zA-Z1-9]+$") then
            ct.id = md5(ct.id)
        end

        -- Adds an app to the ct
        ---@param name string
        ---@param path string
        ---@param icon string
        ---@return boolean
        ct.add = function(name, path, icon)
            local id = name:lower()
            if name == "" then
                return false
            end
            if not id:find("^[a-zA-Z1-9]+$") then
                id = md5(id)
            end

            ct._list[id] = {name = name, path = path, icon = icon or path}

            return true
        end

        -- Build the .reg from a ct
        ---@return boolean|string
        ct.build = function()
            if not next(ct._list) then return false end
            local reg = reglib.new()
            local subcommands = ""
            local deskbgpath = deskbgpath..ct.id.."\\"
            local shellpath = shellpath..ct.id.."."

            for k, v in pairs(ct._list) do
                local sp = shellpath..k.."\\"
                reg[sp.."@"] = v.name
                reg[sp.."Icon"] = v.icon
                reg[sp.."\\command\\@"] = v.path
            end

            reg[deskbgpath.."MUIVerb"] = ct.name
            reg[deskbgpath.."SubCommands"] = subcommands
--[[
            [HKEY_CLASSES_ROOT\DesktopBackground\Shell\GamingMenuPPone]
            "SubCommands"="gamingmenuppone.osu;gamingmenuppone.cortex;gamingmenuppone.ccleaner;gamingmenuppone.steam;gamingmenuppone.epicgames;gamingmenuppone.discord;gamingmenuppone.gdlauncher;"
            "MUIVerb"="GamingMenu ++ v1"

            [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\gamingmenuppone.osu]
            @="Osu"
            "Icon"="C:\\Users\\EggToast\\AppData\\Local\\osu!\\osu!.exe"

            [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\gamingmenuppone.osu\command]
            @="C:\\Users\\EggToast\\AppData\\Local\\osu!\\osu!.exe"
]]

            return reg.build()
        end

        return ct
    end
}

return rcsl