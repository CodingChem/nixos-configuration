#<---------------------------------------------->#
#               NixOS Config         -> by Vegard#
#<---------------------------------------------->#
{ config, pkgs, ... }:

{
  imports =
    [
# Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

#<---------------------------------------------->|
#             Gnome Settings                     |
#<---------------------------------------------->|
# Enable the X11 windowing system.
  services.xserver.enable = true;
# Remove Xterm:
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.desktopManager.xterm.enable = false;
# Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
# Configure keymap in X11 
  services.xserver = {
    layout = "no";
    xkbVariant = "";
  };
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];


#<---------------------------------------------->|
#             other Settings                     |
#<---------------------------------------------->|
# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
# Enable CUPS to print documents.
  services.printing.enable = false;
# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
# Enable networking
    networking.networkmanager.enable = true;
# Set your time zone.
  time.timeZone = "Europe/Oslo";
# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;
# For connecting airpods
# hardware.bluetooth.settings = { General = { ControllerMode = "bredr"; }; };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
# Enable the OpenSSH daemon.
# services.openssh.enable = true;

#<---------------------------------------------->|
#             Packages                           |
#<---------------------------------------------->|
#  Fonts:
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  environment.systemPackages = with pkgs; [
    vim
    home-manager
    git
    zsh
  ];
# List services that you want to enable:
  programs.zsh.enable = true;





# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vegard = {
    isNormalUser = true;
    description = "Vegard Seines";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };



# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
