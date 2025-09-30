# /etc/nixos/hyprland.nix
{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    waybar
    hyprpaper
    hyprshot
    hyprsunset
    pulsemixer
    wf-recorder
    celluloid
    swaynotificationcenter
    btop-rocm
    yazi
    capitaine-cursors
    rofi-wayland
    bluetuith
    playerctl
    wl-clipboard
    marwaita-red
    zafiro-icons
    bash-completion
    wl-clip-persist
    nwg-look
    gurk-rs
  ];
}
