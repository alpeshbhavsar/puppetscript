class testingz {
	file {"/root/hostgroup.txt":
		ensure	=> present,
	}
	$lists = "`/bin/gawk -Fmembers '{ print $2 }' /root/hostgroup.txt`"
	
	$listsmembers = split($lists, ',')
	
	exec {'addcontent':
		command	=> "/bin/echo $listsmembers[2] > /tmp/free.txt",
	}
}
