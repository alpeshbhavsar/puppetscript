define nagios::hostadd($clienthostname = 'test' , $clientIPaddress = '1') {
	include nagios 
	file {'/etc/nagios/objects/$clienthostname.cfg':
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}

}
