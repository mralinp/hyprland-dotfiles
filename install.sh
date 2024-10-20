#!/bin/bash

# Install yay if it's not already installed
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."

    # Clone yay repository
    git clone https://aur.archlinux.org/yay.git /opt/yay

    # Change ownership of the /opt/yay directory to the current user
    sudo chown -R "$USER:$USER" /opt/yay

    # Change to the yay directory
    cd /opt/yay || exit

    # Install yay using makepkg
    makepkg -si --noconfirm

    # Return to the original directory
    cd - || exit
else
    echo "yay is already installed."
fi

# Update the system and install essential packages
yay -Syu

# Install required packages using yay
yay -S --needed \
    waybar \
    sway \
    hyprland-git \
    hyprlock \
    wlogout \
    dunst \
    rofi \
    swww \
    mate-polkit \
    blueberry \
    ranger \
    pavucontrol \
    nm-connection-editor \
    neofetch \
    kitty \
    nerd-fonts-complete \
    noto-fonts \
    noto-fonts-emoji \
    ttf-font-awesome \
    ttf-dejavu \
    ttf-droid \
    gthumb \
    python \
    python-pip \
    python-pillow \
    xdg-desktop-portal-hyprland-git \
    pipewire \
    wireplumber

# Clone the Hyprland configuration repository
REPO_URL="https://github.com/mralinp/hyprland-dotfiles.git"
CONFIG_DIR="$HOME/.config"
WALLPAPERS_DIR="$HOME/Pictures/backgrounds"

# Create the config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Clone the repository
if [ ! -d "$HOME/hyprland-dotfiles" ]; then
    git clone "$REPO_URL" "$HOME/hyprland-dotfiles"
fi

# Copy configuration files to the Hyprland config directory
cp -r "$HOME/hyprland-dotfiles/dotconfig/*" "$CONFIG_DIR/"
# Copy wallpapers
mkdir -p "$WALLPAPERS_DIR"
cp "$HOME/hyprland-dotfiles/wallpapers/*" "$WALLPAPERS_DIR"

# Final message
echo "Hyprland configuration complete. You can start your session now!"
