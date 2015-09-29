function fish_prompt
    # Line 0

    # Virtual environment
    if test $VIRTUAL_ENV
        echo "("(set_color red)(basename $VIRTUAL_ENV)(set_color normal)")"
    end

    # Line 1

    # User
    set_color yellow
    echo -n (whoami)
    set_color normal

    # Host
    echo -n " at "
    set_color magenta
    echo -n (hostname | cut -f1 -d".")
    set_color normal

    # Current working directory
    echo -n " in "
    set_color $fish_color_cwd
    echo -n (pwd | sed "s=$HOME=~=")
    set_color normal

    # Git
    echo -n (__fish_git_prompt)
    set_color normal

    # Line 2

    echo
    printf '↪ '
    set_color normal

    # Enable z
    z --add "$PWD"
end
