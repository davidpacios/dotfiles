set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"

# Prompt
starship init fish | source
