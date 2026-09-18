eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Keep PATH entries unique when this file is sourced more than once.
typeset -U path PATH
path=(
  /opt/homebrew/opt/krb5/bin
  /opt/homebrew/opt/openldap/bin
  "$HOME/workspace/scripts"
  $path
)
