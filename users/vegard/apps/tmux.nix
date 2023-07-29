{pkgs, ...}:
{
  tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    prefix = "C-a";
    terminal = "screen-256color";
    plugins = with pkgs; [
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '5' # minutes
        '';
    }
    {
      plugin = tmuxPlugins.vim-tmux-navigator;
      extraConfig = ''

        '';
    }
    {
      plugin = tmuxPlugins.catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavour 'frappe'
        set -g @catppuccin_powerline_icons_theme_enabled on
        set -g @catppuccin_l_left_separator ""
        set -g @catppuccin_l_right_separator ""
        set -g @catppuccin_r_left_separator ""
        set -g @catppuccin_r_right_separator ""
        '';
    }
    ];
  };
}
