if status is-interactive
    starship init fish | source

    alias ls "ls -h --group-directories-first --color=auto"
    alias ll "ls -lh --group-directories-first --color=auto"
    alias la "ls -lah --group-directories-first --color=auto"
end
