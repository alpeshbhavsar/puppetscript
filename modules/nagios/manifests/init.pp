class nagios {
	package { ['nagios', 'nagios-common', 'nagios-devel', 'nagios-plugins', 'nagios-plugins-all']:
	ensure	=> installed,
}
	service {'nagios':
		ensure	=> running,
	}
}
