class liferay {
      package { ['unzip', 'sed', 'coreutils', 'wget' ]:
            ensure  => installed,
      }
      
      exec {'downloadliferay':
          cwd => '/opt',
          command => 'wget http://kaz.dl.sourceforge.net/project/lportal/Liferay%20Portal/6.1.1%20GA2/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip',
          path  => '['/usr', '/usr/bin', '/usr/sbin']',          
      }
      
      file {'/opt/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip':
          ensure  => present,
          mode    => 0755,
          require => Exec['downloadliferay'],
      }
      
      exec {'extractliferay':
          cmd => '/opt',
          command => 'unzip /opt/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip && mv /opt/liferay-porta* /opt/liferay',
          path  => '['/usr', '/usr/bin', '/usr/sbin']',
          require => Exec['downloadliferay'],
      }
      
}

