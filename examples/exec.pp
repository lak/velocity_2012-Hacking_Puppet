exec { "svn co http://core.svn.wordpress.org/trunk/ /var/www/wp":
    creates => "/var/www/wp",
}
