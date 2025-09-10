# ~/.config/fish/config.fish
# Only run in interactive shells
if status is-interactive
    # Colors and greeting
    set fish_color_error normal
    set fish_color_command green
    set fish_greeting ""

    # Source modular config files
    source ~/.config/fish/paths.fish
    source ~/.config/fish/aliases.fish
    source ~/.config/fish/plugins.fish
    source ~/.config/fish/startup.fish
    source ~/.owl/env.fish
end
