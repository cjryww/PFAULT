# README #
Before running PFAULT, please cp the ~/pfault/data/pfault.conf or pfault_default.conf ~/pfault/pfault.conf

The example of the content of a valid pfault.conf with following configuration of lustre
##Configuration##

## The content of  pfault.conf and explain each variable##

1.sudo: sorry, you must have a tty to run sudo

	vi /etc/sudoers 

	Defaults    !requiretty
2. make tgtd first: 
	cd /pfault/pf_virtual_device_manager/iscsi
	make
3. passwordless ssh
4. make sure enough space on iscsi server
