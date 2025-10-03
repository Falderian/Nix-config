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

  environment.systemPackages = with pkgs; [
    gnomeExtensions.vitals
    #gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.status-icons
    gnomeExtensions.top-panel-notification-icons-w-count
    btop-rocm
    gnome-tweaks
    gnomeExtensions.soft-brightness-plus
    nordzy-icon-theme
    nordic
    posy-cursors    
    nautilus
  ];
}
