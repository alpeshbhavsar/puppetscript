file {'testfile':
	path	=> '/tmp/testfile',
	ensure	=> present,
	mode	=> 0640,
	content	=> "This is my test file",
}
