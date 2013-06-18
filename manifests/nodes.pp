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
		ensure	=> present,
		comment	=> 'Jishnu Panchal',
		home	=> '/home/jishnu',
		managehome	=> true,
	}
}
