# ~/.config/fish/config.fish
# my custom dotfiles
# Only run in interactive shells
if status is-interactive
    # Colors and greeting
    set fish_color_error normal
    set fish_color_command green
    set fish_greeting ""

    # Core env
    set -gx GOPATH $HOME/go
    set -gx EDITOR nvim

    # Skip Wayland vars on specific hosts
    set -l host (cat /etc/hostname)
    if test "$host" != "fawkes"; and test "$host" != "mew"
        set -gx MOZ_ENABLE_WAYLAND 1
        set -gx OZONE_PLATFORM wayland
    end

    # OS specific path setup
    switch (uname)
    case Linux
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/go/bin
        fish_add_path $HOME/.local/npm-global/bin
        fish_add_path $HOME/.bun/bin
        [ -f ~/.owl/env.fish ] && source ~/.owl/env.fish
    case Darwin
        if type -q /opt/homebrew/bin/brew
            eval (/opt/homebrew/bin/brew shellenv)
        end
        fish_add_path $HOME/go/bin
    end

    # Aliases
    alias spc "aspell -no-backup -c"
    alias cl "clear"
    alias bt "bluetui"
    alias gofmt "goimports"
    # alias xt3 'exiftool -Model="RICOH GR III" -UniqueCameraModel="RICOH GR III" -T -ext dng .'
    # alias 3tx 'exiftool -Model="RICOH GR IIIx" -UniqueCameraModel="RICOH GR IIIx" -T -ext dng .'
    alias vim "nvim"
    alias n "nvim"
    alias backlight "sudo light -s sysfs/backlight/intel_backlight -S"
    alias sbm 'cat ~/_/bookmarks/bookmarks.txt | fzf --border=rounded --prompt="Search Bookmarks > "  --bind="enter:execute-silent(xdg-open {-1})+abort" --preview="echo {-1}"  --preview-window="up,1" --color=16 --layout=reverse'
    alias oc 'bun run ~/dev/opencode/packages/opencode/src/index.ts'
    alias la "eza -a --group-directories-first"
    alias lal "eza -la --group-directories-first"
    alias lsl "eza -l --group-directories-first"
    alias ls "eza --group-directories-first"
    alias tm "tmux new -As0"
    alias tmc "tmux new -Ascode"
    alias nos "sudo nixos-rebuild switch --flake /home/wobbat/.wobble"

    # Prompt and directory jumper if present
    if type -q starship
        starship init fish | source
    end
    if type -q zoxide
        zoxide init fish | source
    end

    # Vi keybindings
    fish_vi_key_bindings

    # Autostart Hyprland or startx on TTY1 local login
if test (uname) = "Linux"
    and test -z "$SSH_CONNECTION"
    and test (basename (tty)) = "tty1"
    if test (cat /etc/hostname) = "mew"
        # Only guard against X already running
        if test -z "$DISPLAY"
            exec startx
        end
    else
        # Guard against both X and Wayland already running
        if test -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY"
            set -x XDG_SESSION_TYPE wayland
            set -x WINIT_UNIX_BACKEND wayland
            set -x WEZTERM_BACKEND wayland
            exec Hyprland
        end
    end
end

    # opam init (safe to remove if not needed)
    if test -r "$HOME/.opam/opam-init/init.fish"
        source "$HOME/.opam/opam-init/init.fish" ^/dev/null
    end
end
