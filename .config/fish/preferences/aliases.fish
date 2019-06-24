################################################################################
# Configuration editing shortcuts
################################################################################

# Shortcut for opening my Fish config in VS Code.
alias fishconfig="code ~/.config/fish"

################################################################################
# Vim
################################################################################

# If neovim is available, make `vim` actually open it.
test -x (which nvim); and alias vim="nvim"

################################################################################
# Git shortcuts
################################################################################

# Use GitHub's `git` wrapper if installed
test -x (which hub); and eval (hub alias -s)

# For when I want a GUI for Git I use Tower. This just makes it easy to open the
# current directory in Tower.
if test -x (which gittower)
  function tower
    if test (count $argv) -eq 0; gittower .
    else; gittower $argv; end
  end
end

################################################################################
# VS Code
################################################################################

if test -x (which code)
  function code
    if test (count $argv) -eq 0; command code .
    else; command code $argv; end
  end
end
