package { 'gcc':
	ensure	=> installed,
}

service { 'httpd':
	ensure	=> running,
}
