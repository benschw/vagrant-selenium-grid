class grid(
	$target_dir = '/home/vagrant/',
	$port = '4445'
	) {

	exec { 'clone_grid':
		command     => "git clone https://github.com/benschw/docker-selenium-grid.git",
		user        => "vagrant",
		cwd         => $target_dir,
		require     => [
			Package['git'],
			Package['git'],
		],
		creates     => "$target_dir/docker-selenium-grid",
	}

	exec { 'run_grid':
		command     => "$target_dir/docker-selenium-grid/grid.sh start $port",
		user        => "root",
		require     => [
			Class['docker'],
			Exec['clone_grid']
		]
	}
}