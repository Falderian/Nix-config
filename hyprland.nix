# /etc/nixos/hyprland.nix
{ pkgs, ... }:

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
    hyprland
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
    wayland
    bluetuith
    playerctl
    wl-clipboard
    marwaita-red
    zafiro-icons
    bash-completion
    wl-clip-persist
    nwg-look
    rofi
    glib
  ];
}
