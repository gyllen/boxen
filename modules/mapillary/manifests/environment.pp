class mapillary::environment {
  # mapillary_api
  include postgresql

  # mapillary_ip
  include python
  include rabbitmq
  include cmake

  # development
  include virtualbox
  include vagrant

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

  repository { "${boxen::config::srcdir}/mapillary_website":
    source => 'mapillary/mapillary_website'
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
}
