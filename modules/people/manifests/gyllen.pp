class people::gyllen {
  include emacs
  include zsh
  include zshgitprompt
  include heroku
  include chrome
  include skype
  include dropbox
  include redis
  include spotify
  include firefox
  include wget
  include vlc

  $home = "/Users/${::boxen_user}"

  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  package { 'exiftool':
    ensure => installed,
  }

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
    source => "gyllen/dotfiles"
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.emacs":
    ensure  => link,
    target  => "${dotfiles_dir}/.emacs",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.emacs.d2":
    ensure  => link,
    target  => "${dotfiles_dir}/.emacs.d2",
    require => Repository[$dotfiles_dir]
  }
}
