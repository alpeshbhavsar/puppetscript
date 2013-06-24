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
	include httpd	



}



node default {
	include localusers
}
include sudoers, schedulers
