# ~/.config/fish/functions/tdy.fish
function tdy
    set current_year (date "+%Y")
    set current_date (date "+%d-%m-%Y")
    set journal_dir "$HOME/_/journal/$current_year"
    set file_name "$journal_dir/$current_date.md"

    if not test -d $journal_dir
        echo "Creating directory: $journal_dir"
        mkdir -p $journal_dir
    end

    if not test -e $file_name
        echo "File does not exist. Creating: $file_name"
        touch $file_name
    end

    nvim $file_name
end
