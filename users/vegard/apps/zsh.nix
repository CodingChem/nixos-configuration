{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    history.path = ".config/zsh/zsh_history";
    syntaxHighlighting.enable = true;
    shellAliases = {
      source_system_config = "sudo nixos-rebuild switch --flake ~/.config/nixos/#vegard";
    };
    plugins = with pkgs; [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    ];
    envExtra = ''
      source ~/.p10k.zsh
      '';
  };
}
