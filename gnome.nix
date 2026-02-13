# /etc/nixos/gnome.nix
{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs xterm];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnomeExtensions.top-panel-notification-icons-w-count
    gnomeExtensions.soft-brightness-plus
    gnomeExtensions.media-controls
    btop-rocm
    gnome-terminal
    zafiro-icons
    adw-gtk3
    nautilus
    wl-clipboard
  ];
}
