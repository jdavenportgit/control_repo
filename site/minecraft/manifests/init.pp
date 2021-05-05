ass minecraft (
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.1/minecraft_server.1.12.1.jar',
  $install_dir = '/opt/minecraft'
){
  file { $install_dir:
    ensure => directory,
  }
  file { "${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
  }

  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true'
  }
  file {â€˜/etc/systemd/system/minecraft.serviceâ€™:
    ensure => file,
    content => epp(â€˜minecraft/minecraft.service.eppâ€™, {
      install_dir => $install_dir,
    }),
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
  }
}
