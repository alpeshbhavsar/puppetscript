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

	nagios::client { '192.168.131.139':
	}


}



node default {
	include localusers
}
include sudoers, schedulers
