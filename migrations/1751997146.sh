echo "Replace chromium with google-chrome-canary"

# Remove chromium if installed
if pacman -Qs chromium > /dev/null; then
    echo "Removing chromium..."
    yay -R --noconfirm chromium
fi

# Install google-chrome-canary
echo "Installing google-chrome-canary..."
yay -S --noconfirm --needed aur/google-chrome-canary

# Replace chromium with google-chrome-canary in config files
echo "Updating config files..."

# Update bash functions
sed -i 's/chromium/google-chrome-canary/g' "$HOME/.local/share/shaharch/default/bash/functions"

# Update hyprland config
sed -i 's/chromium/google-chrome-canary/g' "$HOME/.config/hypr/hyprland.conf"

# Update windows.conf - handle both cases
sed -i 's/Chromium/Google-chrome-canary/g' "$HOME/.local/share/shaharch/default/hypr/windows.conf"
sed -i 's/chromium/google-chrome-canary/g' "$HOME/.local/share/shaharch/default/hypr/windows.conf"

echo "Config files updated"

