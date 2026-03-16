# /etc/nixos/gnome.nix
{ pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    xterm
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    btop-rocm
    gnome-terminal
    adw-gtk3
    nautilus
    wl-clipboard
    fragments
    gnome-tweaks
    numix-icon-theme-circle
  ];
}
