function fish_right_prompt --description 'Write out the right prompt'
    set -l code $status
    if test $code != 0
        set_color --bold red
        echo -n $code
        set_color normal
    end

    if set -q __fish_vi_mode
        set -l columns (tput cols)

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
        switch $fish_bind_mode
            case default
                set_color --bold --background red white
                echo "$__fish_mode_prompt_normal"
            case insert
                set_color --bold --background green white
                echo "$__fish_mode_prompt_insert"
            case visual
                set_color --bold --background magenta white
                echo "$__fish_mode_prompt_visual"
        end
        set_color normal
    end
end
