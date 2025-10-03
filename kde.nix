# /etc/nixos/kde.nix
{ config, pkgs, ... }:


{ 
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kwalletmanager
    dolphin   
    elisa
    ark
    gwenview
    kinfocenter
    khelpcenter
    kate
    kwallet
    kmenuedit
    okular
    konsole
  ];
 }
