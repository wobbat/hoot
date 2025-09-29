# OS-specific path setup
switch (uname)
    case Linux
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/go/bin
        fish_add_path $HOME/.local/npm-global/bin
        fish_add_path $HOME/.local/bin
        fish_add_path $HOME/.bun/bin
        fish_add_path $HOME/.nimble/bin
        [ -f ~/.owl/env.fish ] && source ~/.owl/env.fish
    case Darwin
        if type -q /opt/homebrew/bin/brew
            eval (/opt/homebrew/bin/brew shellenv)
        end
        fish_add_path $HOME/go/bin
end
