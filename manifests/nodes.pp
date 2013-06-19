node 'pserver' {
	include vnc
	include subversion
	include nginx
	include git
}
node 'pclient1' {
	include vnc
	include subversion
	include git
}

##Web servers##
node 'pclient1', 'pclient2' {
	include nginx
	$site_name = 'abc-com',
	$site_domain = 'abc.com',
	file { '/etc/nginx/conf.d/abc.com.conf':
		ensure	=> present,
		content	=> template('nginx/vhost.conf.erb'),
		notify	=> Service['nginx'],
	}

	$site_name = 'xyz-com',
        $site_domain = 'xyz.com',
        file { '/etc/nginx/conf.d/xyz.com.conf':
                ensure  => present,
                content => template('nginx/vhost.conf.erb'),
                notify  => Service['nginx'],
        }

}
node default {
	include localusers
}
include sudoers, schedulers
