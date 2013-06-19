class schedulers {
	cron { 'time sync':
		command	=> '/usr/sbin/ntpdate -u time.windows.com',
		minute	=> '*/1',
		hour	=> '*',
		month	=> '*',
		weekday	=> '*',
	}
}
