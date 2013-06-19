class schedulers {
	cron { 'time sync':
		command	=> '/usr/sbin/ntpdate -u time.windows.com',
		hour	=> '*',
		minute	=> '*/1',
		date	=> '*',
		month	=> '*',
		weekday	=> '*',
	}
}
