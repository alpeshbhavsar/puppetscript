node 'pserver' {
	include vnc
	include subversion
	include nginx
	include git
}

node 'pclient1' {
	include nginx
	include vnc
	user	{'jishnu':
		ensure	=> absent,
		comment	=> 'Jishnu Panchal',
		home	=> '/home/jishnu',
		managehome	=> true,
	}
	ssh_authorized_key { 'root_pserver':
		user	=> 'root',
		type	=> 'rsa',
		key	=> '',
	}
}

include localusers
