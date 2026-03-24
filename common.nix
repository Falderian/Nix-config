# /etc/nixos/common.nix
{ pkgs, ... }:

{
  imports = [
    # ./gnome.nix
    # ./hyprland.nix
    ./kde.nix
  ];

  boot.loader.systemd-boot.configurationLimit = 2;
  #	virtualisation.libvirtd.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball "https://github.com/oskardotglobal/.dotfiles/archive/nix.tar.gz"))
  ];

  environment.systemPackages = with pkgs; [
    openvpn3
    spotify
    slack
    nodejs
    pharo
    git
    vscodium
    #viber
    celluloid
    floorp-bin
    faugus-launcher

    typescript
    vtsls
    biome
    p7zip
    telegram-desktop
    ncdu

    helix
    nixfmt
    nixd

    zip
    unzip

    wl-clipboard

    kdiskmark
    ntfs3g
  ];

  programs.openvpn3.enable = true;
  programs.starship.enable = true;
  programs.nix-ld.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Inter" ];
        serif = [ "Inter" ];
      };
      hinting = {
        enable = true;
        autohint = false;
        style = "medium";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default"; # <-- исправлено
      };
      antialias = true;
      useEmbeddedBitmaps = false;
    };
  };

  boot.tmp.useTmpfs = true;

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "00/3";
      options = "--delete-older-than 3d";
    };
  };
  services.fstrim.enable = true;

  environment.etc."nanorc".text = ''
        set linenumbers
        set autoindent
        set tabsize 2
        set tabstospaces
        set softwrap
        set constantshow 
        set historylog
        set smarthome
        set positionlog
        set boldtext
    	'';

  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch && nix-collect-garbage -d";
    edit-config = "sudo hx /etc/nixos/configuration.nix";
    edit-common = "sudo hx /etc/nixos/common.nix";
    edit-pc = "sudo hx /etc/nixos/pc.nix";
    edit-gnome = "sudo hx /etc/nixos/gnome.nix";
    edit-kde = "sudo hx /etc/nixos/kde.nix";
    edit-hyprland = "sudo hx /etc/nixos/hyprland.nix";
    start-vpn = "openvpn3 session-start --config ~/Projects/Synchrony/client.ovpn";
    start-ovpn = "openvpn3 session-start --config ~/Projects/Synchrony/profile-userlocked.ovpn";
    start-synchrony = ''
      		(
            cd "$HOME/Projects/Synchrony/PFC/automation/local/" \
            && ./start-analytics-server.sh "$HOME/Projects/Synchrony/Pharo11_dev" "$HOME/Projects/Synchrony/Pharo10_image" PFC 8080
          ) &
          (
            cd "$HOME/Projects/Synchrony/ui" \
            && npm run start:standalone
          ) &
          wait
      		'';
  };
}
