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
                	command => "echo `gawk -Fmembers '{ print $2 }' \"/etc/nagios/objects/$clientGroupname.cfg\"` > /tmp/temptext.txt",
			path    => ['/bin', '/usr/bin', '/usr/sbin'],
        	}

        	exec {"addnewmemberinhostgroup":
                	command => "sed -i \'/allowed_hosts/d\' /etc/nagios/nrpe.cfgcho `cat /tmp/temptext.txt`$cmembers=\"$clienthostname,$cmembers\"",
                	require => Exec['getcurrentmemberlist'],
			path    => ['/bin', '/usr/bin', '/usr/sbin'],
        	}

	
	exec {"checkhostentryexists":
		command	=> "echo \"cfg_file=/etc/nagios/objects/$clienthostname.cfg\" >> /etc/nagios/nagios.cfg && /etc/init.d/nagios reload",
		unless	=> "grep '/etc/nagios/objects/$clienthostname.cfg' /etc/nagios/nagios.cfg",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
		
}
