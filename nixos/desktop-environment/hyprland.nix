{config, pkgs, ...}:
{
#<---------------------------------------------->|
#             Hyprland Settings                  |
#<---------------------------------------------->|
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
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
    nvidia.modsetting.enable = true;
  };
  environment.systemPackages = [
  (pkgs.waybar.overrideAttrs (oldAttrs: {
                              mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
                              })
  )
    pkgs.mako
    pkgs.wl-clipboard
    pkgs.libnotify
    pkgs.swww
    pkgs.rofi-wayland
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

