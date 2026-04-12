if status is-interactive
    starship init fish | source

    alias ls "ls -h --group-directories-first --color=auto"
    alias ll "ls -lh --group-directories-first --color=auto"
    alias la "ls -lah --group-directories-first --color=auto"
    
    alias nobup "nobara_updates.sh"
    
    alias comptex "compile_tex.sh"
    alias qcomptex "quick_compile_tex.sh"
    alias cleantex "clean_tex.sh"
    alias qcleantex "quick_clean_tex.sh"
end
