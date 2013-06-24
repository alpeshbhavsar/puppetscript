define nagios::client( $nagiosserverIP ) {
	package	{ 'nagios-nrpe':
		ensure	=> installed,
	}
	file {'/etc/nagios/nrpe.conf':
		ensure	=> present,
	}
	
	exec {'checknrpefileexists':
		command	=> 'cat /etc/nagios/nrpe.conf',
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
	exec {'allownagiosserver':
		command	=> "sed -i\".bak\" \'/allowed_hosts/d\' /etc/nagios/nrpe.conf && echo \"allowed_hosts=$nagiosserverIP\" >> /etc/nagios/nrpe.conf",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
		require	=> Exec['checknrpefileexists'],
	}
	exec {'restartnrpeclient':
		command	=> '/etc/init.d/nrpe restart',
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
		require	=> Exec['allownagiosserver'],
	}
}
