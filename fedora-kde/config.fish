if status is-interactive
    oh-my-posh init fish --config ~/.poshthemes/jblab_2021.omp.json | source

    alias ls "ls -h --group-directories-first --color=auto"
    alias ll "ls -lh --group-directories-first --color=auto"
    alias la "ls -lah --group-directories-first --color=auto"
    
    alias fedup "fedora_updates.sh"
end
