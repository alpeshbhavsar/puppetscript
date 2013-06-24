class nagios {
	package { ['nagios', 'nagios-common', 'nagios-devel', 'nagios-plugins']:
	ensure	=> installed,
}
	service {'nagios':
		ensure	=> running,
	}
}
