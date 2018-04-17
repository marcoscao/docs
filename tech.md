arris desco commands
---------------------------

# reboot box
ngc -6

# busybox commands ( it uses busybox )
logread -f




sysctl
-------------------------------------------------------------

# load config keys
sysctl -p /etc/sysctl.conf

#show
sysctl -A


# key for TCP socket buffer max size ( in bytes )
net.core.rmem_max = 524000




tcpreplay
------------------------------------------------------------

# emit a captured packet with tcpdump over an interface
sudo tcpreplay --intf1=wlp3s0 video.pcap





Genbox  ( Gentoo / Wyplay )
--------------------------------------------------

# show installed packages flags
xlist graphene

# created targets and current one
xtarget -lv

# list installed packages
qlist -Iv

# add ngc daemon to auto-run on startup
/usr/targets/current/root/etc/initng/runlevel/default.runlevel
/usr/targets/current/root/redist/etc/initng/runlevel/default.runlevel

# drop caches ( to see right free mem )
echo 3 > /proc/sys/vm/drop_caches

# show available targets
xtarget -v -p

# show installed targets verbose
xtarget -l -v

# set current target
xtarget -s xxxx

# remove target
xtarget -d xxxx

# search for a package
xmerge -s [name]

# install
xmerge [name]

# remove 
xmerge unmerge [name]

# build pack.age ( without dependencies )
xbuild https://.....  fetch unpack setup compile install qmerge

# show installed packages
xexec equery list

# emerge man
man emerge

# update config files
xtc-update

# update etc files
etc-update

# install specific version with xmerge
xmerge =ffmpeg-3.1.0.15.19.1

  NOTE: if it say is MASKED you need to install it with xbuild




STB - Arris - Linux
-------------------------------------
logread -f              ( seems something like sys-log, or dmesg )





ffmpeg
-------------------------------------------

# ffserver config file
/etc/ffserver.conf


# Stream your cam to ffserver ( wait a minute to prepare buffers and
# then connect from a windows player to: 78.47.18.69/cam1.asf
# Note: 78.47.18.69 is the IP defined in /etc/ffserver.conf

$ ffmpeg -f video4linux2 -i /dev/video0 78.47.18.19/cam1.ffm







Wireless
--------------

# List wireless devices Block status ( hardware and software )
$ rfkill list all

# try to unblock all wireless devices
$ rfkill unblock all

# show phys devices
$ iw dev

# show if dev is up or not
$ ip link show [dev-name]   
$ ip link show wlp3s0

# bring up dev
$ ip link set wlp3s0 up

# check conn status
iw wlp3s0 link

# scan
iw wlp3s0 scan

# set password for SSID "blackssid" ( prompt to introduce password will appear )
$ wpa_passphrase blackssid >> /etc/wpa_supplicant.conf

# show configured networks
cat /etc/wpa_supplicant.conf 

# connect from command line
wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf



Network
---------------------------------------

# show all ports ( and domain sockets ) along with process name
netstat -ap

# show listening ports
netstat -lp

# show all ports ( and sockets ) without resolve port names
netstat -apn 

# get ip 
dhclient wlp3s0

# show info
ip addr show wlp3s0
ifconfig wlp3s0

# show route
ip route show

# force down interface
sudo ifconfig enp2s0 down

# set ip
sudo ifconfig enp2s0 192.168.1.200 netmask 255.255.255.0

# add gateway
sudo route add default gw 192.168.1.1 enp2s0

# show routing table
sudo route -n

# show trace route
traceroute 192....

# remove gateway
sudo route del default gw 192.168.2.1



NFS install and usage
--------------------------------------------------------------

0. Install dependencies
sudo apt-get install nfs-kernel-server nfs-common 

1. Add new NFS folder to /etc/exports    
sudo echo "/home/optiva/work/genbox/black/targets/current/root *(rw,no_root_squash,async,no_subtree_check)" >> /etc/exports

