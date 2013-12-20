class docker-image() {

	$tmp_path = '/tmp/docker'

	file { "$tmp_path":
		ensure => "directory",
		owner  => "vagrant",
		mode   => 750,
	}
}
