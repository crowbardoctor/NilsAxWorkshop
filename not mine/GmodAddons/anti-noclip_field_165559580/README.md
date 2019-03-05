### About:
This tool allows you to create anti-noclip fields.
Players in these fields are unable to noclip.

### Requirement:
No addtional requirements. Wiremod[github.com] is recommended.

### How to use:
You spawn the an Anti-Noclip Field with the toolgun. You find this tool in the 'Construction' section of your tool menu.

The settings in the toolgun have tooltips, mouse over them to see them.
They may help you if you need to know something about an option.

### Features:
- Blocks players noclip inside an anti-noclip area.
- Built-in admin checks to prevent abuse.
- Extended features for admins.

If you an admin you can also disallow these actions:
- Spawning objects
- Tool use
- Entity drive
- Changing entity properties
- Using physgun, gravitygun
- Entering vehicles
- Picking up props
- Killing or damaging themselves

If you try to disallow them as a non-admin it wont work.
Bypassing by duping, won't work either. (Please report exploits if you find them)

It's nice if you want to build an effective prison for example.
You can even protect these areas from the outside.

ConVars and ConCommands:

You can disable this tool for non-admins.
The ConVar is: sv_anti_noclip_field_adminonly 0/1 (Default: 0)

You can change the max size of the fields, it will also clamp already placed ones.
The ConVar is: sv_anti_noclip_field_maxsize 128-16384 (Default: 512)

You can allow admin only features of the tool for everyone.
The ConVar is: sv_anti_noclip_field_freeforall 0/1 (Default: 0)

You can allow superadmins to be blocked.
The ConVar is: sv_anti_noclip_field_blocksuperadmin 0/1 (Default: 0)

If the tool causes lags on the server you can increase the recheck time.
The ConVar is: sv_anti_noclip_field_rechecktime 0.01-5 (Default: 0.25)

Credits:
Code: Grocel

SVN Version:
http://www.xp-dev.com/svn/G-A-P/anti-noclip_field

Commenting:
Fell free to posts bug reports, requests or feedback.

However if you post bug reports, please include the error message and the steps to reproduce it. An undetailed report is invaild and can't be treated. If I ask for more information, please give them to me or the bug can't be fixed.

Please don't add me to just report a bug. Please use the comment section below. If you still think you need to add me, then ask me in the comment section or in my profile first.
