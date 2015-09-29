eval (python -m virtualfish auto_activation global_requirements projects)

set -x __fish_git_prompt_showdirtystate true
set -x __fish_git_prompt_showuntrackedfiles true
set -x ___fish_git_prompt_color_branch (set_color blue)
set -x ___fish_git_prompt_color_branch_done (set_color normal)
set -x ___fish_git_prompt_color_dirtystate (set_color red)
set -x ___fish_git_prompt_color_dirtystate_done (set_color normal)
set -x ___fish_git_prompt_color_stagedstate (set_color green)
set -x ___fish_git_prompt_color_stagedstate_done (set_color normal)
set -x ___fish_git_prompt_color_untrackedfiles (set_color red)
set -x ___fish_git_prompt_color_untrackedfiles_done (set_color normal)
set -x ___fish_git_prompt_char_untrackedfiles '?'
set -x ___fish_git_prompt_char_stateseparator ''

fish_vi_mode

eval (hub alias -s)
# complete --command hub --wraps git
# complete --command g --wraps git
