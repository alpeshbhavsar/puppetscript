node 'pserver' {
	include vnc
	include subversion
	include httpd
	include git
	ssh_authorized_key { 'root_ssh':
        user => 'root',
        type => 'rsa',
	key	=> 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxN+5D5m/IiIV6uapIUOMbgSDZPnvJsfh6hVUaxqHQQH8aEw43JY3QvAbsQS8Puu3mQBfP8gdxqyewF2SNbOIpjwCwdry5bVnpYoQp7WgVDQp+eC3SZ1EnudCYSIfgi/nO1b9BjBXxq4kUxsNNpumI0gMJIlTx+UYuldkJJMgVm4t/q7xG3XrZl9znkdAcU6ZG2Ukh+eG3TQRR6ARrTOd4doCAg3qoRUPaVapgyjpUctVu6IytGJwupqa7sWrabAACRwClFCGmIDsuieh9J3gnESibN38OzIs+R5VkHmx0bkzmJtKwU4yPluRXgXmoJDopZr0KPxtFanpn/jifTEvYQ==',
        }
}

#test comment added
node 'nagiosserver' {
	include httpd
	include nagios
	nagios::hostadd {'testnode1':
	clienthostname => 'pclient1',
	clientIPaddress	=> '192.168.131.137',
	}
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	
}

node 'pclient1' {
	include vnc
	include subversion
	include git
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	include httpd	

	nagios::client { 'nagiosclient-pclient1':
	nagiosserverIP	=> '192.168.131.139',
	}
	
	include liferay


}



node default {
	include localusers
}
include sudoers, schedulers
