# ~/.config/fish/functions/dr.fish
function dr
    set dir (pwd)
    while test "$dir" != "/"
        if test -f "$dir/dub.sdl" -o -f "$dir/dub.json"
            command dub -q --root "$dir" $argv
            return
        end
        set dir (dirname "$dir")
    end
    echo "No dub project found above this directory"
    return 1
end

function dra
    set dir (pwd)
    while test "$dir" != "/"
        if test -f "$dir/dub.sdl" -o -f "$dir/dub.json"
            command dub -q --root "$dir" $argv --
            return
        end
        set dir (dirname "$dir")
    end
    echo "No dub project found above this directory"
    return 1
end
