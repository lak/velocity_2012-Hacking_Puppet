#!/usr/bin/env puppet apply --verbose

file { "/tmp/local_file":
  content => "random_content\n",
  ensure => file
}



