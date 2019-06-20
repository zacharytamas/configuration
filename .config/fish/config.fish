if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

set -x PATH $HOME/bin /usr/local/bin $PATH
set -x EDITOR "vim"

set HERE (dirname (status --current-filename))

for file in $HERE/preferences/*.fish
  source $file
end

# Load [asdf](https://asdf-vm.com/) for automatic environments
test -f ~/.asdf/asdf.fish; and source ~/.asdf/asdf.fish


if test (hostname) = "zachary-jones-od-mac"
  direnv hook fish | source
  __use_opendoor
end

