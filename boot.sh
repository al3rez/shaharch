ascii_art=' ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████    ▄████████  ▄████████    ▄█    █▄    ▄██   ▄  
███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███   ███    ███ ███    ███   ███    ███   ███   ██▄
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    █▀    ███    ███   ███▄▄▄███
███    ███ ███   ███   ███   ███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ▀▀▀▀▀▀███
███    ███ ███   ███   ███ ▀███████████ ▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ▄██   ███
███    ███ ███   ███   ███   ███    ███ ▀███████████ ███    █▄    ███    ███   ███   ███
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    ███   ███    ███   ███   ███
 ▀██████▀   ▀█   ███   █▀    ███    █▀    ███    ███ ████████▀    ███    █▀     ▀█████▀ 
                                          ███    ███                                    '

echo -e "\n$ascii_art\n"

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Shaharch..."
rm -rf ~/.local/share/shaharch/
git clone https://github.com/basecamp/shaharch.git ~/.local/share/shaharch >/dev/null

# Use custom branch if instructed
if [[ -n "$SHAHARCH_REF" ]]; then
  echo -e "\eUsing branch: $SHAHARCH_REF"
  cd ~/.local/share/shaharch
  git fetch origin "${SHAHARCH_REF}" && git checkout "${SHAHARCH_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/shaharch/install.sh
