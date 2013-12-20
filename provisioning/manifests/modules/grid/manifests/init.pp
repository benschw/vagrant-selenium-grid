class fl(
		$target_dir      = '/usr/local/bin',
		$fl_file         = 'fl',
		$logoutput       = false,
		$svn_login,
		$svn_pass
	) {


	$install_path        = '/home/vagrant'


	exec { 'download_fl':
		command     => "/usr/bin/svn --non-interactive --username=$svn_login --password=$svn_pass co svn://svn.bvidev.com/dev/util/fl-utils/trunk fl-utils",
		user        => "vagrant",
		cwd         => $tmp_path,
		require     => [
			Package['subversion'],
		],
		creates     => "$tmp_path/fl-utils",
	}

	exec { 'build_fl':
		command     => "/usr/bin/ant build dist",
		user        => "vagrant",
		cwd         => "$tmp_path/fl-utils",
		require     => [
			Package['ant'],
			Exec['download_fl'],
			File["/etc/php5/cli/conf.d/fl.ini"],
		],
		creates     => "$tmp_path/fl-utils/dist/fl",
	}
}