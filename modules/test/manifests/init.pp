class test12 {
	file {"/root/hostgroup.txt":
		ensure	=> present,
	}
	$lists = "`gawk -Fmembers '{ print $2 }' /root/hostgroup.txt`"
	exec {'addcontent':
		command	=> "echo $lists > /tmp/free.txt",
	}
}
