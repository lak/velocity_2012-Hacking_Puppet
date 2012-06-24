exec { "/usr/bin/svn co http://core.svn.wordpress.org/trunk/ /tmp/wp":
    creates => "/tmp/wp",
}
