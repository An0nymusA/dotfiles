install_vscode(){
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
  rm -f packages.microsoft.gpg
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code
}

# Zen browser
flatpak install flathub io.github.zen_browser.zen

# Spotify
flatpak install flathub com.spotify.Client

# Visual Studio Code
if ! [ -x "$(command -v code)" ]; then
  echo "Installing VS Code..."
  install_vscode
else
  echo "VS Code already installed"
fi

# RustDesk
flatpak install flathub com.rustdesk.RustDesk

# Termius
flatpak install flathub com.termius.Termius