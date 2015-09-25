function fish_right_prompt --description 'Write out the right prompt'
    set -l columns (tput cols)

    set -l code $status
    if test $code != 0
        set_color --bold red
        echo -n $code
        set_color normal
    end

    set -l battery (pmset -g batt | egrep "([0-9]+\%).*" -o | cut -f1 -d"%")
    if test $battery -lt 40
        set __fish_battery_color white
        set __fish_battery_background red
    else
        set __fish_battery_color white
        set __fish_battery_background blue
    end

    set_color --bold $__fish_battery_background --background normal
    echo ""
    set_color --bold $__fish_battery_color --background $__fish_battery_background
    if test $columns -lt 120
        echo "$battery%"
    else
        echo " $battery%"
    end

    if set -q __fish_vi_mode
        if test -z $__fish_mode_prompt_insert
            if test $columns -lt 120
                set __fish_mode_prompt_insert '[I]'
            else
                set __fish_mode_prompt_insert ' [INSERT] '
            end
        end
        if test -z $__fish_mode_prompt_normal
            if test $columns -lt 120
                set __fish_mode_prompt_normal '[N]'
            else
                set __fish_mode_prompt_normal ' [NORMAL] '
            end
        end
        if test -z $__fish_mode_prompt_visual
            if test $columns -lt 120
                set __fish_mode_prompt_visual '[V]'
            else
                set __fish_mode_prompt_visual ' [VISUAL] '
            end
        end

        echo ' '
        switch $fish_bind_mode
            case default
                set __fish_mode_background red
                set __fish_mode_prompt_text $__fish_mode_prompt_normal
            case insert
                set __fish_mode_background yellow
                set __fish_mode_prompt_text $__fish_mode_prompt_insert
            case visual
                set __fish_mode_background magenta
                set __fish_mode_prompt_text $__fish_mode_prompt_visual
        end
        set_color --bold $__fish_mode_background --background $__fish_battery_background
        echo ""
        set_color --bold white --background $__fish_mode_background
        echo "$__fish_mode_prompt_text"
        set_color normal
    end
end
