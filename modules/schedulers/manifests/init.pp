class schedulers {
	cron { 'time sync':
		command	=> '/usr/sbin/ntpdate -u time.windows.com',
		minute	=> '0',
		hour	=> '*/2',
		month	=> '*',
		weekday	=> '*',
	}
}
