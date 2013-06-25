define nagios::hostadd($clienthostname , $clientIPaddress ){
	include nagios 
	file {"/etc/nagios/objects/$clienthostname.cfg":
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}
	
	exec {"checkhostentryexists":
		command	=> "echo \"cfg_file=/etc/nagios/objects/$clienthostname.cfg\" >> /etc/nagios/nagios.cfg",
		onlyif	=> "cat '/etc/nagios/objects/$clienthostname.cfg' /etc/nagios/nagios.cfg",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
		
}
