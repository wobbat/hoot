# ~/.config/fish/functions/nv.fish
function nv
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end
