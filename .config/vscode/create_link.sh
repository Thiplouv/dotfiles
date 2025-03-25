if [[ "$OSTYPE" == "darwin"* ]]; then
    LINK_PATH="$HOME/Library/Application Support/Code/User/settings.json"
else
    LINK_PATH="$HOME/.config/Code/User/settings.json"
fi

# Removes config file if exits
[[ -f "$LINK_PATH" ]] &&
    echo "Config file exists, removing it..." &&
    rm "$LINK_PATH"

# Creates the symlink
echo "Creating symlink..." &&
    ln -s "$HOME/.config/vscode/settings.json" "$LINK_PATH"
