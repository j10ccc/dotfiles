function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo N
        case insert
            set_color --bold cyan
            echo I
        case replace_one
            set_color --bold cyan
            echo R
        case visual
            set_color --bold purple
            echo V
        case '*'
            set_color --bold red
            echo '?'
    end
    set_color normal
end
