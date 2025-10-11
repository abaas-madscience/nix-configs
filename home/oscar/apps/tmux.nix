{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
        '';
      }
    ];
    extraConfig = ''
      set -g prefix C-a
      bind C-a send-prefix
    '';
  };

  home.packages = [ pkgs.tmux ];
}
