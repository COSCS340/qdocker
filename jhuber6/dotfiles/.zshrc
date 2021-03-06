autoload -U compinit
compinit

# Get other shell configuration
source $HOME/.zsh.prompt       # set the prompt
source $HOME/.zsh.exports      # setup the PATH
source $HOME/.zsh.aliases	   # setup command aliases

# Turn off core dumps
limit coredumpsize 0

# Set some usefull options
setopt nohup            # Don't kill jobs when the shell exits
setopt nobeep           # Don't beep at me all the time
setopt nocheckjobs      # Don't check for running jobs at shell exit
setopt longlistjobs     # Show more information about jobs
setopt pushdtohome      # pushd goes to $HOME if nothing else is given
setopt noflowcontrol    # Disables ^S/^Q in line-edit mode
