{ config, pkgs, ... }:
{
  imports = [
    ./apps/zsh.nix
    ./apps/tmux.nix
    ./apps/zed-editor.nix
  ];

  home.username = "oscar";
  home.homeDirectory = "/home/oscar";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
