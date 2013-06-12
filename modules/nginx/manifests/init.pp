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
	file { '/etc/nginx/conf.d/abc.conf':
		source	=> 'puppet:////opt/puppet/modules/nginx/files/abc.conf',
		notify	=> Service['nginx'],
	}
	service { 'nginx':
		ensure	=> running,
		enable	=> true,
		require	=> Package['nginx'],
	}
}
