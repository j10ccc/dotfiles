function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd)

    # Display current path
    set_color blue -b normal
    echo -n " $cwd"

    # Show git branch and dirty state
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color yellow -b normal
            echo -n " $git_branch "
        else
            set_color green -b normal
            echo -n " $git_branch "
        end
    end

    if not test $last_status -eq 0
        set_color normal
        set_color --bold red
        echo -n '! '
        set_color normal
    end

    # Reset color for user input
    set_color normal
end
