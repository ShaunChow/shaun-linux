export PATH=$PATH:$HOME/.pkg_uninstaller:$HOME/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:/usr/local/opt/mysql-client/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shaunchow/.sdkman"
[[ -s "/Users/shaunchow/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shaunchow/.sdkman/bin/sdkman-init.sh"

#This is socket5 proxy
export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"

#Golang
export GOPATH=$HOME/go
export GO111MODULE=auto

#Ansible
export ANSIBLE_STDOUT_CALLBACK=debug

#NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

