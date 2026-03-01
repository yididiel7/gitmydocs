# Basic System Commands
# ====================
# Clear terminal and reset commands
alias cl='clear'                          # Clear terminal screen
alias re='reset'                          # Reset terminal completely

# Enhanced Default Commands
# See: https://github.com/neovim/neovim
alias vim='nvim'                          # Use NeoVim instead of Vim
alias df='df -h | lolcat'                 # Human readable disk usage with colors
alias ip='ip --color=auto'                # Colorized IP output

# System Monitoring & Information
# See: https://github.com/aristocratos/bpytop
alias wtr='curl wttr.in/Dimona'           # Weather information for Dimona
alias nd='ncdu --color dark'              # NCurses Disk Usage with dark theme
alias bpyt='bpytop'                       # Resource monitor

# Enhanced File Operations
alias cat='ccat'                          # Colored cat output
alias dict='dict -d moby-thesaurus'       # Dictionary
alias thesaurus='dict -d moby-thesaurus'  # Dictionary/thesaurus lookup
alias firefox='/opt/firefox/firefox'      # Direct Firefox launcher
alias info='pinfo'                        # Enhanced info reader

# Terminal Recording
# See: https://asciinema.org/
alias rec='asciinema rec'                 # Record terminal session
alias play='asciinema play'               # Play recorded terminal session
alias stream='asciinema stream -r'        # Stream recorded terminal session

alias yt-dlp='yt-dlp -f bv+ba/b'          # This command will prioritize downloading the best video and audio tracks separately

# Directory Navigation & Error Prevention file access
alias cp="cp -riv"     # cp Alias to copy files and directories recursively (-r), interactively (-i), and with verbose output (-v)
alias ln="ln -iv"      # ln Alias to create symbolic links with interactive (-i) prompt and verbose (-v) output
alias rm="rm -iv"      # rm Alias to remove files and directories interactively (-i) with verbose (-v) output
alias mv="mv -iv"      # mv Alias to move files and directories interactively (-i) with verbose (-v) output
alias mkdir="mkdir -vp" # mkdir Alias to create parent directories (-p) and verbose (-v) output

# Power Management
alias po="sudo shutdown now"              # Poweroff
alias rs="sudo reboot"                    # Reboot

# Common Typo Fixes
alias cd..='cd ..'                        # Fix common typo
alias pdw='pwd'                           # Fix common typo

# Shell Management
alias ncmpcpp='sudo ncmpcpp'              # Music player with sudo
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# Config File Management
alias ec="$EDITOR $HOME/.zshrc"           # Edit zshrc
alias sc="source $HOME/.zshrc"            # Source zshrc
alias szp="source $HOME/.zshrc-personal"  # Source personal zshrc

# Enhanced Grep Commands
# See: https://www.gnu.org/software/grep/
alias grep='grep --color=auto'            # Colorized grep
alias egrep='egrep --color=auto'          # Extended grep with colors
alias fgrep='fgrep --color=auto'          # Fast grep with colors

# Fun Terminal Tools
alias fcl='fortune | cowsay | lolcat'     # Fortune cookie with cow and colors
alias lolls='ls -l | lolcat'              # Colorful directory listing
alias ft='fortune | lolcat'               # Colorful fortune cookies

# File Listing Configuration - Using eza as primary
# See: https://github.com/ogham/exa
if [[ -x "$(command -v eza)" ]]; then
    alias ls="eza --long --color=always --icons=always --no-user"  # Colorful directory listing
    alias exa="eza --long --color=always --icons=always --no-user"  # Colorful directory listing
    alias eza='exa -alh'  # Colorful directory listing
    alias l='exa -lbF --git' # Colorful directory listing
    alias ll='eza -la'  
    alias llm='exa -lbGd --git --sort=modified' 
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
    alias lt='exa --tree --level=2'
    alias lS='exa -1'
elif [[ -x "$(command -v lsd)" ]]; then
    # Fallback to lsd if eza is not available
    alias ls='lsd -F --group-dirs first'
    alias ll='lsd --all --header --long --group-dirs first'
    alias tree='lsd --tree'
    alias lt='lsd --tree'
else
    # Fallback to standard ls
#    alias ls="ls --color=auto"
#    alias ll='ls -la'
#    alias lt='ls --tree' 2>/dev/null || alias lt='ls -R'
fi

