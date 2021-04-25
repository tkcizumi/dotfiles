##### import .path #####

test -r ~/.path && . ~/.path

##### //import .bashrc #####



##### import alias #####

test -r ~/.alias && . ~/.alias

##### //import alias #####



##### Init Nodenv #####

eval "$(nodenv init -)"

##### //Init Nodenv #####



##### Init nvm #####

# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

##### //Init nvm #####



##### for powerline-shell #####

function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

##### //for powerline-shell #####



##### for git completion #####
if [ -e ~/.zsh/git-prompt.sh -a -e ~/.zsh/git-completion.bash ]; then
    echo "TEST"
    source ~/.zsh/git-prompt.sh

    fpath=(~/.zsh $fpath)
    zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
    autoload -Uz compinit && compinit

    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto

    # プロンプトの表示設定(好きなようにカスタマイズ可)
    setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
fi
##### //for git completion ####
