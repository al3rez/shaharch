# Use dark mode for QT apps too (like kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/shaharch/themes
for f in ~/.local/share/shaharch/themes/*; do ln -s "$f" ~/.config/shaharch/themes/; done

# Set initial theme
mkdir -p ~/.config/shaharch/current
ln -snf ~/.config/shaharch/themes/tokyo-night ~/.config/shaharch/current/theme
source ~/.local/share/shaharch/themes/tokyo-night/backgrounds.sh
ln -snf ~/.config/shaharch/backgrounds/tokyo-night ~/.config/shaharch/current/backgrounds
ln -snf ~/.config/shaharch/current/backgrounds/1-Pawel-Czerwinski-Abstract-Purple-Blue.jpg ~/.config/shaharch/current/background

# Set specific app links for current theme
ln -snf ~/.config/shaharch/current/theme/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/shaharch/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/shaharch/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/shaharch/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/shaharch/current/theme/mako.ini ~/.config/mako/config
