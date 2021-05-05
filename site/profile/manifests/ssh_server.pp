class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service {'sshd':
    ensure => 'running',
    ensure => 'true',
  }
  ssh_authorized_key {'root@master.puppet.vm':
    ensure => present,
    user => 'root',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCuyRLXC7x42JrMsLb02y8bdSbHHCuv+Yu5c28QVb5vm6EaF8dFqhBKtauKrZJbs6I07CGVKAH6lwhky1wXmzGJVr0KCgMosEL1pknMD5EyDCxlg5uDZaaZNevZd0wnRbcQlER2LdJxm1Br2me7xgkO5Er/8mxWfytWYHhqtciEt/ga668AqNs7ZLoARC8440972lP2GJCr35Ivb7lOK8cgAz7ZPAAjW9WLpghYC1dWfG5zB/qvYgpOqlgejnsqq0jbhKaci1UR+VGn8erw+6IdXWiwLEYOhMKkJWVVgo4X3yy+R5RHFTm+PnD/rpTmnrcSYVThm9N2lYz7S6ftzFu/',
  }
}
