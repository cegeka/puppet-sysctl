# Class: sysctl
#
# This module manages sysctl
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class sysctl {

  exec { 'sysctl/reload':
    path        => ['/sbin'],
    command     => 'sysctl -p /etc/sysctl.conf',
    refreshonly => true
  }

}
