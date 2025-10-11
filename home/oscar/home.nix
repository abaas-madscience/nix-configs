{ config, pkgs, ... }:
{
  imports = [
    ./apps/zsh.nix
    ./apps/tmux.nix
    ./apps/zed-editor.nix
    ./apps/starship.nix
  ];

  home.username = "oscar";
  home.homeDirectory = "/home/oscar";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  # Provide a default cursor size to avoid Stylix coercion errors
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  # Ensure xresources cursor size is also set
  xresources.properties = {
    "Xcursor.size" = "24";
  };
  # Override Stylix cursor size to avoid null coercion
  stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
  # Override Stylix cursor size to avoid null coercion
  stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
