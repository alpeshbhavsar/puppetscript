define nagios::client() {
	package	{ 'nagios-nrpe':
		ensure	=> installed,
	}
}
