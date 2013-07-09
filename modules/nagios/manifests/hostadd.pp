define nagios::hostadd($clienthostname , $clientIPaddress, $clientGroupname ){
	include nagios 
	file {"/etc/nagios/objects/$clienthostname.cfg":
		ensure	=> present,
		content	=> template('nagios/client.conf.erb'),
	}

	file {"/etc/nagios/objects/$clientGroupname.cfg":
                ensure  => present,
        }
	
	exec {"getcurrentmemberlist":
		command	=> "export cmembers=`gawk -Fmembers '{ print $2 }' \"/etc/nagios/objects/$clientGroupname.cfg\"`",
	}
	
	exec {"addnewmemberinhostgroup":
		command	=> "$cmembers=$clienthostname+$cmembers",
		require	=> Exec['getcurrentmemberlist'],
	}	

	
	
	exec {"checkhostentryexists":
		command	=> "echo \"cfg_file=/etc/nagios/objects/$clienthostname.cfg\" >> /etc/nagios/nagios.cfg && /etc/init.d/nagios reload",
		unless	=> "grep '/etc/nagios/objects/$clienthostname.cfg' /etc/nagios/nagios.cfg",
		path	=> ['/bin', '/usr/bin', '/usr/sbin'],
	}
		
}
