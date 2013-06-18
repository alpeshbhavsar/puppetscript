class sudoers {
       package {'sudo':
                ensure  => installed,
        }
        file { '/etc/sudoers':
                source  => 'puppet:///opt/puppet/modules/sudoers/files/sudoers',
                mode    => '0440',
                owner   => 'root',
                group   => 'root',
        } 

}