2. Update the list of NFS exported file systems:
sudo exportfs -af

3. Restart NFS service:
service nfs-kernel-server restart





IP-FORWARDING
----------------------------------------

1. Open /etc/sysctl.conf and uncomment net.ipv4.ip_forward = 1

    on gentoo it is under: /proc/sys/net/ipv4/conf/all/forwarding

2. $ sudo sysctl -p

3. Add the following rules to iptables
   In this example we want to forward traffic on enp2s0 to wlp3s0 ( ethernet to wifi )
    
sudo iptables -t nat -A POSTROUTING --out-interface wlp3s0 -j MASQUERADE  
sudo iptables -A FORWARD --in-interface enp2s0 -j ACCEPT


4. *** save to file  ( oops! think it only shows current values )
sudo iptables-save
## sudo iptables-save /etc/network/iptables.up.rules


5. apply changes 
sudo iptables-apply


6. Final example

Want to forward traffic from local desco ( connected by a network cable ) to wifi

    * Laptop ethernet ip: 192.168.1.42
    * Desco ethernet ip: 192.168.1.5


    * This is how route looks on the desco

    desco> # route -n
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    0.0.0.0         192.168.1.42    0.0.0.0         UG    0      0        0 eth0
    192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0



    * This is how route lloks on laptop

    optiva-pc ~ # route -n
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    0.0.0.0         10.95.231.254   0.0.0.0         UG    600    0        0 wlp3s0
    10.95.121.180   10.95.231.254   255.255.255.255 UGH   600    0        0 wlp3s0
    10.95.228.0     0.0.0.0         255.255.252.0   U     600    0        0 wlp3s0
    169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 enp2s0
    192.168.1.0     0.0.0.0         255.255.255.0   U     100    0        0 enp2s0





DNS
--------------------------------------------------------------

1. edit /etc/resolv.conf

2. add following:

    nameserver 8.8.8.8
    NOTE: 8.8.8.8 is the Google public DNS


3. test it ( no need to restart networking processes )

   ping www.amazon.es




Wireshark
------------------------------------------------------------------

- Filter POST y GET traffic
   http.request.method=="POST" or http.request.method=="GET"

- Ip dest / src
    ip.dst == 192.168.1.2
    ip.src == 192.168.1.5





sftp
-------------------------------------------------------

sft -P 2222 user@host

some commands ( as usual ftp ) : cd, get, put, ls, help, ...





rdesktop
------------------------------------------------------------------

# connecto to a windows terminal server from linux

rdesktop -f 10.95.207.70

# Press Ctrl+Alt+Enter to exti from fullscreen




PGP
---------------------------------------------------

# encrypt with Gnu PGP ( will request for a passphrasse )
$ gpg -c myfile

# decrypt ( will request for the passphrasse )
$ gpg myfile.gpg



Minicom
---------------------

$ minicom

    Ctrl + A
        o
            port settings: /dev/ttyUSB0

    Ctrl + Z
        

# If dev/ttyUSB0 is locked try this:

$ minicom -S ttyUSB0 -o





Linux Mint
--------------------------------------

# Cores generation
    
    bashrc:         ulimit -c unlimited

    core output folder must have read/write permissions

    # check current core dump folder
    cat /proc/sys/kernel/core_pattern


    # change core dump folder to another one  
    echo '/tmp/core_%e.%p' | sudo tee /proc/sys/kernel/core_pattern


# Ctrl + R  iterate over
1. press Ctrl + r
2. type some characters
3. press Ctrl + r again to iterate between ocurrences


