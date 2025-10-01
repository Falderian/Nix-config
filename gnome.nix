# /etc/nixos/gnome.nix
{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  services.xserver.excludePackages = with pkgs; [ xterm ];
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs xterm];

  programs.yazi.enable = true;
  
  environment.systemPackages = with pkgs; [
    gnomeExtensions.vitals
    gnomeExtensions.tray-icons-reloaded
    kitty
    btop-rocm
    gnome-tweaks
    yaziPlugins.nord
    gnomeExtensions.soft-brightness-plus
    nordzy-icon-theme
    whitesur-gtk-theme
    posy-cursors
  ];
}
