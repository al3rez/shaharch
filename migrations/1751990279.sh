echo "Remove persistent workspaces from waybar configuration"

# Remove the persistent-workspaces section from waybar config
CONFIG_FILE="$HOME/.config/waybar/config"

if [ -f "$CONFIG_FILE" ]; then
    # Create backup
    cp "$CONFIG_FILE" "$CONFIG_FILE.bak"
    
    # Remove persistent-workspaces section using sed
    sed -i '/"persistent-workspaces":/,/^[[:space:]]*}/d' "$CONFIG_FILE"
    
    echo "Removed persistent workspaces from waybar config"
else
    echo "Waybar config not found at $CONFIG_FILE"
fi