#PROMPT="%F{green}%n%f@%F{yellow}%m%f %F{blue}%1~%f > "

# Load version control information
setopt PROMPT_SUBST
#autoload -Uz vcs_info
#precmd() { vcs_info }

#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' unstagedstr '%F{red}✗ '
#zstyle ':vcs_info:git:*' stagedstr '%F{red}✗ '
#zstyle ':vcs_info:git:*' formats '%F{green}✓ %F{yellow}(%b)%f'
#zstyle ':vcs_info:git:*' actionformats '%F{red}✗ %F{yellow}(%b|%a)%f'

# Function to parse branch and check for uncommitted changes
parse_git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    # Check if git status is dirty
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
      echo " %F{red}✗ %F{yellow}(${branch})%f"
    else
      echo " %F{green}✓ %F{yellow}(${branch})%f"
    fi
  fi
}

# Format: user@host (Top line) | Path + Git info (Bottom line)
PROMPT='%F{cyan}%n@%m %F{yellow}%~ %F{red}$(parse_git_branch)%f%F{magenta}❯%f '
#PROMPT='%F{cyan}%n@%m %F{yellow}%~ %F{red}${vcs_info_msg_0_}%f%F{magenta}❯%f '

alias ll="ls -la"
alias gpl='(){git pull $* ;}'
alias gps='(){ git push $* ;}'
alias gadog="git adog"
alias glg="git lg"
alias gst="git status"

# alias.lg=log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
# alias.adog=log --all --decorate --oneline --graph


export PATH="/opt/homebrew/opt/krb5/bin:/opt/homebrew/opt/openldap/bin:~/workspace/scripts:$PATH"
