define nagios::server::hostadd( $clienthostname, $clientIPaddress) {
	file {'/etc/nagios/objects/$clienthostname.cfg':
		ensure	=> present,
		template=> 'nagios/client.conf.erb',
	}
}
