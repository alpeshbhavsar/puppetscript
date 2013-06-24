class httpd {
	package {['httpd','httpd-devel','httpd-tools']:,
		ensure	=> installed,
	}
	service {'httpd':
		ensure	=> running,
		require => Exec['stop_nginx'],
	}
	exec {'stop_nginx':
		command	=> '/etc/init.d/nginx stop',
		onlyif	=> 'rpm -qa | grep nginx',
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
}
