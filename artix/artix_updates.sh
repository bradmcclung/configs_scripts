set -u

header() {
    echo
    echo "========================================================================================================================"
    echo "=== $1"
    echo "========================================================================================================================"
    echo
}

header "Paru Updates"
paru -Syu --combinedupgrade

header "Clean Paccache"
paccache -rk2
paccache -urk1

header "Git Repos"
for repo in \
    "$HOME/Documents/latex" \
    "$HOME/Documents/configs_scripts" \
    "$HOME/Documents/my_logs"
do
    if [ -d "$repo/.git" ]; then
        echo "-------------------- $repo"
        git -C "$repo" pull --ff-only
    else
        echo "Skipping missing repo: $repo"
    fi
    echo
done

header "Check Orphans"
pacman -Qdt
