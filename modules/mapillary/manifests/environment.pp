class mapillary::environment {
  # mapillary_api
  include postgresql

  # mapillary_ip
  include python
  include rabbitmq
  include cmake

  # mapillary_android
  include android::18
  #include android::tools
  #include android::platform_tools
  #android::build_tools { '19.0.2': }
  #android::add_on { 'addon-google_apis-google-18': }
  #android::extra { 'extra-google-google_play_services': }
  exec { "gradle prepare":
    command => "/bin/sh -c 'cd /opt/boxen/homebrew && /opt/boxen/homebrew/bin/hub checkout 5bab5e9 Library/Formula/gradle.rb'",
    creates => "/opt/boxen/homebrew/bin/gradle"
  }

  package { 'gradle':
    ensure => installed,
    subscribe => Exec['gradle prepare']
  }

  # development
  include virtualbox
  include vagrant



  vagrant::plugin { 'vagrant-omnibus':
  }

  package { 'libjpeg':
    ensure => installed,
  }

  # needed repos
  repository { "${boxen::config::srcdir}/mapillary_api":
    source   => 'mapillary/mapillary_api'
  }

  repository { "${boxen::config::srcdir}/mapillary_vision":
    source => 'mapillary/mapillary_vision'
  }

  repository { "${boxen::config::srcdir}/mapillary_ip":
    source => 'mapillary/mapillary_ip'
  }

  repository { "${boxen::config::srcdir}/mapillary_web":
    source => 'mapillary/mapillary_web'
  }

  repository { "${boxen::config::srcdir}/mapillary_chef":
    source => 'mapillary/mapillary_chef'
  }

  repository { "${boxen::config::srcdir}/mapillary_ios":
    source => 'mapillary/mapillary_ios'
  }

  repository { "${boxen::config::srcdir}/mapillary_demos":
    source => 'mapillary/mapillary_demos'
  }

  repository { "${boxen::config::srcdir}/mapillary_graphsearch":
    source => 'mapillary/mapillary_graphsearch'
  }

  repository { "${boxen::config::srcdir}/mapillary_android":
    source => 'mapillary/mapillary_android'
  }

  repository { "${boxen::config::srcdir}/mapillary_blog":
    source => 'mapillary/mapillary_blog'
  }

  repository { "${boxen::config::srcdir}/mapillary_presentations":
    source => 'mapillary/mapillary_presentations'
  }

  repository { "${boxen::config::srcdir}/mapillary_stats":
    source => 'mapillary/mapillary_stats'
  }
}
