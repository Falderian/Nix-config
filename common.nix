# /etc/nixos/common.nix
{ config, pkgs, ... }:

{	
  imports = [
    ./gnome.nix
    #./hyprland.nix
    #./kde.nix
  ];

  
	boot.loader.systemd-boot.configurationLimit = 1;

#	virtualisation.libvirtd.enable = true;
	
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
		brave
		gurk-rs
		celluloid
		kitty
	];

	services.resolved.enable = true;
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

	fonts.packages = with pkgs; [
		rubik
		nerd-fonts.jetbrains-mono
	];

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
		edit-config="sudo nano /etc/nixos/configuration.nix";
		edit-common="sudo nano /etc/nixos/common.nix";
		edit-gnome="sudo nano /etc/nixos/gnome.nix";
    edit-kde="sudo nano /etc/nixos/kde.nix";
    edit-hyprland="sudo nano /etc/nixos/hyprland.nix";
		start-vpn="openvpn3 session-start --config ~/Projects/Synchrony/client.ovpn";
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
