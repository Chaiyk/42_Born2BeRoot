**sudo**  
Stand for "Super User DO" which allow root access with command line. Also have function assin some command line access for some user.

**APT**
Advanced Package Tool, the main command-line package manager


**Managing User** 
|Command|Function|
|---|---|
|whoami|Check what user account you using|
|cat /etc/passwd|Show  the list of users in system<br>`"Username" : "password *(will show 'x' as the details is in shadow file)*" : User ID : Group ID : User Details *(full name, adress etc)* : Home Directory : Default Shell`|
|cat /etc/shadow|Show the list of users with encrypted password in system|
|su - [Username]|stand for Switch User, if no username will change to root user|
|adduser [Username]|Add user with asking details, and default shell will set to /bin/bash ***(Require Root Access)***|
|useradd [Username]|Add user without asking details, and default shell will set to /bin/sh ***(Require Root Access)***|
|passwd [Username]|Change user password, will change current user password if didn't put username
|usermod [Username][*flags*]|User Modification.<br>`--shell [shell directory]` to change shell for user<br>`-l [new username] [old username]` new_logname， change user name|
|exit/logout/'ctrl + d'|Log Out current logged user|

**System**
|Command|Function|
|---|---|
|reboot|Reboot System|
|poweroff|Shut Down System|

**Sudoer**
|Command|Function|
|---|---|
