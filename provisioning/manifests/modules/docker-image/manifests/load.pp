define docker-image::load(
	$repo_url,
	$repo_name,
	$docker_tag,
) {
	include docker-image


	exec { "clone_$repo_name":
		command     => "git clone $repo_url",
		user        => "vagrant",
		cwd         => "/tmp/docker",
		require     => [
			Package['git'],
			File["/tmp/docker"],
		],
		creates     => "/tmp/docker/$repo_name",
	}

	exec { "install_$repo_name":
		command     => "docker build -t $docker_tag /tmp/docker/$repo_name/",
		user        => "root",
		require     => [
			Exec["clone_$repo_name"],
			Package["lxc-docker"],
			Service["docker"],
		],
	}

}