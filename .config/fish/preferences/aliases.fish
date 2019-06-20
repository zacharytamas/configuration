################################################################################
# Configuration editing shortcuts
################################################################################

# Shortcut for opening my Fish config in VS Code.
alias fishconfig="code ~/.config/fish"

################################################################################
# Git shortcuts
################################################################################

# Use GitHub's `git` wrapper if installed
if hash hub 2>/dev/null
  eval (hub alias -s)
end

# For when I want a GUI for Git I use Tower. This just makes it easy to open the
# current directory in Tower.
if hash gittower 2>/dev/null
  function tower
    if test (count $argv) -eq 0
      gittower .
      return
    end
    gittower $argv
  end
end
