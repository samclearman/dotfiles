alias ls="ls -GFlash"
export PS1="\[\e[34m\]\w\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/samclearman/scaleapi/node_modules/tabtab/.completions/serverless.bash ] && . /Users/samclearman/scaleapi/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/samclearman/scaleapi/node_modules/tabtab/.completions/sls.bash ] && . /Users/samclearman/scaleapi/node_modules/tabtab/.completions/sls.bash
