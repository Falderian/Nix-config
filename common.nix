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
		konsave
				
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
    set titlecolor brightmagenta,black      # Заголовок — ярко-фиолетовый на черном фоне (iris spring)
    set statuscolor brightwhite,magenta     # Статусбар — ярко-белый текст на пурпурном фоне (iris spring)
    set numbercolor brightwhite,black       # Номера строк — ярко-белый на черном фоне (читаемые)
    set selectedcolor black,brightmagenta   # Выделение — черный текст на ярко-фиолетовом фоне (акцент)
    set keycolor brightblue,black           # Клавиши — яркий бирюзовый на черном (близко к Breezze)
    set functioncolor brightmagenta,black   # Функции — ярко-фиолетовый на черном
    set errorcolor brightwhite,red          # Ошибки — ярко-белый на красном (стандартно выделяет)
    set stripecolor black,brightwhite       # Полосы — черный на ярко-белом (контраст)
	'';
	
	programs.bash.shellAliases = {
		edit-config="nano -l /etc/nixos/configuration.nix";
		edit-common="nano -l /etc/nixos/common.nix";
		start-vpn="openvpn3 session-start --config ~/Projects/Synchrony/client.ovpn";
		start-synchrony = ''
		  (cd ~/Projects/Synchrony/ui && npm run start:standalone) & \
		  (cd ~/Projects/Synchrony/IMS/Pharo11_dev && \
		   pharo --headless smt-base.image \
		         --script ../resources_project/SMT/scripts/start-analytics-server.st \
		         -- workspace=IMS) & \
		  wait
		'';
	};
}
