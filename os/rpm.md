RPM / YUM
=========

```bash

# List installed packages
$ yum list

# Show rpm package info
$ rpm -qlp PACKAGE_NAME.rpm

# Uninstall rpm package
$ rpm -e bytech-foxter.rpm

# Install package
$ rpm -ivh PKGNAME.rpm

# Upgrade package
$ rpm -Uvh PKGNAME.rpm

# Downgrade package ( install an older version )
$ rpm -Uvh --oldpackage OLDER_PKGNAME.rpm

# Show pre and post scripts
$ rpm -qp --scripts PKG_NAME.rpm

# Check rpm signature
$ rpm --checksig PKG_NAME.rpm

# Check rpm dependencies
$ rpm -qpR PKG_NAME.rpm

# Show installed rpm version
$ rpm -q PKG_NAME_INSTALLED

# Show ALL info of an installed RPM ( version, vendor, desc, ... )
$ rpm -qi PKG-NAME-INSTALLED

# Show ALL info of a NOT YET installed package ( version,vendor, desc... )
$ rpm -qip pkgname.rpm

# Verify package against installed one
$ rpm -Vp pkg-name.rpm

# Show only the "version" value from the installed package
$ rpm -q --queryformat '%{VERSION}' tech-or

# List files contained within the rpm package
$ rpm -qlpv PKG_NAME.rpm

# List files from an already installed package
$ rpm -qlv tech-or

# Extracts current rpm contents into folder
$ rpm2cpio bb.rpm | cpio -idm



Tabla de orden ejecución scripts pre-post embebidos en RPM
y valores de $1 recibidos en cada caso

	install 					upgrade 													un-install

	%pre ($1=1) 			%pre ($1=2) 											%preun ($1=0)
	copy files 				copy files 												remove files
	%post ($1=1) 			%post ($1=2) 											%postun ($1=0)
						    %preun ($1=1) from old RPM. 	
							delete files only found in old package 	
							%postun ($1=1) from old RPM. 	


	install 	= rpm -ivh pkgggname
	upgrade  	= rpm -Uvh pkgggname
	un-install	= rpm -e pkgname
	downgrade 	= rpm -Uvh --oldpackage pkgnamee


	So when upgrading package "software" from version 2 to 1 this will be the scripts order:

		1. Run %pre from "software-2".
    	2. Place files from "software-2".
    	3. Run %post from "software-2".
    	4. Run %preun from "software-1".
    	5. Delete files unique to "software-1".
    	6. Run %postun from "software-1".


```


