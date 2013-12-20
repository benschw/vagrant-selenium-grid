class docker::service (
  $tcp_bind    = $docker::tcp_bind,
  $socket_bind = $docker::socket_bind,
){
  service { 'docker':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
  }

  file { '/etc/init/docker.conf':
    ensure  => present,
    force   => true,
    content => template('docker/etc/init/docker.conf.erb'),
    notify  => Service['docker'],
  }
}
