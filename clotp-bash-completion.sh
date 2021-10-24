_clotp() {
  # $1 = command $2 = word being completed $3 = word preceding
  COMPREPLY=(`find "${HOME}/.clotp" -type f -wholename "${HOME}/.clotp/$2*/key.gpg" -printf "%h " | sed "s@${HOME}/.clotp/@@g"`)
}
complete -F _clotp clotp
