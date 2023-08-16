{config, pkgs, ...}:
{
#<---------------------------------------------->|
#             Hyprland Settings                  |
#<---------------------------------------------->|
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
  services.blueman.enable = true;
  environment.sessionVariables = {
# Invisible coursor fix
    WLR_NO_HARDWARE_COURSORS = "1";
# Enable wayland for electron apps
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
#Opengl
    opengl.enable = true;

# Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };
  environment.systemPackages = [
  (pkgs.waybar.overrideAttrs (oldAttrs: {
                              mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
                              })
  )
    pkgs.dunst
    pkgs.wl-clipboard
    pkgs.libnotify
    pkgs.swww
    pkgs.rofi-wayland
    pkgs.networkmanagerapplet
    pkgs.bluez
    pkgs.bluez-tools
  ];
  xdg.portal.enable = true;
#  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
