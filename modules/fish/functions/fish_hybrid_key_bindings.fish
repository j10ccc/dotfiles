function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase

    bind -s -M insert ctrl-h backward-char
    bind -s -M insert ctrl-l forward-char
    bind -s -M insert ctrl-j down-line
    bind -s -M insert ctrl-k up-line
end
