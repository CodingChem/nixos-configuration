{ config, pkgs, ... }:

{
  home.username = "vegard";
  home.homeDirectory = "/home/vegard";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    kitty
    neovim
    tmux
    bitwarden
    google-chrome
    nodejs_20
    wget
    unzip
    python312
    gnumake
    gcc
    obsidian
    onedrive
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  imports = [
    ./apps/zsh.nix
    ./apps/tmux.nix
  ];
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    # Git config
    git = {
      enable = true;
      userName = "Vegard Seines";
      userEmail = "vegsei@gmail.com";
    };
  };
}
