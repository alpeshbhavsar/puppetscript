node 'pserver' {
	include vnc
	include subversion
	include httpd
	include git
}

node 'nagiosserver' {
	include httpd, nagios
	}
node 'pclient1' {
	include vnc
	include subversion
	include git
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	include httpd	
	nagios::client



}



node default {
	include localusers
}
include sudoers, schedulers
