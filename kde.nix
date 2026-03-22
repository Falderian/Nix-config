# /etc/nixos/kde.nix
{ pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kwalletmanager
    elisa
    ark
    gwenview
    kinfocenter
    khelpcenter
    kate
    kwallet
    kmenuedit
    okular
  ];

  environment.systemPackages = with pkgs; [
    # kdePackages.plasma-workspace-wallpapers
  ];
}
