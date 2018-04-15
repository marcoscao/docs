Linux
=====


## Index

1. tmux
2. bash shell
3. gpt partitions
4. desktop 
5. Network
6. SystemD


### Tmux 

```bash
# start tmux session
$ tmux new -s "session_name"
```


Ctrl + b +

	%	 		: split window vertical
	"			: split window horizontal

	cursor-keys	: move to panel
	
	w			: list current windows
	q			: show panels numbers
	
	o + [number]		: go to panel number x


	x			: kills panel

	c			: creates new window
	n			: go next window
	p			: previous
	number	: go window number

	

	:resize-pane -L 10			: resize current pane to left 10 columns
					 -R, -D, -U

	

### Bash shell 


```bash

# list loaded so libraries in a running process
$ lsof -p 9999 | grep .so

# list open connections
ss -t | grep 

# go to previous visited folder
$ cd -


# for loop
$ for file in \*.txt; do ls $file; done
$ for item in $(echo foo bar baz); do echo $item; done
$ for num in {0..9}; do echo $num; done
$ for i in 1 2 3 4; do echo $i;done

#
$ find . -name "*.vim" -exec dos2unix {} \;


$ tar xvzf


$ grep -RnE --color "factory.*IDeviceMessage"
$ grep -RnE --color "red|blue"



# create multiple folders
$mkdir –p {BUILD,RPMS,SOURCES,SPECS,SRPMS,tmp}



# repeat last command
!!


# display recursive folders files, omits .AppleAdouble, and outputs all columns but first to a file
du -h -I .AppleDouble media/ | awk '{$1="";print $0'} >> list_contents.txt


# 10 most used command
history | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -n | tail | sort -nr


# Connect external disk through Network port
sudo route add -host 192.168.0.3 -interface en0
sudo route delete -host 192.168.0.3 -interface en0

```


### GPT disk partitions

```bash
# Show all disks partitions , with those included using GPT partitions way
sudo sfdisk -l


# Supposing your new SSD disk is on /dev/sdb

	# 1. Create partition table on the SSD disk
	$ sudo sfdisk /dev/sdb

	# 2. Format it using ext4
	$ mkfs.ext4 /dev/sdb1

	# 3. Mount it
	$ sudo mount -t ext4 /dev/sdb1 /media/ssd

```


### Desktop

	Ctrl + Alt + l		: lock screen


### Network

```bash
# show verbose open ports ( user, process using it, ip... )
sudo lsof -i

# show ports
sudo netstat -tlpn
sudo netstat -tulpn
sudo netstat -lptu

nmap --open localhost

route
```

### SYSTEMD Services

```bash
# Copy serivce script to /lib/systemd/system/

# Start
$ systemctl start f.service

# Stop
$ systemctl stop f.service

$ systemctl is-active xxxx.service
$ systemctl is-failed xxxx.service

# Show configuration flags for the service ( watchdog, timers, limits, ... )
$ systemctl show xxxx.service

# Show currently active services known by Systemd
$ systemctl list-units

```