# Special Directories Listing
alias ldc='lsd --group-directories-first' 2>/dev/null || alias ll='ls -l --group-directories-first'

# Git Shortcuts
# See: https://git-scm.com/
alias gcl='git clone --depth 1'           # Shallow clone
alias gi='git init'                       # Initialize repo
alias ga='git add'                        # Stage files
alias gc='git commit -m'                  # Commit with message
alias gp='git push origin master'         # Push to master
alias g='gollama'

# Logo-ls Commands
# See: https://github.com/Yash-Handa/logo-ls
if [[ -x "$(command -v logo-ls)" ]]; then
    alias ilag='logo-ls -AD'              # All files except . and ..
    alias ila='logo-ls -A'                # Almost all files
    alias illg='logo-ls -alD'             # Long listing with logos
    alias ill='logo-ls -al'                # Long listing
    alias ilsg='logo-ls -D'                # Only directories
    alias ils='logo-ls'                    # Default with logos
fi

# Hardware Information
alias hw='hwinfo --short'                 # Hardware information summary

# History Commands
alias h='history'                         # List history
alias hl='history | bat'                  # List history with bat

# Package Management (Pacman)
# See: https://wiki.archlinux.org/title/Pacman
alias pacman='sudo pacman --color auto'    # Pacman with colors
alias update='sudo pacman -Syyu'           # Update standard packages
alias upd='sudo pacman -Syu'               # Update standard pkgs and AUR pkgs

# Pacman Commands
alias sps='sudo pacman -S'                # Install
alias spss='sudo pacman -Ss'              # Search
alias spq='sudo pacman -Q'                # Query
alias spr='sudo pacman -R'                 # Remove
alias sprs='sudo pacman -Rs'              # Remove with dependencies
alias sprdd='sudo pacman -Rdd'            # Remove orphaned packages
alias spqo='sudo pacman -Qo'              # What provides a package
alias spsii='sudo pacman -Sii'            # Package information

# Mirror Management
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

# Package Management Utilities
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # Cleanup orphaned packages
alias list="sudo pacman -Qqe"                    # List explicitly installed packages
alias listt="sudo pacman -Qqet"                  # List explicitly installed packages without dependencies
alias listaur="sudo pacman -Qqem"                 # List AUR packages

# System Utilities
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"
alias rg="rg --sort path"
alias jctl="journalctl -p 3 -xb"

# AUR Helper (Paru)
alias upqll='paru -Syu --noconfirm'
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'

# System Information
alias cpu="cpuid -i | grep uarch | head -n 1"
alias audio="pactl info | grep 'Server Name'"  # Check if system is using PulseAudio or Pipewire

# Directory and file sorting
alias lt="eza --tree --level=2 2>/dev/null || ls --tree 2>/dev/null || ls -R"  # Tree view

# Process Management
alias psa="ps auxf"                           # Display all processes in BSD format with full details and ASCII art process tree
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"    # Search processes excluding grep process itself

# YouTube Download Commands (requires yt-dlp)
alias yta-aac="yt-dlp --extract-audio --audio-format aac"   # Download and convert to AAC audio
alias yta-best="yt-dlp --extract-audio --audio-format best"  # Download best quality audio
alias yta-flac="yt-dlp --extract-audio --audio-format flac"  # Download and convert to FLAC format
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"    # Download and convert to MP3
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"  # Download best quality video+audio

# System Management
alias kpi='killall picom'                     # Terminate all instances of the picom compositor
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"  # Reset ownership of config directories to current user

# GitHub CLI Aliases
alias copilot='gh copilot'
alias gcs='gh copilot suggest'
alias gce='gh copilot explain'
alias gcse='gh config set editor "nvim --wait"'
alias copilot-cli='copilot'                   # GitHub Copilot CLI (standalone)

# Function Dependencies
alias depends='function_depends'

# Function to show packages that depend on a given package
function function_depends() {
  search=$(echo "$1")
  sudo pacman -Sii $search | grep "Required By" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}

# Global aliases for help pages
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# Screenshot Tools
alias grim='grim -g "$(slurp)"'

# Clipboard Management
alias wl-copy='xclip -selection clipboard'
alias wl-paste='xclip -selection clipboard -o'
alias sortclipboard='wl-paste | sort | wl-copy'

# Phone/File Transfer
alias aft="android-file-transfer"

# Location
alias whereami='echo $PWD'

# Fabric AI Aliases
alias fabric='fabric-ai'

