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
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	
	nginx::website { 'alpesh-com':
		site_domain => 'alpesh.com',
	}



}



node default {
	include localusers
}
include sudoers, schedulers
