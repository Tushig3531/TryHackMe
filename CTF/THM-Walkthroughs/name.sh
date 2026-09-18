set -uo pipefail
 
for dir in Day*/; do
    dir="${dir%/}"
 
    if [[ ! "$dir" =~ ^Day([0-9]+)$ ]]; then
        continue
    fi
    num="${BASH_REMATCH[1]}"
 
    readme="$dir/README.md"
    if [[ ! -f "$readme" ]]; then
        echo "skip $dir: no README.md"
        continue
    fi
 
    names=$(grep -oE '\[[^]]+\]\(https://tryhackme\.com/room/[^)]*\)' "$readme" \
            | awk '{
                url = $0
                sub(/^\[[^]]+\]\(/, "", url)
                sub(/\)$/, "", url)
                if (!(url in seen)) { seen[url] = 1; print }
              }' \
            | sed -E 's/^\[//; s/\]\(.*$//' \
            | sed -E 's/^\*+//; s/\*+$//; s/^ +//; s/ +$//' \
            | sed 's#/# #g') || true
 
    if [[ -z "$names" ]]; then
        echo "skip $dir: no room link found"
        continue
    fi
 
    joined=$(echo "$names" | paste -sd, - | sed 's/,/, /g')
    newname="Day${num}-${joined}"
 
    if [[ "$dir" == "$newname" ]]; then
        continue
    fi
 
    if [[ "${DRY_RUN:-0}" == "1" ]]; then
        echo "would rename: $dir  ->  $newname"
    else
        echo "renaming: $dir  ->  $newname"
        mv -- "$dir" "$newname"
    fi
done
