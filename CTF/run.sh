last_day=$(ls -d Day* 2>/dev/null | grep -Eo '[0-9]+' | sort -n | tail -1)

if [ -z "$last_day" ]; then
    next_day=1
else
    next_day=$((last_day + 1))
fi

# Format number to Day##
folder_name=$(printf "Day%02d" "$next_day")

echo "Creating $folder_name ..."
mkdir "$folder_name"
cd "$folder_name"
touch README.md

if command -v open >/dev/null 2>&1; then
    open README.md
else
    xdg-open README.md
fi

cd ..
if [ ! -z "$last_day" ]; then
    prev_folder=$(printf "Day%02d" "$last_day")
    if [ -f "$prev_folder/README.md" ]; then
        echo "Opening previous README.md ($prev_folder/README.md)..."
        if command -v open >/dev/null 2>&1; then
            open "$prev_folder/README.md"
        else
            xdg-open "$prev_folder/README.md"
        fi
    else
        echo "Previous folder exists but has no README.md."
    fi
fi

echo "Done!"
