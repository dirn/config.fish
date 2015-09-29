function fish_right_prompt --description 'Write out the right prompt'
    set -l columns (tput cols)

    set -l code $status
    if test $code != 0
        set_color --bold red
        echo -n $code
        set_color normal
    end

    set -l battery_tmp (pmset -g batt | egrep "([0-9]+\%).*" -o)
    set -l battery_pct (echo $battery_tmp | cut -f1 -d"%")
    set -l battery_state (echo $battery_tmp | cut -f2 -d" " | cut -f1 -d";")

    switch $battery_state
        case "discharging"
            if test $battery_pct -lt 40
                set_color --bold red
            end
            echo "$battery_pct%"
            set_color normal
    end

    if set -q __fish_vi_mode
        set -l __fish_mode_prompt_insert
        set -l __fish_mode_prompt_normal
        set -l __fish_mode_prompt_visual
        if test -z $__fish_mode_prompt_insert
            if test $columns -lt 120
                set __fish_mode_prompt_insert '[I]'
            else
                set __fish_mode_prompt_insert '[INSERT]'
            end
        end
        if test -z $__fish_mode_prompt_normal
            if test $columns -lt 120
                set __fish_mode_prompt_normal '[N]'
            else
                set __fish_mode_prompt_normal '[NORMAL]'
            end
        end
        if test -z $__fish_mode_prompt_visual
            if test $columns -lt 120
                set __fish_mode_prompt_visual '[V]'
            else
                set __fish_mode_prompt_visual '[VISUAL]'
            end
        end

        echo ' '
        set -l __fish_mode_background
        set -l __fish_mode_prompt_text
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
        set_color --bold white --background $__fish_mode_background
        echo "$__fish_mode_prompt_text"
        set_color normal
    end
end
