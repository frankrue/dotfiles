# global vars
export PATH="$HOME/.avn/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$HOME/aws-eb:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin:$HOME/Android/tools:$HOME/bin:$HOME/.rvm/bin"
export ZSH=$HOME/.oh-my-zsh
export NPM_TOKEN=51f94428-9079-46bb-b7df-55848893c6b1

# script vars
ZSH_THEME="../custom/themes/geometry/geometry"
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
ANDROID_HOME="$HOME/Android"
ANDROID_SDK_HOME="$HOME/Android"
ANDROID_SDK_ROOT="$HOME/Android"
plugins=(git tmux git osx zsh-syntax-highlighting)

# sources
source $HOME/.iterm2_shell_integration.`basename $SHELL`
source $ZSH/oh-my-zsh.sh

# loads
. `brew --prefix`/etc/profile.d/z.sh # load z
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi # load rbenv
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file, rather than overwriting it
setopt APPEND_HISTORY;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;
