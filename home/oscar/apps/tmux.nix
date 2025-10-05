{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    extraConfig = ''
      set -g prefix C-a
      bind C-a send-prefix
      set -g status-bg colour235
      set -g status-fg white
    '';
  };

  home.packages = [ pkgs.tmux ];
}
