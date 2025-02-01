#-------------------------------------------------------------------------------
# Welcome Message & Initial Setup
#-------------------------------------------------------------------------------
# Displays colorful welcome message using lolcat
# @see https://github.com/busyloop/lolcat
echo I ❤ ArchCraft Linux OS 🐧️ Sr.Yididiel | lolcat -a -d 50

#-------------------------------------------------------------------------------
# Powerlevel10k Instant Prompt
#-------------------------------------------------------------------------------
# Enables faster shell startup with instant prompt feature
# @see https://github.com/romkatv/powerlevel10k#instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-------------------------------------------------------------------------------
# Zinit Plugin Manager Setup
#-------------------------------------------------------------------------------
# Initialize and auto-install Zinit if not present
# @see https://github.com/zdharma-continuum/zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

#-------------------------------------------------------------------------------
# Theme & Plugin Configuration
#-------------------------------------------------------------------------------
# Load Powerlevel10k Theme
# @see https://github.com/romkatv/powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Essential ZSH Plugins
# Syntax highlighting for commands
# @see https://github.com/zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Enhanced completion system
# @see https://github.com/zsh-users/zsh-completions
zinit light zsh-users/zsh-completions

# Fish-like command suggestions
# @see https://github.com/zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Fuzzy completion for tab
# @see https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab

# Vi mode integration
# @see https://github.com/jeffreytse/zsh-vi-mode
zinit light jeffreytse/zsh-vi-mode

#-------------------------------------------------------------------------------
# Oh-My-Zsh Integration
#-------------------------------------------------------------------------------
# Load useful Oh-My-Zsh plugins
# @see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::git              # Git integration and aliases
zinit snippet OMZP::sudo             # Press ESC twice to add sudo
zinit snippet OMZP::archlinux        # Arch Linux specific commands
zinit snippet OMZP::command-not-found # Package suggestions for unknown commands
zinit snippet OMZP::colored-man-pages # Colorized man pages
zinit snippet OMZP::history          # History management

#-------------------------------------------------------------------------------
# Completion System Setup
#-------------------------------------------------------------------------------
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -U compinit; compinit
_comp_options+=(globdots) # Show hidden files in completion

#-------------------------------------------------------------------------------
# Shell Options & Behavior
#-------------------------------------------------------------------------------
setopt MENU_COMPLETE        # Automatically select first completion entry
setopt AUTO_LIST           # Show completion choices on ambiguous completion
setopt COMPLETE_IN_WORD    # Complete from both ends of word

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

#-------------------------------------------------------------------------------
# Help System Configuration
#-------------------------------------------------------------------------------
# Configure enhanced help system with bat
# @see https://github.com/sharkdp/bat
unalias run-help 2>/dev/null
autoload -Uz run-help
alias help='run-help'
alias vim="nvim"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

#-------------------------------------------------------------------------------
# Cache & Configuration Loading
#-------------------------------------------------------------------------------
zinit cdreplay -q
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#-------------------------------------------------------------------------------
# Path & Environment Configuration
#-------------------------------------------------------------------------------
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:"/home/srhills/.cargo/bin"
export PATH=$HOME/.local/bin:$PATH

export "MICRO_TRUECOLOR=1"
export EDITOR=nvim visudo          # Set Neovim as default editor
export VISUAL=nvim visudo
export FCEDIT=nvim
export TERMINAL=alacritty
export BROWSER=com.firefox.Brower

BAT_THEME="TwoDark"

#-------------------------------------------------------------------------------
# GPG Configuration
#-------------------------------------------------------------------------------
if [ -n "$TTY" ]; then
				export GPG_TTY=$(tty)
else
				export GPG_TTY="$TTY"
fi

