#
# Platform specific aliases
#
platform=`uname`
if [[ $platform == 'Linux' ]]; then
	alias ls='ls -aF --time-style=+"%a %Y-%m-%d %T" --color=auto'

elif [[ $platform == 'Darwin' ]]; then
	alias ls='ls -GAaFf'

elif [[ $platform == 'SunOS' ]]; then
	alias ls='ls -laF'
	export TERM=vt100
fi

#
# Other system aliases
#
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ll='ls -l'
alias l='ls -1'
alias e='exit'

alias cls='clear'
alias csl='clear'
alias lcs='clear'

alias pico='nano'
alias pioc='nano'
alias pcio='nano'
alias pcoi='nano'
alias vi='vim'
alias ed="emacs"
alias em="emacs"

alias less='less -R'
alias more='less'
alias grep='grep --color=auto'
alias top='htop -d 5'
alias suod='sudo'
alias rsync='rsync --progress'

alias locate='locate -i'
alias pstree='pstree -ahlpuU'

alias yes="echo no"

alias busy='while [ TRUE ]; do head -n 100 /dev/urandom; sleep .05; done | hexdump -C | grep --color=none "ca fe"'

alias cert_common_web='locate assets/cert | grep "cert$" | grep "/usr/local/projects" | grep -v "internal_rtools_web\." | grep -v hackathon | grep -v "cert\.eq\." | grep -v tmp | grep -v prototype'

function update_cert_common_web {
	while read -r path; do
		if [ -d "$path" ]; then
			echo ${path}
			cd ${path} && command git checkout master && command git pull
		fi
	done <<< "$(locate assets/cert | grep "cert$" | grep "/usr/local/projects" | grep -v "internal_rtools_web\." | grep -v hackathon | grep -v "cert\.eq\." | grep -v tmp | grep -v prototype)"
}

alias a="cal"
