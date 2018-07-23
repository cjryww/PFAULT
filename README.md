# README #
The framwork is keep updating, not all fuctions work now. The full version is coming soon.
If you need help on it, please feel free to contant will_cao@nmsu.edu!
## Please ignore the following##
## The content of  pfault.conf and explain each variable##
Before running PFAULT, please cp the ~/pfault/data/pfault.conf or pfault_default.conf ~/pfault/pfault.conf
The example of the content of a valid pfault.conf with following configuration of lustre
1.sudo: sorry, you must have a tty to run sudo

	vi /etc/sudoers 

	Defaults    !requiretty
2. make tgtd first: 
	cd /pfault/pf_virtual_device_manager/iscsi
	make
3. passwordless ssh
4. make sure enough space on iscsi server
