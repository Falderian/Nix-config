# /etc/nixos/gnome.nix
{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.vitals
    gnomeExtensions.tray-icons-reloaded
    kitty
    btop-rocm
    gnome-tweaks
    colloid-gtk-theme
    colloid-icon-theme
    yaziPlugins.nord
    yazi
    gnomeExtensions.soft-brightness-plus
    capitaine-cursors
    nordzy-icon-theme
    kanagawa-icon-theme
  ];
}
