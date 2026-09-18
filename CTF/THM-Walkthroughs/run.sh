last_day=""
for d in Day*/; do
    d="${d%/}"
    if [[ "$d" =~ ^Day([0-9]+) ]]; then
        n="${BASH_REMATCH[1]}"
        if [[ -z "$last_day" || "$n" -gt "$last_day" ]]; then
            last_day="$n"
        fi
    fi
done
 
if [ -z "$last_day" ]; then
    next_day=1
else
    next_day=$((last_day + 1))
fi
 
folder_name="Day${next_day}"
 
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
 
if [ -n "$last_day" ]; then
    # match the previous day's folder whether or not it has a
    # room-name suffix already
    prev_folder=$(ls -d "Day${last_day}" "Day${last_day}-"* 2>/dev/null | head -1)
    if [ -n "$prev_folder" ] && [ -f "$prev_folder/README.md" ]; then
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
