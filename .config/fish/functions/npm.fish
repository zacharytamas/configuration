function npm --description "Allows using npm-cli args even in Yarn projects"
  # TODO Support discovery of lock files in paths above `cwd`.

  if test -f "package-lock.json"
    echo "Using `npm`..."
    # This project is using npm so we can just pass along all the arguments
    command npm $argv
  else if test -f "yarn.lock"
    echo "Using `yarn`..."

    switch $argv[1]
      case i install
        # TODO: Detect if the intent is to add a package or if to just
        yarn install
      case '*'
        echo "Not supported, you'll need to use the actual yarn command."
    end

  end

end