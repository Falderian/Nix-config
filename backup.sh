cp /etc/nixos/configuration.nix .
cp /etc/nixos/common.nix .
cp /etc/nixos/kde.nix .
cp /etc/nixos/gnome.nix .
cp /etc/nixos/hyprland.nix .
cp /etc/nixos/pc.nix .
cp -r  ~/.config/helix .

git add .
git commit -m "update"
git push origin

