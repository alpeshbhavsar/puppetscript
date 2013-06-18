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
	ssh_authorized_key { 'root_pserver':
		user	=> 'root',
		type	=> 'rsa',
		key	=> 'AAAAB3NzaC1yc2EAAAABIwAAAQEAwk4htthZQfuI5ZSU2EUatWWEmEnhLxubB322aY37WzqRnrnpx5nZexh6zIgrjBzpgJTbuhwVaGGI1KbV0+E06l20DApisJ1TAQT+9rwKRMZ2uiA7ma7MHTmY2asySZBZHPDxNXWFH0H9Mvu25EEJi37H/Ah2yBSXSOVPuaoAo+Tr8pOd5ZBOFmpALHujWs4WSXNHwRUIRaATShlkvj7VTatJhT8uwyqqKsOz/6OfT2gDozRBw66QhFtudEUbF1waeVcg6h6s/VgcqYLKmcPVTIBvgy0oW//ubr51j0oFWDJhRq/igYg2/xzcloZRQwx0vvxfzFd3VXkjQNbP7Hx5ww== ',
	}
}
