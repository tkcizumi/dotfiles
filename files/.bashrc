##### import alias #####

test -r ~/.alias && . ~/.alias

##### //import alias #####



##### for powerline-shell #####

function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

##### //for powerline-shell #####



##### for git completion #####

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

##### //for git completion ####



##### Init Nodenv #####

eval "$(nodenv init -)"

##### //Init Nodenv #####



##### Init nvm #####

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

##### //Init nvm #####



##### peco for satori #####

function peco_satori {
    local host="$( ssh 10.101.18.156 aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --region ap-northeast-1 | jq -r '.Reservations|.[]|.Instances|.[]|.PrivateIpAddress + "\t" + (.Tags|.[]|select(.Key|test("^Name"))|.Value)' | peco )"
    echo $host
    if [ ! -z "$host" ] ; then
        #ssh `echo $host|awk '{print $1}'`
        #echo $host|awk '{print $1}' | xargs -o -n1 ssh
        COUNT=`echo "$host" | wc -l`
        if [ "$COUNT" -eq 1  ]; then
            ssh -l izumi_takeshi `echo $host | awk '{print $1}'`
        else
            echo $host | awk '{print $1}' | tr '\n' ' '
            #csshx --login izumi_takeshi `echo $host | awk '{print $1}' | tr '\n' ' '`
        fi
    fi
}

function peco_satori_tky {
    local host="$( curl -sS http://mist.amb-shared.incvb.io/mist/server-list/satori/ | peco )"
    echo $host
    if [ ! -z "$host" ] ; then
        #ssh `echo $host|awk '{print $2}'`
        #echo $host|awk '{print $2}' | xargs -o -n1 ssh
        COUNT=`echo "$host" | wc -l`
        if [ "$COUNT" -eq 1  ]; then
            ssh -l izumi_takeshi `echo $host | awk '{print $2}'`
        else
            echo $host | awk '{print $2}' | tr '\n' ' '
            #csshx --login izumi_takeshi `echo $host | awk '{print $1}' | tr '\n' ' '`
        fi
    fi
}

##### //peco for satori #####
