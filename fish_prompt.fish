function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd)

    if not test $last_status -eq 0
        set_color --bold e0def4 -b eb6f92
        echo -n ' ! '
        set_color normal
    end

    # Display current path
    set_color e0def4 -b 31748f
    echo -n " $cwd "

    # Show git branch and dirty state
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color black -b f6c177
            echo -n " $git_branch "
        else
            set_color black -b 9ccfd8
            echo -n " $git_branch "
        end
    end

    # Add a space
    set_color normal
    echo -n ' '
end
