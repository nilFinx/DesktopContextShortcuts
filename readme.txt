1 press win+r
2 enter cmd and ok
3 write Main Commands at below
lua.exe main.lua ExampleMenu Example y "[ExampleGame$%UserProfile%/Downloads/ExampleGame/play.exe$nil]" "[Cortex$C:/Program Files (x86)/Razer/Razer Cortex/RazerCortex.exe$nil]"
4 press enter
5 you can make (Identifier).reg file with name ExampleMenu with Identifier Example and has ExampleGame
(from %UserProfile%/Downloads/ExampleGame/play.exe basically it runs play.exe Inside Downloads->ExampleGame.)
and delete existing Menu(should be same identifier as before in order to work).
also adds Razer cortex(from C:/Program Files (x86)/Razer/Razer Cortex/RazerCortex.exe).
--Function Help--
-cannot be changed/no change/crashing when change
lua.exe->telling windows we are going to run lua programs
main.lua->telling lua.exe load this file

-can be changed(cannot be deleted)
ExampleMenu->ContextMenu name, WARNING Text after here are just for backup
and doesnt to what it said so please skip to next line for not confusing.        Symbol are not supported but ! and +. ! are replaced with 1exc1 and + are 1pls1 more symbol will be added soon.

Example->Identifier of ContextMenu,cannot use symbol. Windows Contextmenu identifier Shows Group(identifier)
and Game Executeable tags(like game.minecraft inside .reg files) are Just identifier.
WARNING$$$$$$$$$$$$$$$$$ DO NOT SET IDENTIFIER TO EXISTING PROGRAM LIKE WINDOWS
OR DEFENDER OR GIMP OR CONTEXT MENU MIGHT TURN TO USELESS.
BEFORE USING CONFIGS FROM COMMUNITY YOU SHOULD BACKUP REGISTRY. GUIDE AT BELOW

y-Existing Menu should be deleted(y) or not(n) or uninstall menu(u,see below for help)
also y/n doesnt matter due to weird bug(NOT A BUG!!!)
only y and u needed
also new update y and u and n doesnt even matter now(dont remove it tho)
(why) also new update now y and u doesnt even needed

-can make many times(need at least 1)
[ExampleGame$%UserProfile%/Downloads/ExampleGame/play.exe] or anything starts with [ ->
Shortcuts. [ are start and ] are end, ExampleGame are game name at Context Menu(No Symbols here too),
$ are dividing, stuff starts with %UserProfile% are path. %UserProfile% will be C:/Users/(user name)/.
nil -> to set icon path(like for discord Exe and icon are splitted thats why i added that)
Remember:Text containing Space(like Program Files) should add " to start and end of args
--Uninstall--
Uninstall are easy,Change y or n to u,
and replace Shortcuts with[gamename] Example$ [ExampleGame,(game path)] -> [ExampleGame]
--Support--
Q$Cannot Uninstall because i forgot Identifier!
A$
1 Press win + r then enter regedit then ok
2 It will show Permission stuff so click ok(if didnt then skip this step)
3 Enter Computer/HKEY_CLASSES_ROOT/DesktopBackground/Shell at top
4 It will Select Shell at left side so right click Folder Sounds like Example menu And Delete
WARNING If you select wrong one like system folder might Brick the Desktop.
IF it got bricked Restore Backup(at below)
INFO from 5 its not needed to do
5 Enter Computer/HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/CommandStore/shell at top
6 It will select shell at left(lowercase one instead of first uppercase at 4)
7 right click Folder And Delete (Identifier name).(Program Name)
8 Done!

Q$Menu gone using CCleaner!
A$Make sure you dont use Registry Cleaner Features. If you really want to make sure you keep backup of
Generated .reg files.

Q$Is it safe to upload .reg files?
A$Not so safe. This program "MOSTLY"(means 0.00000001% does broke) doesnt broke windows.
But Reg file you can insert corrupution code like delete system registry.
So its basically safe to upload .reg file(i mean one made with this) but using others might corruput windows.

Q$Software doesnt have icons/Wrong icons!
A$For Wrong icont more complicated to fix but Doesnt have icons are mostly doesnt happening.
If it happened Add ,-1 after .exe(example [Example$%UserProfile%/Test/Game.exe] -> [Example$%UserProfile%/Test/Game.exe,-1]
This doesnt guarantee fix but might works.

Q$I Looked at .reg file and why there is 2 backslash(/) instead of only one?
A$Because Microsoft Made It or doesnt work

Q$Can we Type BackSlash(\) instead of ForSlash(/)?
A$No. Limit of the programming language lua but anyways / will be replaced to \ so dont worry
--Backup--
Goggle windows 10(or 11) create System restore point and follow guide.
One more is to Backup registry but not recommended.

--Easy Pickups--
GDLauncher(Custom Minecraft Launcher) = [GDLancher$%LocalAppData%/Programs/gdlauncher/GDLauncher.exe$nil]
Discord = [Discord$%LocalAppData%/Discord/Update.exe$%LocalAppData%/Discord/app.ico]
Razer Cortex(performance booster) = [Razer Cortex$C:/Program Files (x86)/Razer/Razer Cortex/RazerCortex.exe$nil]
Osu = [Osu$%localappdata%/osu!/osu!.exe$nil]
[EOF]