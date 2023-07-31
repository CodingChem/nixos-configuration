{config, pkgs, ...}:
{
#------------------------------------------------
#   Users                              
#------------------------------------------------
  users.users.vegard = {
    isNormalUser = true;
    description = "Vegard Seines";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
}
