cp /etc/nixos/configuration.nix .
cp /etc/nixos/kde.nix .
cp /etc/nixos/gnome.nix .
cp /etc/nixos/hyprland.nix .

git add .
git commit -m "update"
git push origin

