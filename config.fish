eval (python -m virtualfish auto_activation global_requirements projects)

set -x __fish_git_prompt_showdirtystate true
set -x ___fish_git_prompt_color_branch (set_color blue)
set -x ___fish_git_prompt_color_branch_done (set_color normal)
set -x ___fish_git_prompt_color_dirtystate (set_color red)
set -x ___fish_git_prompt_color_dirtystate_done (set_color normal)
set -x ___fish_git_prompt_color_stagedstate (set_color green)
set -x ___fish_git_prompt_color_stagedstate_done (set_color normal)

fish_vi_mode
