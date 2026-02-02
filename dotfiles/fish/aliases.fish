# Aliases
alias cl "clear"
alias bt "bluetui"
alias vim "nvim"
alias n "nvim"
alias backlight "sudo light -s sysfs/backlight/intel_backlight -S"
alias la "eza -a --group-directories-first"
alias lal "eza -la --group-directories-first"
alias lsl "eza -l --group-directories-first"
alias ls "eza --group-directories-first"
alias cat "bat --theme=ansi --style=plain"

# not sure yet
alias car "cargo run"
alias cr "cargo run -q"
alias sd "sudo-rs"
alias tm "tmux new -As0"
alias tmc "tmux new -Ascode"


# JJ
alias jjsm "jj msc && jj git push"

# Opencode
alias ocdesk "git -C /home/wobbat/dev/opencode reset --hard && git -C /home/wobbat/dev/opencode pull && jq '.app.windows[0].decorations = false' /home/wobbat/dev/opencode/packages/desktop/src-tauri/tauri.conf.json > /home/wobbat/dev/opencode/packages/desktop/src-tauri/tauri.conf.json.tmp && mv /home/wobbat/dev/opencode/packages/desktop/src-tauri/tauri.conf.json.tmp /home/wobbat/dev/opencode/packages/desktop/src-tauri/tauri.conf.json && bun run --cwd /home/wobbat/dev/opencode/packages/desktop tauri dev"


function jd
    jj describe -m "$argv"
end
