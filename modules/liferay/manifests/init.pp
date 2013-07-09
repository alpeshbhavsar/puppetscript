class liferay {
      package { ['unzip', 'sed', 'coreutils', 'wget' ]:
            ensure  => installed,
      }
      
		
      exec {'downloadliferay':
          cwd => '/opt',
          command => 'wget -c http://kaz.dl.sourceforge.net/project/lportal/Liferay%20Portal/6.1.1%20GA2/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip',
          path  => ['/bin', '/usr/bin', '/usr/sbin'],
	  unless => 'ls /opt/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip',
      }
      
		
      exec {'extractliferay':
          cwd => '/opt',
          command => 'unzip /opt/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip',
          path  => ['/bin', '/usr/bin', '/usr/sbin'],
          require => Exec['downloadliferay'],
      }
      
      exec {'renameliferay':
          cwd => '/opt',
          command => 'mv /opt/liferay-portal-6.1.1-ce-ga2 /opt/liferay',
          path  => ['/bin', '/usr/bin', '/usr/sbin'],
          require => Exec['extractliferay'],
      }

      
}

