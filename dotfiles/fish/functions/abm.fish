# ~/.config/fish/functions/abm.fish
function abm
    printf "%s - %s\n" \
        (gum input --placeholder 'Enter the bookmark description' --cursor.foreground '#7e4a3e' --prompt '> ' --width 80) \
        (gum input --placeholder 'Enter the bookmark URL' --cursor.foreground '#7e4a3e' --prompt '> ' --width 80) >> $HOME/_/bookmarks/bookmarks.txt
end
