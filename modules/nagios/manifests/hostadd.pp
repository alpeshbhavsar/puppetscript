define nagios::hostadd($clienthostname , $clientIPaddress, $clientGroupname ){
	include nagios 
	file {"/etc/nagios/objects/$clienthostname.cfg":
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}

	if File.exists?"/etc/nagios/objects/$clientGroupname.cfg"
		exec {"getcurrentmemberlist":
                	command => "export cmembers=`gawk -Fmembers '{ print $2 }' \"/etc/nagios/objects/$clientGroupname.cfg\"`",
        	}

        	exec {"addnewmemberinhostgroup":
                	command => "$cmembers=\"$clienthostname,$cmembers\"",
                	require => Exec['getcurrentmemberlist'],
        	}
	else
		file {"/etc/nagios/objects/$clientGroupname.cfg":
                ensure  => present,
		content => template('nagios/hostgroup.cfg.erb'),
        	}
	end	

	
	
	exec {"checkhostentryexists":
		command	=> "echo \"cfg_file=/etc/nagios/objects/$clienthostname.cfg\" >> /etc/nagios/nagios.cfg && /etc/init.d/nagios reload",
		unless	=> "grep '/etc/nagios/objects/$clienthostname.cfg' /etc/nagios/nagios.cfg",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
		
}
