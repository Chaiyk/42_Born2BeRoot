## **sudo**  
Stand for "Super User DO" which allow root access with command line. Also have function assin some command line access for some user.

## **LVM** 
Logical Volume Manager a system that manage the storage

## **APT** 
Advanced Package Tool, the main command-line package manager for Debian or Debian-based Linux distributions

## **Aptitude**

## **SELinux**

## **AppArmor**

## **UFW**

## **Command**
### **System** 
|Command|Function|
|---|---|
|lsblk|List block devices, list out the block of device in your system|
|apt update|Check update for all package|
|which [command]|Check the command directory|
|reboot|Reboot System|
|poweroff|Shut Down System|

### **Managing User** 
|Command|Function|
|---|---|
|whoami|Check what user account you using|
|cat [directory]|`/etc/passwd`Show  the list of users in system<br>`"Username" : "password (will show 'x' as the details is in shadow file)" : User ID : Group ID : User Details (full name, adress etc) : Home Directory : Default Shell`<br>`/etc/shadow`Show the list of users with encrypted password in system<br>`/etc/group`Show the list of groups with user inside|
|su - [Username]|stand for Switch User, if no username will change to root user|
|adduser [Username]|Add user with asking details, and default shell will set to /bin/bash ***(Require Root Access)***|
|useradd [Username]|Add user without asking details, and default shell will set to /bin/sh ***(Require Root Access)***|
|userdel [Username]|Delete the user in the system|
|usermod [*flags*]|User Modification.<br>`[Username] --shell [shell directory]` to change shell for user<br>`-l [new username] [old username]` change user name (*-l = new_logname*)|
|passwd [Username]|Change user password, will change current user password if didn't put username

### **Managing Groups** 
|Command|Function|
|---|---|
|usermod [*flags*]|`-aG [Group Name] [Username]` append the user to a group (*-a = append && -G = group*)|
|gpasswd -d [Username][Group Name]|Delete the user from the group (*-d = delete*)|
|groups|List the groups that your current logged user is in|
|groupadd [Group Name]|Add a group in system|
|groupdel [Group name]|Delete the group in system|
|exit/logout/'ctrl + d'|Log Out current logged user|

## **Sudoer** 
```
root                                          All                      = (              All              :             All                )            All
name ('%' for group name)  Host/Server that allow exercute coomand on  = (User that allow to impersonate : Group that allow to impersonate) Command that allow to use
```

### *Command for Sudo*
|Command|Function|
|---|---|
|sudo !!|Recall previous line with sudo at the start| 
|sudo visudo|Open visudo for user access permission|
|sudo -l|check current logged account access permission|

### *In visudo*
|Line|Function|
|---|---|
|%[name]|Mention that this is a group|
|NOPASSWD:[*Command Line directory*]|No Password Needed When Using listed Command (Put "ALL" for all command line)|
