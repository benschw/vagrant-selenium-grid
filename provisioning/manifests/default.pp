Exec { 
	path => "/usr/bin:/usr/sbin:/bin:/sbin" 
}



node default {
		
	package {["git"]:
		ensure => present,
	}


	class { 'docker':
		# manage_kernel => false,
	}
	
	class { 'grid':
		target_dir => '/home/vagrant/',
		port => '4445'
	}

}
