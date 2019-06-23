################################################################################
# Configuration editing shortcuts
################################################################################

# Shortcut for opening my Fish config in VS Code.
alias fishconfig="code ~/.config/fish"

################################################################################
# Git shortcuts
################################################################################

# Use GitHub's `git` wrapper if installed
if test -x (which hub)
  eval (hub alias -s)
end

# For when I want a GUI for Git I use Tower. This just makes it easy to open the
# current directory in Tower.
if test -x (which gittower)
  function tower
    if test (count $argv) -eq 0
      gittower .
      return
    end
    gittower $argv
  end
end
