###### powerline-shell #####
function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


##### git-completion ######
if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi


##### init nodenv #####
eval "$(nodenv init -)"
