group { "puppet":
    ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }
    file { '/etc/motd':
        content => "Welcome to your Vagrant-built virtual machine! Managed by Puppet.\n"
    }


node default {
  include apt
  include stdlib
  include jenkins


  $plugins = [
    'git',
    'chucknorris',
    'github',
    'greenballs',
    'ruby',
    'rake',
    'ssh',
    'monitoring',
    'favorite',
    'gravatar',
    'jabber',
    'sounds',
    'radiatorviewplugin',
    'vsphere-cloud',
    'warnings',
    'analysis-core',
    'rvm',
    'htmlpublisher',
    'xfpanel',
    'nodejs',
    'heroku-jenkins-plugin',
    's3'
  ]

  jenkins::plugin::install { $plugins: }
}
