class testingz {
	file {"/root/hostgroup.txt":
		ensure	=> present,
	}
	$lists = "`/bin/gawk -Fmembers '{ print $2 }' /root/hostgroup.txt`"
	exec {'addcontent':
		command	=> "/bin/echo $lists > /tmp/free.txt",
	}
}
