set -u

header() {
    echo
    echo "========================================================================================================================"
    echo "=== $1"
    echo "========================================================================================================================"
    echo
}

header "Nobara Updates"
nobara-sync cli

header "Flatpak Updates"
flatpak update

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
