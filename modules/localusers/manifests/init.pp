class localusers {
	user {'alpesh':
		ensure	=> present,
		comment	=> 'Alpesh Bhavsar',
		home	=> '/home/alpesh',
		managehome	=> true,
	}
}
