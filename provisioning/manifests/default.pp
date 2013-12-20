Exec { path => "/usr/bin:/usr/sbin:/bin:/sbin" }



node default {
		
	package {["git", "curl", "python"]:
			ensure => present,
	}


	class { 'docker':
			# manage_kernel => false,
	}
	
#	docker-image::load { 'debianbase-image':
#		repo_url   => 'http://git.bvops.net/scm/auto/debianbase-docker.git',
#		repo_name  => 'debianbase-docker',
#		docker_tag => 'bancvue/debian'
#	}


}
