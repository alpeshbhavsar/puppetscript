class localusers {
	user {'alpesh':
		ensure	=> absent,
		comment	=> 'Alpesh Bhavsar',
		home	=> '/home/alpesh',
		managehome	=> true,
	}
}
