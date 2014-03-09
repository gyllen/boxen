class people::peterneubauer {
  include zsh
  include zshgitprompt
  include heroku
  include chrome
  include skype
  include dropbox
  include redis
  include spotify
  include firefox
  include sizeup
  include menumeters
  include wget
  include hipchat
  include sublime_text_2
  include ohmyzsh



  #install mono framework
  exec { "tap-mono":
    provider => 'shell',
    command => "env -i zsh -c 'source /opt/boxen/env.sh && brew tap dtrebbien/mono'",
    creates => "${homebrew::config::tapsdir}/dtrebbien-mono",
  }

  #geteventstore
  exec { "tap-eventstore":
    provider => 'shell',
    command => "env -i zsh -c 'source /opt/boxen/env.sh && brew tap peterneubauer/homebrew-geteventstore'",
    creates => "${homebrew::config::tapsdir}/peterneubauer-geteventstore",
    require => [
        Exec["tap-mono"],
    ],
  } 

  #start with `mono-sgen /opt/boxen/homebrew/Cellar/geteventstore/2.0.1/bin/EventStore.SingleNode.exe --db ./ESData`
  package { 'geteventstore':
    ensure => installed,
    require => [
        Exec["tap-eventstore"],
    ],
  }


  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  $home = "/Users/${::boxen_user}"

  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  package { 'tree':
    ensure => installed,
  }

  package { 'colordiff':
    ensure => installed,
  }

  package { 'imagemagick':
    ensure => installed,
  }

  repository { $dotfiles_dir:
    source => "peterneubauer/dotfiles"
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir]
  }

}