# list only folders
ls -d /var/www/*/


# convert a serie of png images to an animated gif
convert -delay 1 -loop 0 foo_*.png animation.gif

# ssh key-gens

# change ip
ifconfig eth0 192.168.1.56

#extract tar to a folder ( ex: some package at root folder )
sudo tar -xvjf aaa.tar.bz2 -C /

# compress folder
tar -zcvf archive-name.tar.gz directory-name

# force creation of symbolic link ( overwritten if exists )
ln -sf /existing/path


# sed
    1. replacing some section of a line 
                example: replacing BDBG_WRN(( "this is some changing stuff" ));
                by:  printf( "this is some changing stuff" );

        sed 's/BDBG_WRN((\(.*\)))/printf(\1)/g' file.c | grep --color "printf"


    2. adding line with text into the file first's line
        sed '1 i\#include <stdio.h>' file.c


# show alias value
type build_xxx


# repair FAT32 disk
sudo dosfsck -w -r -l -a -v -t /dev/sdb1


# mount usb
1. fdisk -l  ( will show sdbxxx or whatever usb device name )
2. mkdir /media/usb
3. mount /dev/sdxxx /media/usb


# Show NFS mount partitions
showmount -e 192.168.1.123




# find

    # List only executable files
    find . -type f -perm /a+x

    # Find strings in binaries
    find . -name '*.so' -exec strings -af {} \; > output.txt



# patch

    # create patch
    diff -Nur folder_a folder_a_mod > folder_a_feature.patch


    # apply patch
    patch -p1 < folder_a_feature.patch 

    # dry run
    patch --dry-run < folder_a_feature.patch

    # reverse patch
    patch -R < folder_a_feature.patch



# for usages
    $ for i in {100..130}; do ping -c1 192.168.1.$i; done



# DEb packages

# List
$ sudo dpkg -l | grep "skype*"

# Remove package
$ sudo dpkg -P package-name

# Install package
$ sudo dpkg -i package-name





Tmux
---------------------------------------------------------

Ctrl-b 

    ?       show available C-b commands

    [                           : scroll mode
    q ( without Ctrl-b)         : quit scroll mode


    %           : split vertical
    "           : split horizontal
    q           : show pane numbers ( type number to go that pane )
    o           : swap panes
    x           : kill pane
    +           : break pane into window ( e.g. to select text by mouse to copy )
    -           : restore pane from window
    {           : move current pane left
    }           : move current pane right
    z           : toggle pane zoom


    :resize-pane -L 40          : resize current pane left 40



Debian Packages
-------------------------------------------------------

# apt-file to: list files, search for file, ...
    
    1. install apt-file
    2. sudo apt-file update

    * list files from a package using apt-file with no .deb files

        apt-file list quake

    * search for a file within all the packages
        
        apt-file search libasound.so


# list contained files into a deb file using dpkg
dpkg -c kkkk.deb


# fix issues related to PUBKEY when doing an apt-get update
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5


# instal 32 bits version of a package/lib, ...

    1. first let support it

    dpkg --add-architecture i386


    2. example installing freeglut3 32bits version on a 64bit linux version

    sudo apt-get install freeglut3:i386




Bash
---------------------------------------------------------------------------

$ for ((i=1;i<10;i+=2)); do echo "this is $i"; done
$ for i in {1..5}; do echo "hhhhh"; done

# work in files
$ for i in *; do echo $i; done





Git
-------------------------------------------------------------------------------

# show commits before pull
    1. git fetch
    2. git log HEAD..origin


# git prompt ( prompt script displaying current branch, status... )
    1. cd ~
    2. git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

    3. insert into .bashrc
        GIT_PROMPT_ONLY_IN_REPO=1
        source ~/.bash-git-prompt/gitprompt.sh



# reset hard. reverting local changes ( it does not delete untracked files )
git reset --hard <commit-id>


# Show files in commit
git show <commit-id>

    

# branches
    # List remote branches
    git ls-remote 


    # Create branch on the fly
    # Note: this example creates a new branch from a detached head ( tag )
    git checkout -b OPENSTB-1295-iservices-app-trigger refs/tags/OPENSTB-release-sprint-27


    # Push branch to remote
    git push origin OPENSTB-1295-iservices-app-trigger


    # Delete remote branch
    git push origin --delete refs/heads/OPENSTB-1295-iservices-app-trigger


    # delete local branch
    git branch -d refs/heads/OPENSTB-1295-iservices-app-trigger


    # push branch changes first time ( synchronize local branch with remote )
    git push --set-upstream origin OPENSTB-1295-iservices-app-trigger


    # Get remote info ( new branches, etc... ) from a previous cloned repository
    # This updates local info about remote changes
    git fetch


    # diff between branches
    git diff master..origin/branch_bug_fix


    # diff between branches from common ancestor
    git diff master...origin/branch_bug_fix


    # retrieve common ancestor between 2 branches
    git merge-base master branch_bug_fix



# configure git 
    
    # user
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"


    # assign vim editor
    git config --global core.editor "vim"


    # assign kdiff3 as merge and diff tools
    gitt config --global --add merge.tool kdiff3
    git config --global --add diff.guitool kdiff3

    # alias
    git config --global alias.co checkout


# tags

    # list tags
    git tag -l

    # add tag
    git tag -a my_1.0_tag -m"new tag 1.0"
    git push origin my_1.0_tag

    # show tag info
    git tag show my_1.0_tag


    # checkout a tag into a branch
    git checkout -b my_branch my_tag_1.0



# diffs
    # diffs between 2 branches
    git diff master..origin/branch_bug_fix

    # diff from common ancestor
    git diff master...origin/branch_bug_fix





# Git standard workflow

    1. git checkout master

    2. git checkout -b OPENSTB-MyBranch

    3. git push origin OPENSTB-MyBranch

    4. do the changes

    5. git rebase origin/master

    6. git add
       git commit

    7. git push 
 
    8. git push origin --delete OPENSTB-MyBranch



GIT NOTES:

* DETACHED_HEAD : when a checkout is made from commit,hash ( tag, ... ) instead of an existing branch
  If you need to make changes to this detached-head you must create a new branch from this one and work on it




 

Vim
-------------------------------------------------

# format xml files

    # put this into .vimrc
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

    # then on the xml file type the following
    gg=G


# Show line numbers
:set number

# auto indent
:set autoindent

# set indentation level
:set shiftwidth=4

# auto indent when pasting contents
:set paste
:set nopaste

# converts tabs to spaces
:set tabstop=4 shiftwidth=4 expandtab


# show trailing spaces
    1. :highlight ExtraWhitespace ctermbg=red guibg=red
    2. :match ExtraWhitespace /\s\+$/



# search and replace

    # search whole file lines starting with 'Martin' and replace them
    # with 'Mr Martin Wicks'

    :%s/^\(Martin\)/Mr \1 Wicks/g

    \(Martin\)  : this stores 'Martin' into buffer 1
    \1          : this retrieves contents from buffer 1


# put bookmark

    m + key where store bookmark
    ' + key, go to bookmark
    :marks      show marks

# specil bookmarks
    ''          go last jump

    `.          going to last buffer change
    `0          las file edited position when exit vim



# turn off highlightning until next search
:noh

# turn highlightning forever
:set nohlsearch
:set hlsearch


# white background
:highlight Normal ctermfg=blue ctermbg=gray


# show hidden characters
:set list
:st nolist

:set listchars=tab:▒░,trail:▓

:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


:set lcs=trail:.,eol:$,tab:>-,nbsp:*



# resize vertical splitter bar
:vertical resize 120

# close split window
Ctrl+w and the q    ( do it quickly )



Vim Plugins / Utils
------------------------------------------------------------------------------------------------

# ctags

    1. sudo apt-get install ctags
    2. Put this into ~/.ctags file:
  
        --recurse=yes
        --exclude=.git
        --exclude=vendor/*
        --exclude=node_modules/*
        --exclude=db/*
        --exclude=log/*


    3. Go to project folder root
        $ ctags .

    4. From inside vim
        :tag xxxxx

    5. From command-line
        vim -t <tag>

    6. You can put this to ignore ctags from git

        echo "tags" >> ~/.global_ignore
        git config --global core.excludesfile $HOME/.global_ignore


    7. Go definition of instance under cursor
        g]

    8. Returning after a tag jump
        :pop
        Ctrl + t

    9. Jump again to last jumped tag
        :tag

    10. List all accesed tags
        :tags



# Tagbar Plugin

    :TagBarToogle



# NERDTree Plugin

    :NERDTreeToogle
    
    A           : maximize/minimize
    ?           : show help
    q           : close NERDTree window



# Fugitive Plugin (git-management )

    :Gblame
    :Glog               : evolution of the current file

    :Gdiff
    :Gstatus



# Web search Plugin

    :WebSearch






Debug - Profiling
---------------------------------------------------------------------------

# trace system calls for a process ( and childs ) to output file
strace -f -o data.log my_app


# show currently loaded shared libraries while process is running
lsof -p 25281
cat /proc/25281/maps



    

Curl
-----------------------------------------------------------------------------

#GET approach with JSON result
    curl -i -H "Accept: application/json" http://someHostName/someEndpoint | grep }| python -mjson.tool 

#POST approach with JSON result
    curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" http://someHostName/someEndpoint -d '{"id":"IDVALUE","name":"Mike"}' | grep }| python -mjson.tool



# GET
    with JSON:
    curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource

    with XML:
    curl -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET http://hostname/resource


# POST:
    for posting data:
    curl --data "param1=value1&param2=value2" http://hostname/resource

    For file upload:
    curl --form "fileupload=@filename.txt" http://hostname/resource

    RESTful HTTP Post:
    curl -X POST -d @filename http://hostname/resource

    For logging into a site (auth):
    curl -d "username=admin&password=admin&submit=Login" --dump-header headers http://localhost/Login
    curl -L -b headers http://localhost/


# Pretty-printing the curl results:

For JSON:

    If you use npm and nodejs, you can install json package by running this command:
    npm install -g json
    Usage:
        curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource | json
    

    If you use pip and python, you can install pjson package by running this command:
    pip install pjson
    Usage:
        curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource | pjson


    If you use Python 2.6+, json tool is bundled within.
    Usage:
        curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource | python -m json.tool


    If you use apt-get (aptitude package manager of your Linux distro), you can install yajl-tools package by running this command:
    sudo apt-get install yajl-tools
    Usage:
        curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource |  json_reformat



For XML:

    If you use *nix with Debian/Gnome envrionment, install libxml2-utils:
    sudo apt-get install libxml2-utils
    Usage:
        curl -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET http://hostname/resource | xmllint --format -


    or install tidy:
    sudo apt-get install tidy
    Usage:
        curl -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET http://hostname/resource | tidy -xml -i -





Wireshark
--------------------------------------------------------

# Filter only ips doing multicast ( I think only multicast origin traffic )
# Note: that is because the less significant bit of the more significant MAC addres byte must be 1 if multicast

(eth.dst[0] & 1)


# type to filtering only those packets types

dns     
tcp
mpeg_pmt
mpeg_pat



GCC
--------------------------------

# using threads
g++ -std=c++14 main.cpp -pthread -o demo



Cores - Debug
-------------------

# show cores file size ( if "core file size" entry is 0 then no core is generated on segfault, ... )
ulimit -a

# set core file size
ulimit -c unlimited


# show symbols demangled
nm -C demo



GDB
----------------------------

gdb demo demo_core

frame #number
list
info locals

info threads
thread #number
bt

winheight

# next line, step over
n

# next line, step into
s

# continue
c


# set breakpoint
b
break file:line
info break

# break at some event ( fork, throw, load, exec, ... )
catch event

# clear breakpoint
clear file:line


help
help command

run
run arguments

kill

# set stdin and out desired device
tty dev

show env
show env var
unset env var


info args
info reg


Wireless
-------------------------------------------------------------

iwlist wlan0 scan





