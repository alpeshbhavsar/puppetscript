define nagios::HostAdd($clienthostname, $clientIPaddress){
	include nagios 

	file {'/etc/nagios/objects/$clienthostname.cfg':
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}

}
