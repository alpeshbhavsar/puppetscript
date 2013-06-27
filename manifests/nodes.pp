node 'pserver' {
	include vnc
	include subversion
	include httpd
	include git
}

#test comment added
node 'nagiosserver' {
	include httpd
	include nagios
	nagios::hostadd {'testnode1':
	clienthostname => 'pclient1',
	clientIPaddress	=> '192.168.131.137',
	}
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	
}

node 'pclient1' {
	include vnc
	include subversion
	include git
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	include httpd	

	nagios::client { 'nagiosclient-pclient1':
	nagiosserverIP	=> '192.168.131.139',
	}
	
	include liferay


}



node default {
	include localusers
}
include sudoers, schedulers