# -------------------------------------------
# 5. Suffix Aliases - Open Files by Extension
# -------------------------------------------
# Just type the filename to open it with the associated program
alias -s json=jless    # Open JSON files with jless
alias -s md=bat        # Open Markdown files with bat
alias -s go='$EDITOR'  # Open Go files with the editor
alias -s rs='$EDITOR'  # Open Rust files with the editor
alias -s txt=bat       # Open text files with bat
alias -s log=bat       # Open log files with bat
alias -s py='$EDITOR'  # Open Python files with the editor
alias -s js='$EDITOR'  # Open JavaScript files with the editor
alias -s ts='$EDITOR'  # Open TypeScript files with the editor
alias -s conf='$EDITOR'  # Open configuration files with the editor
alias -s yml='$EDITOR'  # Open YAML files with the editor
alias -s toml='$EDITOR'  # Open TOML files with the editor
alias -s sh='$EDITOR'  # Open shell scripts with the editor
alias -s rb='$EDITOR'  # Open Ruby files with the editor
alias -s java='$EDITOR'  # Open Java files with the editor
alias -s c='$EDITOR'  # Open C files with the editor
alias -s cpp='$EDITOR'  # Open C++ files with the editor
alias -s cs='$EDITOR'  # Open C# files with the editor
alias -s html='$EDITOR'  # Open HTML files with the editor
alias -s css='$EDITOR'  # Open CSS files with the editor
alias -s js='$EDITOR'  # Open JavaScript files with the editor
alias -s ts='$EDITOR'  # Open TypeScript files with the editor
alias -s md=bat        # Open Markdown files with bat
alias -s mkd=bat       # Open Markdown files with bat

# Grub Configuration
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'  # Generate GRUB configuration



# -------------------------------------------
# 7. zmv - Advanced Batch Rename/Move
# -------------------------------------------
# Enable zmv
autoload -Uz zmv
# Usage examples:
# zmv '(*).log' '$1.txt' # Rename .log to .txt
# zmv -w '*.log' '*.txt' # Same thing, simpler syntax
# zmv -n '(*).log' '$1.txt' # Dry run (preview changes)
# zmv -i '(*).log' '$1.txt' # Interactive mode (confirm each)
# Helpful aliases for zmv
alias zcp='zmv -C' # Copy with patterns
alias zln='zmv -L' # Link with patterns
# -------------------------------------------
# 8. Named Directories - Bookmark Folders
# -------------------------------------------
# Access with ~name syntax, e.g., cd ~yt or ls ~yt
hash -d yt=~/projects/youtube
hash -d dot=~/.dotfiles
hash -d dl=~/Downloads
# Add your own commonly used directories here

# -------------------------------------------
# 6. Global Aliases - Use Anywhere in Commands
# -------------------------------------------
# Redirect stderr to /dev/null
alias -g NE='2>/dev/null'

# Redirect stdout to /dev/null
alias -g NO='>/dev/null'

# Redirect both stdout and stderr to /dev/null
alias -g NUL='>/dev/null 2>&1'

# Pipe to jq
alias -g J='| jq'

# ================================================================================
# FABRIC AI PATTERN ALIASES (Corrected with proper alias keyword)
# ================================================================================

