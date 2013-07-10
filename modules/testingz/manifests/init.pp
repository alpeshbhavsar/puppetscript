class testingz {
	file {"/root/hostgroup.txt":
		ensure	=> present,
	}
	$lists = "`/bin/gawk -Fmembers '{ print $2 }' /root/hostgroup.txt`"
	
	$listsmembers = split($lists, ',')
	$count = size($listsmembers)
	exec {'addcontent':
		command	=> "/bin/echo $count > /tmp/free.txt",
	}
}
