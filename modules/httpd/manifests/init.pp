class httpd {
	package {['httpd','httpd-devel','httpd-tools']:,
		ensure	=> installed,
	}
	service {'httpd':
		ensure	=> running,
		requirs => Exec['stop_nginx'],
	}
	exec {'stop_nginx':
		command	=> '/etc/init.d/nginx stop',
	}
	
}
