function fish_prompt
    # Line 0

    # Virtual environment
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color red)(basename $VIRTUAL_ENV)(set_color normal)
        echo
    end

    # Line 1

    # User
    set_color yellow
    printf '%s' (whoami)
    set_color normal

    # Host
    printf ' at '
    set_color magenta
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal

    # Current working directory
    printf ' in '
    set_color $fish_color_cwd
    printf '%s' (pwd|sed "s=$HOME=~=")
    set_color normal

    # Git
    printf '%s' (__fish_git_prompt)
    set_color normal

    # Line 2

    echo
    printf '↪ '
    set_color normal

    # Enable z
    z --add "$PWD"
end
