export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	docker
	docker-compose
	macos
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.zplug/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
zplug load
eval "$(zoxide init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:/Users/philippkorn/Library/Application Support/Coursier/bin"
export PATH="$PATH:/Users/philippkorn/go/bin"
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"

export ENVIRONMENT="test"
export AWS_REGION="eu-central-1"

alias gs="git status"
alias lg='lazygit'
alias ll='ls -alh'

alias mssh-qa='mssh $BASTION_QA --profile qa'
alias mssh-job-api-qa='mssh $BASTION_JAPI_QA --profile job-api-qa'
alias mssh-integration-qa='mssh $BASTION_INTEGRATION_QA --profile integration-qa'

alias asl='aws sso login'
alias python='python3'
alias wsc='wallpaper set-solid-color 000000'
alias ggg='gcm && gl'
alias qudelix='bash /Users/philippkorn/projects/auto-disconnect/qudelix.sh'

function remove_duplicates() {
	sort $1 | uniq
}


function tmpcode() {
	FNAME=$(date '+%s');
	pbpaste >> ~/codestore/$FNAME.txt;
	bat ~/codestore/$FNAME.txt
}


BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


function jwt() {
	JWTT=$(pbpaste);
	echo $JWTT
	jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$JWTT"
}


function zoom() {
	open $ZOOM_URL
	echo $ZOOM_URL | pbcopy;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

source /Users/philippkorn/.config/broot/launcher/bash/br

[ -f "/Users/philippkorn/.ghcup/env" ] && source "/Users/philippkorn/.ghcup/env" # ghcup-env


if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
