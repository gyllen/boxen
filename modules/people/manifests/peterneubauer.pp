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
  include transmission
  include vlc
  include shiftit


  package { 'exiftool':
    ensure => installed,
  }
  package { 'maven':
    ensure => installed,
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
