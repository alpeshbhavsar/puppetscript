define nagios::hostadd($clienthostname , $clientIPaddress, $clientGroupname ){
	include nagios 
	file {"/etc/nagios/objects/$clienthostname.cfg":
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}

	$hostgroupname = $clientGroupname
	$hostgroup_alias = $clientGroupname
	$members_list = $clienthostname
	file {"/etc/nagios/objects/$clientGroupname.cfg":
                replace => "no",
                ensure  => present,
                content => template('nagios/hostgroup.cfg.erb'),
                }

		exec {"getcurrentmemberlist":
                	command => "alias cmembers=`gawk -Fmembers '{ print $2 }' \"/etc/nagios/objects/$clientGroupname.cfg\"`",
			path    => ['/bin', '/usr/bin', '/usr/sbin'],
        	}

        	exec {"addnewmemberinhostgroup":
                	command => "$cmembers=\"$clienthostname,$cmembers\"",
                	require => Exec['getcurrentmemberlist'],
			path    => ['/bin', '/usr/bin', '/usr/sbin'],
        	}

	
	exec {"checkhostentryexists":
		command	=> "echo \"cfg_file=/etc/nagios/objects/$clienthostname.cfg\" >> /etc/nagios/nagios.cfg && /etc/init.d/nagios reload",
		unless	=> "grep '/etc/nagios/objects/$clienthostname.cfg' /etc/nagios/nagios.cfg",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
		
}
