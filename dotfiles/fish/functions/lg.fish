# ~/.config/fish/functions/lg.fish
function lg
    fzf --phony \
        --bind "change:reload(rg --vimgrep {q} | cut -d: -f1,2 | uniq || true)" \
        --delimiter=':' \
        --preview 'bash -c "bat --wrap auto --terminal-width 90 --color=always \"\$1\" --highlight-line \"\$2\" --line-range \$(( \$2 > 3 ? \$2 - 3 : 1 )): --theme=ansi 2>/dev/null || echo \"Nothing found (yet)\"" bash {1} {2} 2>/dev/null' \
        --preview-window='right,80%' \
        --height 90% \
        --border=rounded \
        --prompt="find :: " \
        --color=16 \
        --layout=reverse \
    | awk -F':' '{print $1 " +" $2}' \
    | xargs -r sh -c '$EDITOR "$@"' --
end
