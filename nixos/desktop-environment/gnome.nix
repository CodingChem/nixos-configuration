{config, pkgs, ...}:

{
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
# Gnome apps i do want
  environment.systemPackages = with pkgs; [
  gnome.gnome-calendar
  ];
}
