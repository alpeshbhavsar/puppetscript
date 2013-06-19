class nginx {
	package { 'httpd-*':
		ensure	=> absent,
	}
	package { 'httpd-tools-*':
		ensure	=> absent,
	}
	package { 'nginx':
		ensure	=> installed,
		require	=> Package['httpd-*'],
	}
	file { '/etc/nginx/site-enabled/default':
		ensure	=> absent,
	}
	service { 'nginx':
		ensure	=> running,
		enable	=> true,
		require	=> Package['nginx'],
	}
}
