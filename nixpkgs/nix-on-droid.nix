{ config, lib, pkgs,  ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    neovim # or some other editor, e.g. nano or neovim
    zsh
    git
    curl
    gawk
    ncurses5

    wget
    nettools
    sudo

    iproute2
    # Some common stuff that people expect to have
    diffutils
    gnugrep
    findutils
    utillinux
    tzdata
    hostname
    openssh
    #man
    #gnugrep
    p7zip
    pv
    dialog
    coreutils
    #whiptail
    bc
    #secure-delete
    #zenity
    starship
    nmap
    gnupg
    gnused
    gnutar
    fortune
    lolcat
    cowsay
    bzip2
    gzip
    xz
    zip
    unzip

    nix-info
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";


  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  user.shell = "${pkgs.zsh}/bin/zsh";

  # Set up nix for flakes
  #nix.extraOptions = ''
  #  experimental-features = nix-command flakes
  #'';
  #networking.nameservers = [ "192.168.1.1" ];

  # Set your time zone
  time.timeZone = "Pacific/Auckland";

  # After installing home-manager channel like
  #   nix-channel --add https://github.com/rycee/home-manager/archive/release-23.05.tar.gz home-manager
  #   nix-channel --update
  # you can configure home-manager in here like
  home-manager = {
    useGlobalPkgs = true;
    
  
    config =
      { config, lib, pkgs, ... }:
      {
        # Read the changelog before changing this value
        home.stateVersion = "23.05";

  
        # insert home-manager config
	home.packages = with pkgs; [
	   htop
	   fortune
	   dig
	   bc
	   android-tools
	   which
	   nerdfonts
	   zsh
	];
	programs.home-manager.enable = true;
      };
  };
 # users.defaultUserShell = pkgs.zsh;
      #programs = {
      #        zsh = {
      #  	      enabled = true;
      #        };
      #};
}

# vim: ft=nix
