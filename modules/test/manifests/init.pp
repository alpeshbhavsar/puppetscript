class testclass {
	file {"/root/hostgroup.txt":
		ensure	=> present,
	}

	$lists = "`gawk -Fmembers '{ print $2 }' /root/hostgroup.txt`"
	
	echo "$lists" > "/tmp/free.txt"

}
