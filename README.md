### **sudo (Super User DO)**  
Allow root access with command line. Also have function assin some command line access for some user.

### **LVM (Logical Volume Manager)** 
A system that manage the storage

PV = Physical Volume, storage that is in Physical like HDD/SDD etc <br>
VG = Volume Group, storage that combine all the PV and prepare for use of LV <br>
LV = Logical Volume, storage that are ready to use in OS like C drive etc <br>

### **APT (Advanced Package Tool)** 
The main command-line package manager for Debian or Debian-based Linux distributions

### **Aptitude**

### **SELinux**

### **AppArmor**

### **UFW (Uncomplicated FireWall)** 
Allow/deny the access either incoming/outgoing information to the shell/server

### **SSH (Secure Shell)**
A Shell that use encrypted test to communicate to serverx`

### **TTY mode**

### **PAM (Pluggable Authentication Modules)**
Management Group Type    Control Flags    Modules Paths/Modules Argument 

#### Setting Password Policy
- We need to install `libpam_pwquality` using apt
- go to `/etc/pam.d/common-password` and add the condition. can refer [HERE](https://manpages.debian.org/testing/libpam-pwquality/pam_pwquality.8.en.html) for details
- For deadline of password, go `/etc/login.defs` and adjust the period

### **wget** 
A free and open source tool for downloading files from web repositories


# **Command**
## **System** 
#### **General**
|Command|Function|
|---|---|
|who|list out the current running tty|
|`wall [file]`<br>`wall <<< '[text]'`<br>`echo [text] \| wall`|Send a message to all the terminal that connecting to server|
|which [command]|Check the command directory|
|[grep](https://linux.die.net/man/1/grep) [text][file]|Print the line that match the *[text]*|
|ssh *username*@*ip address*|Connect to a server via ssh<br>`-p [port]`connect to server via port nunber|

#### **Linux**
|Command|Function|
|---|---|
|ip a| check the network details|
|lsblk|List block devices, list out the block of device/partition in your system<br><br>NAME: Name of the partition<br>"MAJ:MIN": Major and Minor device numbers<br>RM: Removable device<br>Size: Size of the partition<br>RO: Read only<br>Type: Device type<br>MOUNTPOINT: Mount Point|
|apt intall [package name]|Intall a package|
|apt update|Check update for all package/system|
|apt upgrade|Upgrade all the avaliable update for all package/system|
|systemctl status [software]|Check the status for the app/software. exp: "systemctl status ssh" will check the status for SSH service|
|hostnamectl|Check the details of hostname|
|hostnamectl set-hostname [*new hostname*]|Change the hostname for the machine|
|[uname *-flags*](https://linux.die.net/man/1/uname)|Print system information.<br>Output:`Kernel Name (-s)``Hostname (-n)``Kernel Release (-r)``Kernel Version & Build Date (-v)``Machine Hardware Name (-m)``Operating System (-o)`|
|[lscpu](https://linux.die.net/man/1/lscpu)|Display the details for CPU architecture|
|[free](https://ioflood.com/blog/free-linux-command/#:~:text=Like%20a%20vigilant%20watchman%2C%20the,how%20much%20is%20still%20available.)|Display details for avaliable memory|
|reboot|Reboot System|
|poweroff|Shut Down System|

#### **Managing User** 
|Command|Function|
|---|---|
|whoami|Check what user account you using|
|cat [directory]|`/etc/passwd`Show  the list of users in system<br>`"Username" : "password (will show 'x' as the details is in shadow file)" : User ID : Group ID : User Details (full name, adress etc) : Home Directory : Default Shell`<br>`/etc/shadow`Show the list of users with encrypted password in system<br>`/etc/group`Show the list of groups with user inside|
|su - [Username]|stand for Switch User, if no username will change to root user|
|adduser [Username]|Add user **with** asking details, and default shell will set to /bin/bash ***(Require Root Access)***|
|useradd [Username]|Add user **without** asking details, and default shell will set to /bin/sh ***(Require Root Access)***|
|userdel [Username]|Delete the user in the system|
|usermod [*flags*]|User Modification.<br>`[Username] --shell [shell directory]` to change shell for user<br>`-l [new username] [old username]` change user name (*-l = new_logname*)|
|passwd [Username]|Change user password, will change current user password if didn't put username

#### **Managing Groups** 
|Command|Function|
|---|---|
|usermod [*flags*]|`-aG [Group Name] [Username]` append the user to a group (*-a = append && -G = group*)|
|gpasswd -d [Username][Group Name]|Delete the user from the group (*-d = delete*)|
|groups|List the groups that your current logged user is in|
|groupadd [Group Name]|Add a group in system|
|groupdel [Group name]|Delete the group in system|
|exit/logout/'ctrl + d'|Log Out current logged user|

## **SSH Service**
### **Change port for the SSH Service** <br>
Go `/etc/ssh/sshd_config` using editor. on line 14 remove '#' and change the port number. exp: "Port 4242"

|Command|Function|
|---|---|
|ststemctl status ssh|Check the status of the ssh server|
|service ssh restart|Restart the ssh service|

## **UFW**
|Command|Function|
|---|---|
|ststemctl status ufw|Check the status of the ufw|
|ufw default|Change the default rule for ufw<br>|
|ufw enable/disable|Change the status of ufw|
|ufw status [**]|check the status for ufw, add "numbered" to add the nunber for ports<br>`verbose`list the policy for incoming, outgoing and routed informations<br>`numbered`list the allow port with nunber|
|ufw allow [Port/Service]|Allow access for Port/Service|
|ufw deny [Port/Service]|Deny access for Port/Service|
|ufw delete [*number*]|Remove the port that is listed|

## **Sudoer** 
```
root                                          All                      = (              All              :             All                )            All
name ('%' for group name)  Host/Server that allow exercute coomand on  = (User that allow to impersonate : Group that allow to impersonate) Command that allow to use
```

#### *Command for Sudo*
|Command|Function|
|---|---|
|sudo !!|Recall previous line with sudo at the start| 
|sudo visudo|Open visudo for user access permission|
|sudo -l|check current logged account access permission|

#### *In visudo*
|Line|Function|
|---|---|
|**Defaults&emsp;secure_path=[*paths (put':' for more paths)*]|Paths that able to access only using sudo|
|**Defaults&emsp;passwd_tries=*N*|Number of tries to type password when using sudo|
|**Defaults&emsp;badpass_message=*S*|Custom Error Message when incorrect password|
|**Defaults&emsp;logfile=[directory]|record the log in to [directory] that mention|
|**Defaults&emsp;log_input|log the input when user used sudo|
|**Defaults&emsp;log_output|log the output when user used sudo|
|**Defaults&emsp;requiretty|User need to use a tty when access to the server|
|%[name]|Mention that this is a group|
|NOPASSWD:[*Command Line directory*]|No Password Needed When Using listed Command (Put "ALL" for all command line). exp: ALL:(ALL)NOPASSWD:ALL|

**at top around line 9+-

## *Shell Script*
Tutorial: https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/
|Line|Function|
|---|---|
|`#![path]`|“#!” is an operator called shebang which directs the script to the interpreter location. So, if we use”#! /bin/sh” the script gets directed to the bourne-shell<br>exp: `path = /bin/bash`|
|`read [var]`<br>``$[var]`|Get an input from user and put it inside a variable. Then put '$' to call the variable|
|`#[Comment]|Comment|


##System Info
|Line|Function|
|---|---|
|[uname](https://linux.die.net/man/1/uname)|Print system information| 
