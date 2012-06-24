#!/usr/bin/env puppet apply --verbose

file { "/tmp/remote_file":
  source => "puppet:///modules/mymod/myfile"
}



