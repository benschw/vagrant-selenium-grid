#!/usr/bin/env bash

if [ ! -f /etc/puppet/hiera.yaml ]; then
	apt-key adv --recv-key --keyserver pool.sks-keyservers.net 4BD6EC30
	echo "deb http://apt.puppetlabs.com wheezy main" > /etc/apt/sources.list.d/puppetlabs.list
	echo "deb http://apt.puppetlabs.com wheezy dependencies" >> /etc/apt/sources.list.d/puppetlabs.list

	aptitude update
	aptitude -y install puppet
	touch /etc/puppet/hiera.yaml
fi

