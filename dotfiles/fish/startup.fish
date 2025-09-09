# Autostart Hyprland or startx on TTY1 local login
if test (uname) = "Linux"
    and test -z "$SSH_CONNECTION"
    and test (basename (tty)) = "tty1"
    set -l host (cat /etc/hostname)
    switch $host
        case mew
            # Only guard against X already running
            if test -z "$DISPLAY"
                exec startx
            end
        case '*'
            # Guard against both X and Wayland already running
            if test -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY"
                set -x XDG_SESSION_TYPE wayland
                set -x WINIT_UNIX_BACKEND wayland
                set -x WEZTERM_BACKEND wayland
                exec Hyprland
            end
    end
end
