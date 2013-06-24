define nagios::client( $nagiosserverIP ) {
	package	{ 'nagios-nrpe':
		ensure	=> installed,
	}
	
}
