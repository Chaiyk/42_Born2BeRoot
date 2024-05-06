**sudo**  
Stand for "Super User DO" which allow root access with command line. Also have function assin some command line access for some user.

**APT**
Advanced Package Tool, the main command-line package manager


**Managing User** 
|Command|Function|
|---|---|
|whoami|Check what user account you using|
|cat /etc/passwd|`/etc/passwd`Show  the list of users in system<br>`"Username" : "password (will show 'x' as the details is in shadow file)" : User ID : Group ID : User Details (full name, adress etc) : Home Directory : Default Shell`<br>`/etc/shadow`Show the list of users with encrypted password in system<br>`/etc/group`Show the list of groups with user inside|
|cat /etc/shadow|Show the list of users with encrypted password in system|
|cat /etc/group|Show the list of groups with user inside|
|su - [Username]|stand for Switch User, if no username will change to root user|
|adduser [Username]|Add user with asking details, and default shell will set to /bin/bash ***(Require Root Access)***|
|useradd [Username]|Add user without asking details, and default shell will set to /bin/sh ***(Require Root Access)***|
|passwd [Username]|Change user password, will change current user password if didn't put username
|usermod [Username][*flags*]|User Modification.<br>`--shell [shell directory]` to change shell for user<br>`-l [new username] [old username]` change user name(*-l = new_logname*)<br>`-aG [Group Name] [Username]` apend the user to a group (*-a = append && -G group*|
|gpasswd -d [Username][Group Name]|Delete a username from the group (*-d = delete*)|
|exit/logout/'ctrl + d'|Log Out current logged user|

**System**
|Command|Function|
|---|---|
|apt update|Check update for all package|
|which [command]|Check the command directory|
|reboot|Reboot System|
|poweroff|Shut Down System|

**Sudoer**
*Command for Sudo*
|Command|Function|
|---|---|
|sudo !!|Recall previous line with sudo at the start| 
|sudo visudo|Open visudo for user access permission|
|sudo -l|check current logged account access permission|

*in visudo*
|Line|Function|
|---|---|
|NOPASSWD:[*Command Line*]|No Password Needed When Using listed Command (Put "ALL" for all command line)|
