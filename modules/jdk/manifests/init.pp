class jdk {
	exec { 'download oracle-jdk':
		cwd		=> '/opt/',
		command	=> '/usr/bin/wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com"  http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin --no-check-certificate',
	}

	exec { 'change_permission_jdk':
		command	=> 'mv jdk-6u45-linux-x64.bin?A* jdk-6u45-linux-x64.bin && chmod a+x jdk-6u45-linux-x64.bin',
		require		=> Exec['download oracle-jdk'],
	}

	exec {'extract_jdk':
		command	=> './jdk-6u45-linux-x64.bin',
		require		=> Exec['change_permission_jdk'],
	}
}
