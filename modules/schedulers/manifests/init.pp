class schedulers {
	cron { 'time sync':
		command	=> '/usr/sbin/ntpdate -u time.windows.com'
		hour	=> '11',
		minute	=> '55',
	}
}