#-------------------------------------------------------------------------------
# History Configuration
#-------------------------------------------------------------------------------
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#-------------------------------------------------------------------------------
# Shell Options (SETOPT)
#-------------------------------------------------------------------------------
# History Management
setopt append_history         # Append to history file
setopt extended_history       # Save timestamp in history
setopt hist_expire_dups_first # Remove duplicates first when trimming history
setopt hist_find_no_dups      # Don't display duplicates during searches
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_dups       # Don't record an entry that was just recorded again
setopt hist_ignore_space      # Don't record entries starting with a space
setopt hist_reduce_blanks     # Remove superfluous blanks before recording entry
setopt hist_save_no_dups      # Don't write duplicate entries in the history file
setopt hist_verify            # Show command with history expansion to user before running it
setopt inc_append_history     # Write to the history file immediately, not when the shell exits
setopt share_history          # Share history between all sessions

# Directory Navigation
setopt autocd                # Automatically change directory if a directory is entered
setopt correct              # Command auto-correction
setopt auto_list            # Automatically list choices on an ambiguous completion
setopt auto_pushd           # Make cd push the old directory onto the directory stack
setopt bang_hist            # Treat the '!' character specially during expansion
setopt numericglobsort      # Sort filenames numerically when it makes sense
setopt magicequalsubst      # Enable filename expansion for arguments of the form 'anything=expression'
setopt nonomatch            # Hide error message if there is no match for the pattern
setopt notify              # Report the status of background jobs immediately
setopt promptsubst          # Enable command substitution in prompt
setopt interactive_comments # Allow comments in interactive shells
setopt multios              # Enable multiple input/output redirection
setopt no_beep              # Don't beep on error
setopt prompt_subst         # Parameter expansion, command substitution and arithmetic expansion in prompts
setopt pushd_ignore_dups    # Don't push multiple copies of the same directory onto the directory stack
setopt pushd_minus          # Exchanges meanings of +/- when used with a number to specify a directory in the stack

#-------------------------------------------------------------------------------
# Key Bindings
#-------------------------------------------------------------------------------
bindkey -v                   # Use vi key bindings
bindkey '^P' up-line-or-seach    # Ctrl-P for previous command
bindkey '^N' down-line-or-search # Ctrl-N for next command

#-------------------------------------------------------------------------------
# Environment Variables
#-------------------------------------------------------------------------------
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export DISABLE_MAGIC_FUNCTIONS=true
export ZSH_DISABLE_COMPFIX=true
export EDITOR=nvim
export PAGER=bat

#-------------------------------------------------------------------------------
# Completion Settings
#-------------------------------------------------------------------------------
setopt complete_in_word      # Complete from both ends of a word
setopt always_to_end         # Move cursor to end of word after completion
setopt path_dirs            # Perform path search even on command names with slashes
setopt auto_menu            # Show completion menu on successive tab press
setopt auto_list            # Automatically list choices on ambiguous completion
setopt auto_param_slash     # Add a trailing slash for completed directories
setopt autocd               # Allow changing directories without cd

#-------------------------------------------------------------------------------
# FZF (Fuzzy Finder) Configuration
#-------------------------------------------------------------------------------
# @see https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

#-------------------------------------------------------------------------------
# Completion Styling
#-------------------------------------------------------------------------------
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -1 --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#-------------------------------------------------------------------------------
# Additional Tools & Aliases
#-------------------------------------------------------------------------------
alias vim=nvim

# URL handling
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Load personal configuration
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

#-------------------------------------------------------------------------------
# Shell History Tools
#-------------------------------------------------------------------------------
# Initialize Atuin for better history management
# @see https://github.com/ellie/atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# Initialize TheFuck for command correction
# @see https://github.com/nvbn/thefuck
eval $(thefuck --alias fixit)

#-------------------------------------------------------------------------------
# Directory Navigation Tools
#-------------------------------------------------------------------------------
# Initialize FZF and Zoxide for enhanced navigation
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#-------------------------------------------------------------------------------
# Miscellaneous Settings
#-------------------------------------------------------------------------------
# Spelling correction prompt
SPROMPT='zsh: correct %F{#f14e32}%R%f to %F{green}%r%f [nyae]? '

# Path deduplication
typeset -U PATH

# Autosuggestion styling
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#d787ff,bold'
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'

#-------------------------------------------------------------------------------
# Development Tools
#-------------------------------------------------------------------------------
# Initialize Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Initialize Zellij terminal multiplexer
# @see https://github.com/zellij-org/zellij
eval "$(zellij setup --generate-auto-start zsh)"
