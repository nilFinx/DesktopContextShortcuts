--GamingMenu++ Gaming y [ExampleGame;%UserProfile%\Downloads\ExampleGame\play.exe;nil] [Cortex;C:\\Program Files (x86)\\Razer\\Razer Cortex\\RazerCortex.exe;nil]
print("Checking configs...")
if #arg >= 3 then
menuname=tostring(arg[1]) or nil
identifier=tostring(arg[2]) or nil
tbl={}
local tmptbl={}
local dbgtbl={}
print(type(arg).." "..#arg)
for i = 1,#arg do
---@diagnostic disable-next-line: param-type-mismatch
local suc = string.gsub(arg[i],"%[","")
suc = suc:gsub("%]","")
    table.insert(dbgtbl,suc)
end
print(menuname.." "..identifier.." ".." a")
print(not((menuname == nil) or (identifier==nil)))
if (not((menuname == nil) or (identifier==nil))) then
    print("checkargz")
    temptbls = {}
for i = 3,#arg do
---@diagnostic disable-next-line: param-type-mismatch
    local tmptbl = arg[i]:gsub("%localappdata%",os.getenv("localappdata")):gsub("%userprofile%",os.getenv("UserProfile"))
    local tmptbl = tostring(tostring(tmptbl):gsub("\\","/"))
    local tmptbl = tmptbl:gsub("/","\\\\")
    print(tmptbl)
    table.insert(tbl,{})
    local temp = string.gsub(tmptbl,"%[",""):gsub("%]","")
    local tempzzz = ""
    table.insert(temptbls,{})
    for zi = 1,string.len(tmptbl) do
        if temp:sub(zi,zi)=="$" then
            table.insert(temptbls[#temptbls],tempzzz)
            tempzzz=""
            print("debug 2")
        else
        tempzzz = tempzzz..temp:sub(zi,zi)
        end
    end
    table.insert(temptbls[#temptbls],tempzzz)
end
print(#temptbls)
sclist = {}
for i = 1,#temptbls do
    table.insert(sclist,string.lower(identifier.."."..temptbls[i][1]))
end
    file = io.open("./"..menuname.." Uninstaller.reg","w+")
file:write("Windows Registry Editor Version 5.00\n\n")
file:write("[-HKEY_CLASSES_ROOT\\DesktopBackground\\Shell\\"..identifier.."]\n")
scstr=""
for i = 1,#sclist do
    scstr = scstr..sclist[i]
end
scstr2=""
for i = 1,#sclist do
    scstr2 = scstr2..sclist[i]..";"
end
for i = 1,#temptbls do
    local thisone = temptbls[i]
    file:write("[-HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\")
    file:write(sclist[i].."]\n")
end
file:close()
    file = io.open("./"..menuname..".reg","w+")
file:write("Windows Registry Editor Version 5.00\n\n")
    file:write("[HKEY_CLASSES_ROOT\\DesktopBackground\\Shell\\"..identifier.."]\n")
scstr=""
for i = 1,#sclist do
    scstr = scstr..sclist[i]
end
scstr2=""
for i = 1,#sclist do
    scstr2 = scstr2..sclist[i]..";"
end
file:write('"SubCommands"="'..scstr2..'"\n')
file:write('"MUIVerb"="'..menuname..'"\n\n')
for i = 1,#temptbls do
    local thisone = temptbls[i]
    file:write("[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\")
    file:write(sclist[i].."]\n")
    file:write('@="'..thisone[1]..'"\n')
    if thisone[3] == "nil" then
        file:write('"Icon"="')
        file:write(thisone[2])
    else
        file:write('"Icon"="')
        file:write(thisone[3])
    end
    file:write('"\n\n')
    file:write("[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\")
    file:write(sclist[i].."\\command]\n")
    file:write('@="'..thisone[2]..'"\n\n')
end
file:close()
end
else
    goto eof
end
goto actualeof
::eof::
print("ERROR:Invalid Configs")
::actualeof::