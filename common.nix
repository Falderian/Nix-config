# /etc/nixos/common.nix
{ config, pkgs, ... }:

{  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  #virtualisation.libvirtd.enable = true;
  
  environment.systemPackages = with pkgs; [
    openvpn3
    spotify
    telegram-desktop
    slack
    nodejs
    pharo
    git
    vscodium  
    viber
    google-chrome
    gurk-rs
    celluloid
    micro

    #gnome-boxes
    #foot
    #waybar
    #hyprpaper
    #hyprshot
    #hyprsunset
    #pulsemixer
    #wf-recorder
    #celluloid
    #swaynotificationcenter
    #btop-rocm
    #yazi
    #capitaine-cursors
    #rofi-wayland
    #bluetuith
    #playerctl
    #wl-clipboard
    #marwaita-red
    #zafiro-icons
    #bash-completion
    #wl-clip-persist
    #nwg-look
    #gurk-rs
  ];


  #programs.hyprland = {
    #enable = true;
    #xwayland.enable = true;
  #};
  #services.hypridle.enable = true;
  #programs.hyprlock.enable = true;

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
  ];

  services.resolved.enable = true;
  programs.openvpn3.enable = true;
  programs.starship.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };

  fonts.packages = with pkgs; [
    rubik
    nerd-fonts.jetbrains-mono
  ];

  environment.etc."nanorc".text = ''
  	set tabsize 2
  	set tabstospaces
	'';
  
	programs.bash.shellAliases = {
    start-vpn="openvpn3 session-start --config ~/Projects/Synchrony/client.ovpn";
    start-synchrony="(cd ~/Projects/Synchrony/ui && npm run start:standalone) & (cd ~/Projects/Synchrony/IMS/Pharo11_dev && pharo --headless smt-base.image --script ../resources_project/SMT/scripts/start-ana>";
		edit-common="micro /etc/nixos/common.nix";
		edit-config="micro /etc/nixos/configuration.nix";
  };
}
