# Prompt and directory jumper if present
if type -q starship
    starship init fish | source
end
if type -q zoxide
    zoxide init fish | source
end

# Vi keybindings
#fish_vi_key_bindings

# opam init (safe to remove if not needed)
if test -r "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" ^/dev/null
end