alias agility_story='fabric --pattern agility_story'
alias ai='fabric --pattern ai'
alias analyze_answers='fabric --pattern analyze_answers'
alias analyze_bill='fabric --pattern analyze_bill'
alias analyze_bill_short='fabric --pattern analyze_bill_short'
alias analyze_candidates='fabric --pattern analyze_candidates'
alias analyze_cfp_submission='fabric --pattern analyze_cfp_submission'
alias analyze_claims='fabric --pattern analyze_claims'
alias analyze_comments='fabric --pattern analyze_comments'
alias analyze_debate='fabric --pattern analyze_debate'
alias analyze_email_headers='fabric --pattern analyze_email_headers'
alias analyze_incident='fabric --pattern analyze_incident'
alias analyze_interviewer_techniques='fabric --pattern analyze_interviewer_techniques'
alias analyze_logs='fabric --pattern analyze_logs'
alias analyze_malware='fabric --pattern analyze_malware'
alias analyze_military_strategy='fabric --pattern analyze_military_strategy'
alias analyze_mistakes='fabric --pattern analyze_mistakes'
alias analyze_paper='fabric --pattern analyze_paper'
alias analyze_paper_simple='fabric --pattern analyze_paper_simple'
alias analyze_patent='fabric --pattern analyze_patent'
alias analyze_personality='fabric --pattern analyze_personality'
alias analyze_presentation='fabric --pattern analyze_presentation'
alias analyze_product_feedback='fabric --pattern analyze_product_feedback'
alias analyze_proposition='fabric --pattern analyze_proposition'
alias analyze_prose='fabric --pattern analyze_prose'
alias analyze_prose_json='fabric --pattern analyze_prose_json'
alias analyze_prose_pinker='fabric --pattern analyze_prose_pinker'
alias analyze_risk='fabric --pattern analyze_risk'
alias analyze_sales_call='fabric --pattern analyze_sales_call'
alias analyze_spiritual_text='fabric --pattern analyze_spiritual_text'
alias analyze_tech_impact='fabric --pattern analyze_tech_impact'
alias analyze_terraform_plan='fabric --pattern analyze_terraform_plan'
alias analyze_threat_report='fabric --pattern analyze_threat_report'
alias analyze_threat_report_cmds='fabric --pattern analyze_threat_report_cmds'
alias analyze_threat_report_trends='fabric --pattern analyze_threat_report_trends'
alias answer_interview_question='fabric --pattern answer_interview_question'
alias apply_ul_tags='fabric --pattern apply_ul_tags'
alias ask_secure_by_design_questions='fabric --pattern ask_secure_by_design_questions'
alias ask_uncle_duke='fabric --pattern ask_uncle_duke'
alias capture_thinkers_work='fabric --pattern capture_thinkers_work'
alias check_agreement='fabric --pattern check_agreement'
alias clean_text='fabric --pattern clean_text'
alias coding_master='fabric --pattern coding_master'
alias compare_and_contrast='fabric --pattern compare_and_contrast'
alias convert_to_markdown='fabric --pattern convert_to_markdown'
alias create_5_sentence_summary='fabric --pattern create_5_sentence_summary'
alias create_academic_paper='fabric --pattern create_academic_paper'
alias create_ai_jobs_analysis='fabric --pattern create_ai_jobs_analysis'
alias create_aphorisms='fabric --pattern create_aphorisms'
alias create_art_prompt='fabric --pattern create_art_prompt'
alias create_better_frame='fabric --pattern create_better_frame'
alias create_coding_feature='fabric --pattern create_coding_feature'
alias create_coding_project='fabric --pattern create_coding_project'
alias create_command='fabric --pattern create_command'
alias create_cyber_summary='fabric --pattern create_cyber_summary'
alias create_design_document='fabric --pattern create_design_document'
alias create_diy='fabric --pattern create_diy'
alias create_excalidraw_visualization='fabric --pattern create_excalidraw_visualization'
alias create_flash_cards='fabric --pattern create_flash_cards'
alias create_formal_email='fabric --pattern create_formal_email'
alias create_git_diff_commit='fabric --pattern create_git_diff_commit'
alias create_graph_from_input='fabric --pattern create_graph_from_input'
alias create_hormozi_offer='fabric --pattern create_hormozi_offer'
alias create_idea_compass='fabric --pattern create_idea_compass'
alias create_investigation_visualization='fabric --pattern create_investigation_visualization'
alias create_keynote='fabric --pattern create_keynote'
alias create_loe_document='fabric --pattern create_loe_document'
alias create_logo='fabric --pattern create_logo'
alias create_markmap_visualization='fabric --pattern create_markmap_visualization'
alias create_mermaid_visualization='fabric --pattern create_mermaid_visualization'
alias create_mermaid_visualization_for_github='fabric --pattern create_mermaid_visualization_for_github'
alias create_micro_summary='fabric --pattern create_micro_summary'
alias create_mnemonic_phrases='fabric --pattern create_mnemonic_phrases'
alias create_network_threat_landscape='fabric --pattern create_network_threat_landscape'
alias create_newsletter_entry='fabric --pattern create_newsletter_entry'
alias create_npc='fabric --pattern create_npc'
alias create_pattern='fabric --pattern create_pattern'
alias create_prd='fabric --pattern create_prd'
alias create_prediction_block='fabric --pattern create_prediction_block'
alias create_quiz='fabric --pattern create_quiz'
alias create_reading_plan='fabric --pattern create_reading_plan'
alias create_recursive_outline='fabric --pattern create_recursive_outline'
alias create_report_finding='fabric --pattern create_report_finding'
alias create_rpg_summary='fabric --pattern create_rpg_summary'
alias create_security_update='fabric --pattern create_security_update'
alias create_show_intro='fabric --pattern create_show_intro'
alias create_sigma_rules='fabric --pattern create_sigma_rules'
alias create_story_about_people_interaction='fabric --pattern create_story_about_people_interaction'
alias create_story_about_person='fabric --pattern create_story_about_person'
alias create_story_explanation='fabric --pattern create_story_explanation'
alias create_stride_threat_model='fabric --pattern create_stride_threat_model'
alias create_summary='fabric --pattern create_summary'
alias create_tags='fabric --pattern create_tags'
alias create_threat_scenarios='fabric --pattern create_threat_scenarios'
alias create_ttrc_graph='fabric --pattern create_ttrc_graph'
alias create_ttrc_narrative='fabric --pattern create_ttrc_narrative'
alias create_upgrade_pack='fabric --pattern create_upgrade_pack'
alias create_user_story='fabric --pattern create_user_story'
alias create_video_chapters='fabric --pattern create_video_chapters'
alias create_visualization='fabric --pattern create_visualization'
alias dialog_with_socrates='fabric --pattern dialog_with_socrates'
alias enrich_blog_post='fabric --pattern enrich_blog_post'
alias explain_code='fabric --pattern explain_code'
alias explain_docs='fabric --pattern explain_docs'
alias explain_math='fabric --pattern explain_math'
alias explain_project='fabric --pattern explain_project'
alias explain_terms='fabric --pattern explain_terms'
alias export_data_as_csv='fabric --pattern export_data_as_csv'
alias extract_algorithm_update_recommendations='fabric --pattern extract_algorithm_update_recommendations'
alias extract_alpha='fabric --pattern extract_alpha'
alias extract_article_wisdom='fabric --pattern extract_article_wisdom'
alias extract_book_ideas='fabric --pattern extract_book_ideas'
alias extract_book_recommendations='fabric --pattern extract_book_recommendations'
alias extract_business_ideas='fabric --pattern extract_business_ideas'
alias extract_controversial_ideas='fabric --pattern extract_controversial_ideas'
alias extract_core_message='fabric --pattern extract_core_message'
alias extract_ctf_writeup='fabric --pattern extract_ctf_writeup'
alias extract_domains='fabric --pattern extract_domains'
alias extract_extraordinary_claims='fabric --pattern extract_extraordinary_claims'
alias extract_ideas='fabric --pattern extract_ideas'
alias extract_insights='fabric --pattern extract_insights'
alias extract_insights_dm='fabric --pattern extract_insights_dm'
alias extract_instructions='fabric --pattern extract_instructions'
alias extract_jokes='fabric --pattern extract_jokes'
alias extract_latest_video='fabric --pattern extract_latest_video'
alias extract_main_activities='fabric --pattern extract_main_activities'
alias extract_main_idea='fabric --pattern extract_main_idea'
alias extract_mcp_servers='fabric --pattern extract_mcp_servers'
alias extract_most_redeeming_thing='fabric --pattern extract_most_redeeming_thing'
alias extract_patterns='fabric --pattern extract_patterns'
alias extract_poc='fabric --pattern extract_poc'
alias extract_predictions='fabric --pattern extract_predictions'
alias extract_primary_problem='fabric --pattern extract_primary_problem'
alias extract_primary_solution='fabric --pattern extract_primary_solution'
alias extract_product_features='fabric --pattern extract_product_features'
alias extract_questions='fabric --pattern extract_questions'
alias extract_recipe='fabric --pattern extract_recipe'
alias extract_recommendations='fabric --pattern extract_recommendations'
alias extract_references='fabric --pattern extract_references'
alias extract_skills='fabric --pattern extract_skills'
alias extract_song_meaning='fabric --pattern extract_song_meaning'
alias extract_sponsors='fabric --pattern extract_sponsors'
alias extract_videoid='fabric --pattern extract_videoid'
alias extract_wisdom='fabric --pattern extract_wisdom'
alias extract_wisdom_agents='fabric --pattern extract_wisdom_agents'
alias extract_wisdom_dm='fabric --pattern extract_wisdom_dm'
alias extract_wisdom_nometa='fabric --pattern extract_wisdom_nometa'
