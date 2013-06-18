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

include localusers


