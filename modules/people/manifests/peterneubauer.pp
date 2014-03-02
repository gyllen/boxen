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
  include sizeup
  include sublime_text_2
  include ohmyzsh


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
