#<---------------------------------------------->#
#               NixOS Config         -> by Vegard#
#<---------------------------------------------->#
{ config, pkgs, ... }:

{
  imports =
    [
#================================================
# Include the results of the hardware scan.
    ./hardware-configuration.nix
#================================================
# Desktop-environment
#------------------------------------------------
#   Gnome                              
#------------------------------------------------    
    ./desktop-environment/gnome.nix
#================================================
# Users                  
#------------------------------------------------
    ./users/vegard/default.nix
#================================================
# Nvidia driver (enable if using nvidia GPU)
#------------------------------------------------
    ./nvidia.nix
    ];
#================================================|
# System Settings                                |
#------------------------------------------------|
#   Bootloader settings                |
#-------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#-------------------------------------------------
#   Language & Region          
#-------------------------------------------------
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Oslo";
#-------------------------------------------------
#   Sound
#-------------------------------------------------
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
# For connecting airpods or other tricky bluetooth devices, uncomment the following line
# After pairing the devices this can be commented again
# hardware.bluetooth.settings = { General = { ControllerMode = "bredr"; }; };
#-------------------------------------------------
#   Networking                 
#-------------------------------------------------
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
# Enable the OpenSSH daemon.
# services.openssh.enable = true;
#------------------------------------------------
#   System Packages                           
#------------------------------------------------
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;
#  Fonts:
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  environment.systemPackages = with pkgs; [
    vim
    home-manager
    git
    zsh
    xclip
  ];
#------------------------------------------------
#   Services                           
#------------------------------------------------
# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;
# Enable CUPS to print documents.
  services.printing.enable = false;
  programs.zsh.enable = true;
#------------------------------------------------
  system.stateVersion = "23.05"; # Dont touch
}
